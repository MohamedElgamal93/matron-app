import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'dart:ui';

import 'package:android_path_provider/android_path_provider.dart';
import 'package:environment/data/shared_prefrences.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:environment/util/notifications_helper.dart';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

import 'applocalizations.dart';
import 'constants/show_log.dart';

/// This widget is used to download any type of files it takes [TargetPlatform]
/// and also a [DownloadInfo] object with details about
/// the file to be downloaded and optional widget to have the download action
/// if no child Widget is provided [DownloadItem] will be used it shows
/// download material icon with optional [Color] param.

class DownloadConfiguration extends StatefulWidget with WidgetsBindingObserver {
  final TargetPlatform? platform;
  final DownloadInfo downloadInfo;
  final Color iconColor;
  final Widget? child;

  /// a flag indicating if the file already exists on the server or will
  /// be generated when download request is made
  final bool isFileGenerated;

  DownloadConfiguration({
    Key? key,
    this.platform,
    required this.downloadInfo,
    required this.isFileGenerated,
    this.child,
    this.iconColor = const Color(0xffC2C2C2),
  }) : super(key: key);

  @override
  _DownloadConfigurationState createState() => _DownloadConfigurationState();
}

class _DownloadConfigurationState extends State<DownloadConfiguration> {
  late AppLocalizations localizations;
  bool _permissionReady = false;
  String _localPath = "";
  late NotificationsHelper notificationsHelper;

  //must be static as lookUpByPort function is static so only accept static params
  static const String _downloadPort = "downloader_send_port";
  final ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();
    widget.downloadInfo.name = widget.downloadInfo.name!.replaceAll(" ", '-');
    _getPermission();
    _bindBackgroundIsolate();
    FlutterDownloader.registerCallback(downloadCallback);
    // _prepare();
  }

  @override
  void dispose() {
    _unbindBackgroundIsolate();
    super.dispose();
  }

  _getPermission() {
    Permission.storage;
  }

  void _bindBackgroundIsolate() {
    bool isSuccess =
        IsolateNameServer.registerPortWithName(_port.sendPort, _downloadPort);
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }

    /// listen for download progress updates coming from background
    /// and handling it in main isolate
    ///
    /// data is a `List` where the first item at:
    /// index 0 -> task id
    /// index 1 -> is [DownloadTaskStatus] object
    /// index 2 -> is progress value %
    ///
    /// this data can be changed send more details or remove any data
    /// in [downloadCallback] method via task [SendPort]
    ///
    _port.listen((dynamic data) {
      showLog("download file binding", 'UI Isolate Callback: $data');
      DownloadTaskStatus? status = data[1];
      int? progress = data[2];
      if (status != null && status != widget.downloadInfo.status) {
        showLog("State changed", "update ui");
        showLog("State last", widget.downloadInfo.localFile);
        String? message = messageFromDownloadStatus(status);
        if (message != null) {
          /// showing notification and passing file path if downloaded
          notificationsHelper.showNotification(
            title: message,
            body: widget.downloadInfo.name,
            payload: status == DownloadTaskStatus.complete
                ? widget.downloadInfo.localFile
                : null,
          );
        }
      }

      /// update downloadInfo object status and progress
      widget.downloadInfo.status = status ?? DownloadTaskStatus.undefined;
      widget.downloadInfo.progress = progress ?? 0;
    });
  }

  /// returns Notification message depending on the status
  String? messageFromDownloadStatus(DownloadTaskStatus status) {
    if (status == DownloadTaskStatus.undefined) {
      return null;
    } else if (status == DownloadTaskStatus.running) {
      return localizations.translate(downloading);
    } else if (status == DownloadTaskStatus.paused) {
      return localizations.translate(paused);
    } else if (status == DownloadTaskStatus.complete) {
      return localizations.translate(completed);
    } else if (status == DownloadTaskStatus.failed) {
      return localizations.translate(failed);
    }
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping(_downloadPort);
  }

  /// sending progress updates (id, status, progress) from background isolate
  static void downloadCallback(
    String id,
    DownloadTaskStatus status,
    int progress,
  ) {
    showLog("download file callback",
        'task ($id) is in status ($status) and process ($progress)');

    final SendPort send = IsolateNameServer.lookupPortByName(_downloadPort)!;
    send.send([id, status, progress]);
  }

  @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    notificationsHelper = NotificationsHelper(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: widget.child ??
          DownloadItem(
            data: widget.downloadInfo,
            onActionClick: (p0) {},
            iconColor: widget.iconColor,
          ),
      onTap: () async {
        Directory directoryIos;
        String appDocPath = "";
        if (Platform.isIOS) {
          // Platform is imported from 'dart:io' package
          directoryIos = await getApplicationDocumentsDirectory();
          appDocPath = directoryIos.path;
        } else {
          appDocPath = await AndroidPathProvider.downloadsPath;
        }
        if (widget.isFileGenerated) {
          //   Directory appDocDir = await getApplicationSupportDirectory();

          File file2 = File(
              "$appDocPath/environment-${widget.downloadInfo.name}-${_randomSeed()}.pdf");
          showLog("file path", file2.path);
          _downloadGeneratedFile(widget.downloadInfo.link, file2.path);
        } else {
          _requestDownload(widget.downloadInfo);
        }
      },
    );
  }

  String _randomSeed() {
    return Random().nextInt(10000).toString();
  }

  /// updates about download status from `_downloadGeneratedFile` method
  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  /// used to download files that are generated on request
  /// not actually exist on the server
  Future _downloadGeneratedFile(String? url, String savePath) async {
    try {
      String token = '';
      await fetchUserData().then((value) => token = value!.data!.original!.accessToken!);
      var uuid = const Uuid();
      notificationsHelper.showNotification(
        title: messageFromDownloadStatus(DownloadTaskStatus.running),
        body: widget.downloadInfo.name,
      );
      Response response = await Dio().get(
        url!,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            headers: {
              "X-Request-Timestamp":
                  '${DateTime.now().millisecondsSinceEpoch / 1000}',
              "X-Request-Id": uuid.v4(),
              "Authorization": "Bearer $token",
              "X-Client-Referrer": "api",
              //Decrypt Response
              "User-Agent": "Dart/2.15 (dart:io)",
              "Accept-Language": AppLocalizations.instance!.locale.languageCode
            },
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      showLog("downloaded file size in response", response.data);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type

      raf.writeFromSync(response.data);
      await raf.close();
      notificationsHelper.showNotification(
        title: messageFromDownloadStatus(DownloadTaskStatus.complete),
        body: widget.downloadInfo.name,
        payload: file.path,
      );
    } catch (e) {
      notificationsHelper.showNotification(
        title: messageFromDownloadStatus(DownloadTaskStatus.failed),
        body: widget.downloadInfo.name,
      );
    }
  }

  /// Downloads Files from backend, used for files that already exist on server
  void _requestDownload(DownloadInfo task) async {
    String? accessToken;
    await fetchUserData()
        .then((value) => accessToken = value!.data!.original!.accessToken!);
    await _prepare();
    var uuid = const Uuid();

    task.taskId = await FlutterDownloader.enqueue(
      url: task.link!,
      savedDir: _localPath,
      fileName: task.name,
      showNotification: false,
      openFileFromNotification: false,
      saveInPublicStorage: true,
      headers: {
        "X-Request-Timestamp":
            '${DateTime.now().millisecondsSinceEpoch / 1000}',
        "X-Request-Id": uuid.v4(),
        "X-Client-Referrer": "api",
        "Authorization": "Bearer $accessToken",
        "Accept-Language": AppLocalizations.instance!.locale.languageCode
      },
    );
  }

  Future<bool> _checkPermission() async {
    final bool _isAndroid = widget.platform == TargetPlatform.android;
    if (!_isAndroid) return true;

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    if (_isAndroid && androidInfo.version.sdkInt > 28) return true;

    final status = await Permission.storage.status;

    if (status == PermissionStatus.granted) {
      return true;
    } else {
      final result = await Permission.storage.request();
      return result == PermissionStatus.granted;
    }
  }

  Future _prepare() async {
    await FlutterDownloader.loadTasks();
    _permissionReady = await _checkPermission();

    if (_permissionReady) {
      await _prepareSaveDir();
    }
  }

  Future<void> _prepareSaveDir() async {
    try {
      _localPath = (await _findLocalPath()) ?? '';
      final savedDir = Directory(_localPath);
      bool hasExisted = await savedDir.exists();

      if (!hasExisted) {
        savedDir.create();
      }
      widget.downloadInfo.localFile =
          'file://${savedDir.path}/${widget.downloadInfo.name}'
              .replaceAll(' ', '-');
    } catch (e) {
      showLog("download file create Dir error", "$e");
    }
  }

  Future<String?> _findLocalPath() async {
    String? externalStorageDirPath;
    if (Platform.isAndroid) {
      try {
        externalStorageDirPath = await AndroidPathProvider.downloadsPath;
      } catch (e) {
        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    }
    return externalStorageDirPath;
  }
}

/// Default widget for download if no child widget is provided
class DownloadItem extends StatelessWidget {
  final DownloadInfo? data;
  final Function(DownloadInfo?)? onItemClick;
  final Function(DownloadInfo) onActionClick;
  final Color iconColor;
  final Widget? child;

  const DownloadItem(
      {Key? key,
      this.data,
      this.onItemClick,
      required this.onActionClick,
      this.child,
      this.iconColor = const Color(0xffC2C2C2)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onActionClick(data!),
      child: Icon(
        Icons.file_download_outlined,
        color: iconColor,
        size: 26,
      ),
    );
  }
}

/// Information about the file being downloaded
class DownloadInfo {
  String? name;
  final String? link;

  String? taskId;
  int? progress = 0;
  DownloadTaskStatus status;
  String? localFile;

  DownloadInfo({
    this.name,
    this.link,
    this.taskId,
    this.progress,
    this.status = DownloadTaskStatus.undefined,
    this.localFile,
  });
}

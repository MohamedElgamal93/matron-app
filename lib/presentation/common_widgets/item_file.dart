import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:environment/util/download_file.dart';
import 'package:environment/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FileNameWidget extends StatelessWidget {
  final String? fileName;
  final String? fileURL;
  final String? size;
  final bool isAvailableDownload;

  const FileNameWidget(
      {Key? key,
      required this.fileName,
      this.size,
      this.fileURL,
      this.isAvailableDownload = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    return ListTile(
      title: Text(
        "$fileName",
        style: Theme.of(context).textTheme.bodyText1!.copyWith(decoration: TextDecoration.underline,),
      ),
      subtitle: Text(
        Utils.fileSizeFormatted(context,
            sizeInKB: int.tryParse(size ?? '') ?? 0),
        style: Theme.of(context).textTheme.overline,
      ),
      leading: Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.height(context: context, pixels: 10)),
          child: SvgPicture.asset(filesSVG)),
      trailing: isAvailableDownload
          ? Padding(
              padding: EdgeInsets.only(
                  right: SizeConfig.width(context: context, pixels: 10)),
              child: DownloadConfiguration(
                isFileGenerated: false,
                downloadInfo: DownloadInfo(name: fileName, link: fileURL),
                platform: platform,
              ))
          : const SizedBox(),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'page_loader_state.dart';

/// used to keep track of loaded data parts in pages that use multible
/// requests to load all page data, takes `totalPageParts` which is the
/// total number of parts that will be loaded.
class PageLoaderCubit extends Cubit<PageLoaderState> {
  PageLoaderCubit(this.totalPageParts) : super(PageLoaderInitial());

  /// number of parts that will be loaded in page
  final int totalPageParts;

  /// updated to indicate loading parts, when all [totalPageParts] data is loaded
  int _dataPartsFlag = 0;

  /// call when a part of the [totalPageParts] pieces of data in project page is loaded
  /// if the local counter `_dataPartsFlag` equals `totalPageParts` then all
  /// data is loaded and emmit [PageLoaderLoded] state to indicate completing
  /// page data, if not all parts are loaded emmits [PageLoaderLoding] state.
  updateDetailsCubit() {
    _dataPartsFlag++;
    if (_dataPartsFlag == totalPageParts) {
      emit(PageLoaderLoded());
    } else {
      emit(PageLoaderLoding());
    }
  }
}

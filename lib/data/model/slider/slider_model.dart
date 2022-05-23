class SliderModel {
  final String? imgAssetPath;
  final String? title;
  final String? subTitle;
  final String? networkImage;

  SliderModel(
      {this.imgAssetPath, this.title, this.subTitle, this.networkImage});

  @override
  bool operator ==(Object other) {
    return other is SliderModel &&
        other.imgAssetPath == imgAssetPath &&
        other.subTitle == subTitle &&
        other.networkImage == networkImage &&
        other.title == title;
  }

  @override
  int get hashCode => imgAssetPath.hashCode;
}

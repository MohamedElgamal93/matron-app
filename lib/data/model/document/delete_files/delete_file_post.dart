class DeleteFilePost {
  DeleteFilePost({
    this.fileId,
  });

  String? fileId;

  DeleteFilePost.fromJson(Map<String, dynamic> json) {
    fileId = json['fileId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fileId'] = fileId;
    return _data;
  }
}

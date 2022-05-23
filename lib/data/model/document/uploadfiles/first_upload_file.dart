class PostUploadfile {
  String? file;

  PostUploadfile({this.file});

  PostUploadfile.fromJson(Map<String, dynamic> json) {
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['file'] = file;

    return data;
  }
}

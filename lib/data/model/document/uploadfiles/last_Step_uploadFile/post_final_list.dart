/*
class UploadFilnalPost {
    double? dataIds;
   late String Keys ;
    UploadFilnalPost({this.dataIds,required this.Keys});
      UploadFilnalPost.fromJson(Map<String, dynamic> json) {
          dataIds= json['$Keys'];
    }
    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data =  Map<String, dynamic>();
        data['$Keys'] = this.dataIds;
    
        return data;
    }
}
*/

class UploadFilnalPost {
  UploadFilnalPost({
    this.dataIds,
    this.Keys,
  });

  double? dataIds;
  String? Keys;

  UploadFilnalPost.fromJson(Map<String, dynamic> json) {
    dataIds = json['dataIds'];
    Keys = json['Keys'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dataIds'] = dataIds;
    _data['Keys'] = Keys;
    return _data;
  }
}

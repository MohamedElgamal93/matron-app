
class LocationPost {
  // int? id;
  String? lat;
  String? lng;
  bool? online;

  LocationPost({ this.lat, this.lng, this.online});

  LocationPost.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    lat = json['lat'];
    lng = json['lng'];
    online = json['online'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;

    data['lng'] = lng;
    data['online'] = online;
    return data;
  }
}

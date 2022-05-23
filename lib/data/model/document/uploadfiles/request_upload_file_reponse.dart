class RequestUploadFileResponse {
  RequestUploadFileResponse({
    required this.dataValues,
    required this.success,
    required this.included,
  });
  late final DataValues dataValues;
  late final bool success;
  late final Included included;

  RequestUploadFileResponse.fromJson(Map<String, dynamic> json) {
    dataValues = DataValues.fromJson(json['data']);
    success = json['success'];
    included = Included.fromJson(json['included']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = dataValues.toJson();
    _data['success'] = success;
    _data['included'] = included.toJson();
    return _data;
  }
}

class DataValues {
  DataValues({
    required this.type,
    required this.id,
    required this.attributes,
  });
  late final String type;
  late final int id;
  late final Attributes attributes;

  DataValues.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    attributes = Attributes.fromJson(json['attributes']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['id'] = id;
    _data['attributes'] = attributes.toJson();
    return _data;
  }
}

class Attributes {
  Attributes({
    required this.id,
    required this.name,
    required this.originalName,
    required this.status,
    required this.statusTitle,
    required this.extension,
    required this.size,
    required this.mimeType,
    required this.visibility,
    required this.url,
    required this.downloadUrl,
    required this.icon,
    this.title,
    this.description,
    required this.createdAt,
  });
  late final int id;
  late final String name;
  late final String originalName;
  late final String status;
  late final String statusTitle;
  late final String extension;
  late final int size;
  late final String mimeType;
  late final String visibility;
  late final String url;
  late final String downloadUrl;
  late final String icon;
  late final dynamic title;
  late final dynamic description;
  late final String createdAt;

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    originalName = json['original_name'];
    status = json['status'];
    statusTitle = json['status_title'];
    extension = json['extension'];
    size = json['size'];
    mimeType = json['mime_type'];
    visibility = json['visibility'];
    url = json['url'];
    downloadUrl = json['download_url'];
    icon = json['icon'];
    title = null;
    description = null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['original_name'] = originalName;
    _data['status'] = status;
    _data['status_title'] = statusTitle;
    _data['extension'] = extension;
    _data['size'] = size;
    _data['mime_type'] = mimeType;
    _data['visibility'] = visibility;
    _data['url'] = url;
    _data['download_url'] = downloadUrl;
    _data['icon'] = icon;
    _data['title'] = title;
    _data['description'] = description;
    _data['created_at'] = createdAt;
    return _data;
  }
}

class Included {
  Included();

  Included.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

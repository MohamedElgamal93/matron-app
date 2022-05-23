class FileReturnDataResponse {
  FileReturnDataResponse({
    required this.code,
    required this.message,
    required this.type,
    required this.dataReturn,
  });
  late final String code;
  late final String message;
  late final String type;
  late final List<DataReturn> dataReturn;
  
  FileReturnDataResponse.fromJson(Map<String, dynamic> json){
    code = json['code'];
    message = json['message'];
    type = json['type'];
    dataReturn = List.from(json['data']).map((e)=>DataReturn.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['message'] = message;
    _data['type'] = type;
    _data['data'] = dataReturn.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class DataReturn {
  DataReturn({
    required this.fileId,
    required this.entityType,
    required this.entityId,
    required this.custom,
    required this.file,
  });
  late final int fileId;
  late final String entityType;
  late final int entityId;
  late final Custom custom;
  late final File file;
  
  DataReturn.fromJson(Map<String, dynamic> json){
    fileId = json['file_id'];
    entityType = json['entity_type'];
    entityId = json['entity_id'];
    custom = Custom.fromJson(json['custom']);
    file = File.fromJson(json['file']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['file_id'] = fileId;
    _data['entity_type'] = entityType;
    _data['entity_id'] = entityId;
    _data['custom'] = custom.toJson();
    _data['file'] = file.toJson();
    return _data;
  }
}

class Custom {
  Custom({
    required this.type,
  });
  late final String type;
  
  Custom.fromJson(Map<String, dynamic> json){
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    return _data;
  }
}

class File {
  File({
    required this.id,
    required this.name,
     this.title,
    required this.status,
     this.refusedReason,
    required this.originalName,
    required this.extension,
    required this.size,
    required this.mimeType,
    required this.dir,
     this.ip,
    required this.visibility,
     this.custom,
    required this.createdAt,
    required this.updatedAt,
     this.deletedAt,
    required this.uuid,
  });
  late final int id;
  late final String name;
  late final dynamic title;
  late final String status;
  late final dynamic refusedReason;
  late final String originalName;
  late final String extension;
  late final int size;
  late final String mimeType;
  late final String dir;
  late final dynamic ip;
  late final String visibility;
  late final dynamic custom;
  late final String createdAt;
  late final String updatedAt;
  late final dynamic deletedAt;
  late final String uuid;
  
  File.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    title = null;
    status = json['status'];
    refusedReason = null;
    originalName = json['original_name'];
    extension = json['extension'];
    size = json['size'];
    mimeType = json['mime_type'];
    dir = json['dir'];
    ip = null;
    visibility = json['visibility'];
    custom = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = null;
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['title'] = title;
    _data['status'] = status;
    _data['refused_reason'] = refusedReason;
    _data['original_name'] = originalName;
    _data['extension'] = extension;
    _data['size'] = size;
    _data['mime_type'] = mimeType;
    _data['dir'] = dir;
    _data['ip'] = ip;
    _data['visibility'] = visibility;
    _data['custom'] = custom;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    _data['uuid'] = uuid;
    return _data;
  }
}



class Login {
	int? status;
	String? message;
	Null? errors;
	Data? data;

	Login({this.status, this.message, this.errors, this.data});

	Login.fromJson(Map<String, dynamic> json) {
		status = json['status'];
		message = json['message'];
		errors = json['errors'];
		data = json['data'] != null ? new Data.fromJson(json['data']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['status'] = this.status;
		data['message'] = this.message;
		data['errors'] = this.errors;
		if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
		return data;
	}
}

class Data {
	Headers? headers;
	Original? original;
	Null? exception;

	Data({this.headers, this.original, this.exception});

	Data.fromJson(Map<String, dynamic> json) {
		headers = json['headers'] != null ? new Headers.fromJson(json['headers']) : null;
		original = json['original'] != null ? new Original.fromJson(json['original']) : null;
		exception = json['exception'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.headers != null) {
      data['headers'] = this.headers!.toJson();
    }
		if (this.original != null) {
      data['original'] = this.original!.toJson();
    }
		data['exception'] = this.exception;
		return data;
	}
}

class Headers {


	Headers();

	Headers.fromJson(Map<String, dynamic> json) {
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		return data;
	}
}

class Original {
	String? accessToken;
	String? tokenType;
	User? user;
	List<Null>? userPermissions;

	Original({this.accessToken, this.tokenType, this.user, this.userPermissions});

	Original.fromJson(Map<String, dynamic> json) {
		accessToken = json['access_token'];
		tokenType = json['token_type'];
		user = json['user'] != null ? new User.fromJson(json['user']) : null;
		if (json['user_permissions'] != null) {
	
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['access_token'] = this.accessToken;
		data['token_type'] = this.tokenType;
		if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
		if (this.userPermissions != null) {
    }
		return data;
	}
}

class User {
	int? id;
	String? name;
	String? email;
	String? emailVerifiedAt;
	String? createdAt;
	String? updatedAt;
	Null? facebookId;
	Null? googleId;
	Null? phoneVerifiedAt;
	String? deviceToken;
	String? deviceType;
	int? isActive;
	int? isAdmin;
	Null? phone;
	Null? gender;
	String? userType;
	Null? dop;
	Null? smsNotification;
	Null? languageId;
	Null? deletedAt;
	List<Null>? permissions;
	List<Null>? roles;

	User({this.id, this.name, this.email, this.emailVerifiedAt, this.createdAt, this.updatedAt, this.facebookId, this.googleId, this.phoneVerifiedAt, this.deviceToken, this.deviceType, this.isActive, this.isAdmin, this.phone, this.gender, this.userType, this.dop, this.smsNotification, this.languageId, this.deletedAt, this.permissions, this.roles});

	User.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		name = json['name'];
		email = json['email'];
		emailVerifiedAt = json['email_verified_at'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		facebookId = json['facebook_id'];
		googleId = json['google_id'];
		phoneVerifiedAt = json['phone_verified_at'];
		deviceToken = json['device_token'];
		deviceType = json['device_type'];
		isActive = json['is_active'];
		isAdmin = json['is_admin'];
		phone = json['phone'];
		gender = json['gender'];
		userType = json['user_type'];
		dop = json['dop'];
		smsNotification = json['sms_notification'];
		languageId = json['language_id'];
		deletedAt = json['deleted_at'];
		if (json['permissions'] != null) {
			permissions = <Null>[];
		}
		if (json['roles'] != null) {
			roles = <Null>[];
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['name'] = this.name;
		data['email'] = this.email;
		data['email_verified_at'] = this.emailVerifiedAt;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['facebook_id'] = this.facebookId;
		data['google_id'] = this.googleId;
		data['phone_verified_at'] = this.phoneVerifiedAt;
		data['device_token'] = this.deviceToken;
		data['device_type'] = this.deviceType;
		data['is_active'] = this.isActive;
		data['is_admin'] = this.isAdmin;
		data['phone'] = this.phone;
		data['gender'] = this.gender;
		data['user_type'] = this.userType;
		data['dop'] = this.dop;
		data['sms_notification'] = this.smsNotification;
		data['language_id'] = this.languageId;
		data['deleted_at'] = this.deletedAt;
		if (this.permissions != null) {
    }
		if (this.roles != null) {
    }
		return data;
	}
}
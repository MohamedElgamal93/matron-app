/// code : "900"
/// message : ""
/// type : "Normal"
/// data : {"core":{"setup_completed":"1","app_name":"Awaed","admin_session_lifetime":"120","webapp_session_lifetime":"120","webapp_refresh_token_lifetime":"120","project_currency":"SAR","minimum_user_age":"18","api_date_format":"d F Y","api_time_format":"g:i A","locale":"en","is_enabled_facebook":"0","is_enabled_linkedin":"0","is_enabled_twitter":"0","mailgun_secret":"","mailgun_domain":"","mailgun_endpoint":"api.mailgun.net","mandrill_secret":"","mailer":"smtp","admin_date_format":"d F Y","admin_time_format":"g:i A","filesystem_driver":"local","filesystem_storage":"local","certificate_number":"7009255170"},"contact_details":{"contact_email":"support@awaed.co","secondary_email":"support@awaed.co","phone":"","address":"","latitude":"","longitude":"","google_maps_key":""},"notifications":{"mail_from_address":"info@awaed.co","mail_from_name":"Awaed","email_notification_enabled":"1","mailgun_secret":"","mailgun_domain":"","mailgun_endpoint":"api.mailgun.net","mailer":"smtp"},"percentage_notifications":{"offering_4_50":"1","offering_4_75":"1","offering_4_90":"1","offering_16_100":"1","offering_19_100":"1","offering_18_50":"1","offering_18_100":"1","offering_20_100":"1","offering_21_100":"1","offering_22_100":"1","offering_23_100":"1","offering_27_50":"1","offering_48_50":"1","offering_43_35":"1","offering_48_100":"1","offering_43_50":"1","offering_54_35":"1","offering_54_50":"1","offering_53_100":"1","offering_11_100":"1","offering_61_90":"1","offering_61_75":"1","offering_61_50":"1","offering_61_35":"1","offering_62_50":"1","offering_62_75":"1"},"branding":{"logo":"/storage/2021/06/resize-I3a4Duljn21tOckspGMbRNsv7nrjcNlkidtQ750y.png","logo_minimized":"/storage/2021/06/resize-CW5VaoOlvOF4gJy1dbskJuxsz3hKCrooNAMyU3ir.png","apple_touch_icon":"/storage/2021/06/apple-touch-icon.png","favicon_32":"/storage/2021/06/favicon-32x32.png","favicon_16":"/storage/2021/06/favicon-16x16.png","site_webmanifest":"/storage/2021/06/site.webmanifest","powered_by_enabled":"0"},"mastercard":{"endpoint_base":"https://test-gateway.mastercard.com","test_mode":true,"merchant_id":"TEST3000001305","username":"merchant.TEST3000001305","api_version":"61","password":"8cc5a5c5f95eec8cd88e7a74dbba2fe0"},"aboutUs_url":"https://wp-staging.awaed.co/about-us/"}

class SettingsModel {
  SettingsModel({
    String? code,
    String? message,
    String? type,
    Data? data,
  }) {
    _code = code;
    _message = message;
    _type = type;
    _data = data;
  }

  SettingsModel.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _type = json['type'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _code;
  String? _message;
  String? _type;
  Data? _data;

  String? get code => _code;
  String? get message => _message;
  String? get type => _type;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
    map['type'] = _type;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// core : {"setup_completed":"1","app_name":"Awaed","admin_session_lifetime":"120","webapp_session_lifetime":"120","webapp_refresh_token_lifetime":"120","project_currency":"SAR","minimum_user_age":"18","api_date_format":"d F Y","api_time_format":"g:i A","locale":"en","is_enabled_facebook":"0","is_enabled_linkedin":"0","is_enabled_twitter":"0","mailgun_secret":"","mailgun_domain":"","mailgun_endpoint":"api.mailgun.net","mandrill_secret":"","mailer":"smtp","admin_date_format":"d F Y","admin_time_format":"g:i A","filesystem_driver":"local","filesystem_storage":"local","certificate_number":"7009255170"}
/// contact_details : {"contact_email":"support@awaed.co","secondary_email":"support@awaed.co","phone":"","address":"","latitude":"","longitude":"","google_maps_key":""}
/// notifications : {"mail_from_address":"info@awaed.co","mail_from_name":"Awaed","email_notification_enabled":"1","mailgun_secret":"","mailgun_domain":"","mailgun_endpoint":"api.mailgun.net","mailer":"smtp"}
/// percentage_notifications : {"offering_4_50":"1","offering_4_75":"1","offering_4_90":"1","offering_16_100":"1","offering_19_100":"1","offering_18_50":"1","offering_18_100":"1","offering_20_100":"1","offering_21_100":"1","offering_22_100":"1","offering_23_100":"1","offering_27_50":"1","offering_48_50":"1","offering_43_35":"1","offering_48_100":"1","offering_43_50":"1","offering_54_35":"1","offering_54_50":"1","offering_53_100":"1","offering_11_100":"1","offering_61_90":"1","offering_61_75":"1","offering_61_50":"1","offering_61_35":"1","offering_62_50":"1","offering_62_75":"1"}
/// branding : {"logo":"/storage/2021/06/resize-I3a4Duljn21tOckspGMbRNsv7nrjcNlkidtQ750y.png","logo_minimized":"/storage/2021/06/resize-CW5VaoOlvOF4gJy1dbskJuxsz3hKCrooNAMyU3ir.png","apple_touch_icon":"/storage/2021/06/apple-touch-icon.png","favicon_32":"/storage/2021/06/favicon-32x32.png","favicon_16":"/storage/2021/06/favicon-16x16.png","site_webmanifest":"/storage/2021/06/site.webmanifest","powered_by_enabled":"0"}
/// mastercard : {"endpoint_base":"https://test-gateway.mastercard.com","test_mode":true,"merchant_id":"TEST3000001305","username":"merchant.TEST3000001305","api_version":"61","password":"8cc5a5c5f95eec8cd88e7a74dbba2fe0"}
/// aboutUs_url : "https://wp-staging.awaed.co/about-us/"

class Data {
  Data({
    Core? core,
    Contact_details? contactDetails,
    Notifications? notifications,
    Percentage_notifications? percentageNotifications,
    Branding? branding,
    Mastercard? mastercard,
    String? aboutUsUrl,
    List<APILocale>? locales ,
  }) {
    _core = core;
    _contactDetails = contactDetails;
    _notifications = notifications;
    _percentageNotifications = percentageNotifications;
    _branding = branding;
    _mastercard = mastercard;
    _aboutUsUrl = aboutUsUrl;
    _locales = locales;
  }

  Data.fromJson(dynamic json) {
    _core = json['core'] != null ? Core.fromJson(json['core']) : null;
    _contactDetails = json['contact_details'] != null
        ? Contact_details.fromJson(json['contact_details'])
        : null;
    _notifications = json['notifications'] != null
        ? Notifications.fromJson(json['notifications'])
        : null;
    _percentageNotifications = json['percentage_notifications'] != null
        ? Percentage_notifications.fromJson(json['percentage_notifications'])
        : null;
    _branding =
        json['branding'] != null ? Branding.fromJson(json['branding']) : null;
    _mastercard = json['mastercard'] != null
        ? Mastercard.fromJson(json['mastercard'])
        : null;
    _aboutUsUrl = json['aboutUs_url'];  _locales = [];
    if (json['locales'] != null) {

      json['locales'].forEach((v) {
        _locales?.add(APILocale.fromJson(v));
      });
    }
  }
  Core? _core;
  Contact_details? _contactDetails;
  Notifications? _notifications;
  Percentage_notifications? _percentageNotifications;
  Branding? _branding;
  Mastercard? _mastercard;
  String? _aboutUsUrl;
  List<APILocale>? _locales;

  Core? get core => _core;
  Contact_details? get contactDetails => _contactDetails;
  Notifications? get notifications => _notifications;
  Percentage_notifications? get percentageNotifications =>
      _percentageNotifications;
  Branding? get branding => _branding;
  Mastercard? get mastercard => _mastercard;
  String? get aboutUsUrl => _aboutUsUrl;
  List<APILocale>? get locales => _locales;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_core != null) {
      map['core'] = _core?.toJson();
    }
    if (_contactDetails != null) {
      map['contact_details'] = _contactDetails?.toJson();
    }
    if (_notifications != null) {
      map['notifications'] = _notifications?.toJson();
    }
    if (_percentageNotifications != null) {
      map['percentage_notifications'] = _percentageNotifications?.toJson();
    }
    if (_branding != null) {
      map['branding'] = _branding?.toJson();
    }
    if (_mastercard != null) {
      map['mastercard'] = _mastercard?.toJson();
    }
    map['aboutUs_url'] = _aboutUsUrl;
    return map;
  }
}

/// endpoint_base : "https://test-gateway.mastercard.com"
/// test_mode : true
/// merchant_id : "TEST3000001305"
/// username : "merchant.TEST3000001305"
/// api_version : "61"
/// password : "8cc5a5c5f95eec8cd88e7a74dbba2fe0"

class Mastercard {
  Mastercard({
    String? endpointBase,
    bool? testMode,
    String? merchantId,
    String? username,
    String? apiVersion,
    String? password,
  }) {
    _endpointBase = endpointBase;
    _testMode = testMode;
    _merchantId = merchantId;
    _username = username;
    _apiVersion = apiVersion;
    _password = password;
  }

  Mastercard.fromJson(dynamic json) {
    _endpointBase = json['endpoint_base'];
    _testMode = json['test_mode'];
    _merchantId = json['merchant_id'];
    _username = json['username'];
    _apiVersion = json['api_version'];
    _password = json['password'];
  }
  String? _endpointBase;
  bool? _testMode;
  String? _merchantId;
  String? _username;
  String? _apiVersion;
  String? _password;

  String? get endpointBase => _endpointBase;
  bool? get testMode => _testMode;
  String? get merchantId => _merchantId;
  String? get username => _username;
  String? get apiVersion => _apiVersion;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['endpoint_base'] = _endpointBase;
    map['test_mode'] = _testMode;
    map['merchant_id'] = _merchantId;
    map['username'] = _username;
    map['api_version'] = _apiVersion;
    map['password'] = _password;
    return map;
  }
}

/// logo : "/storage/2021/06/resize-I3a4Duljn21tOckspGMbRNsv7nrjcNlkidtQ750y.png"
/// logo_minimized : "/storage/2021/06/resize-CW5VaoOlvOF4gJy1dbskJuxsz3hKCrooNAMyU3ir.png"
/// apple_touch_icon : "/storage/2021/06/apple-touch-icon.png"
/// favicon_32 : "/storage/2021/06/favicon-32x32.png"
/// favicon_16 : "/storage/2021/06/favicon-16x16.png"
/// site_webmanifest : "/storage/2021/06/site.webmanifest"
/// powered_by_enabled : "0"

class Branding {
  Branding({
    String? logo,
    String? logoMinimized,
    String? appleTouchIcon,
    String? favicon32,
    String? favicon16,
    String? siteWebmanifest,
    String? poweredByEnabled,
  }) {
    _logo = logo;
    _logoMinimized = logoMinimized;
    _appleTouchIcon = appleTouchIcon;
    _favicon32 = favicon32;
    _favicon16 = favicon16;
    _siteWebmanifest = siteWebmanifest;
    _poweredByEnabled = poweredByEnabled;
  }

  Branding.fromJson(dynamic json) {
    _logo = json['logo'];
    _logoMinimized = json['logo_minimized'];
    _appleTouchIcon = json['apple_touch_icon'];
    _favicon32 = json['favicon_32'];
    _favicon16 = json['favicon_16'];
    _siteWebmanifest = json['site_webmanifest'];
    _poweredByEnabled = json['powered_by_enabled'];
  }
  String? _logo;
  String? _logoMinimized;
  String? _appleTouchIcon;
  String? _favicon32;
  String? _favicon16;
  String? _siteWebmanifest;
  String? _poweredByEnabled;

  String? get logo => _logo;
  String? get logoMinimized => _logoMinimized;
  String? get appleTouchIcon => _appleTouchIcon;
  String? get favicon32 => _favicon32;
  String? get favicon16 => _favicon16;
  String? get siteWebmanifest => _siteWebmanifest;
  String? get poweredByEnabled => _poweredByEnabled;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['logo'] = _logo;
    map['logo_minimized'] = _logoMinimized;
    map['apple_touch_icon'] = _appleTouchIcon;
    map['favicon_32'] = _favicon32;
    map['favicon_16'] = _favicon16;
    map['site_webmanifest'] = _siteWebmanifest;
    map['powered_by_enabled'] = _poweredByEnabled;
    return map;
  }
}

/// offering_4_50 : "1"
/// offering_4_75 : "1"
/// offering_4_90 : "1"
/// offering_16_100 : "1"
/// offering_19_100 : "1"
/// offering_18_50 : "1"
/// offering_18_100 : "1"
/// offering_20_100 : "1"
/// offering_21_100 : "1"
/// offering_22_100 : "1"
/// offering_23_100 : "1"
/// offering_27_50 : "1"
/// offering_48_50 : "1"
/// offering_43_35 : "1"
/// offering_48_100 : "1"
/// offering_43_50 : "1"
/// offering_54_35 : "1"
/// offering_54_50 : "1"
/// offering_53_100 : "1"
/// offering_11_100 : "1"
/// offering_61_90 : "1"
/// offering_61_75 : "1"
/// offering_61_50 : "1"
/// offering_61_35 : "1"
/// offering_62_50 : "1"
/// offering_62_75 : "1"

class Percentage_notifications {
  Percentage_notifications({
    String? offering450,
    String? offering475,
    String? offering490,
    String? offering16100,
    String? offering19100,
    String? offering1850,
    String? offering18100,
    String? offering20100,
    String? offering21100,
    String? offering22100,
    String? offering23100,
    String? offering2750,
    String? offering4850,
    String? offering4335,
    String? offering48100,
    String? offering4350,
    String? offering5435,
    String? offering5450,
    String? offering53100,
    String? offering11100,
    String? offering6190,
    String? offering6175,
    String? offering6150,
    String? offering6135,
    String? offering6250,
    String? offering6275,
  }) {
    _offering450 = offering450;
    _offering475 = offering475;
    _offering490 = offering490;
    _offering16100 = offering16100;
    _offering19100 = offering19100;
    _offering1850 = offering1850;
    _offering18100 = offering18100;
    _offering20100 = offering20100;
    _offering21100 = offering21100;
    _offering22100 = offering22100;
    _offering23100 = offering23100;
    _offering2750 = offering2750;
    _offering4850 = offering4850;
    _offering4335 = offering4335;
    _offering48100 = offering48100;
    _offering4350 = offering4350;
    _offering5435 = offering5435;
    _offering5450 = offering5450;
    _offering53100 = offering53100;
    _offering11100 = offering11100;
    _offering6190 = offering6190;
    _offering6175 = offering6175;
    _offering6150 = offering6150;
    _offering6135 = offering6135;
    _offering6250 = offering6250;
    _offering6275 = offering6275;
  }

  Percentage_notifications.fromJson(dynamic json) {
    _offering450 = json['offering_4_50'];
    _offering475 = json['offering_4_75'];
    _offering490 = json['offering_4_90'];
    _offering16100 = json['offering_16_100'];
    _offering19100 = json['offering_19_100'];
    _offering1850 = json['offering_18_50'];
    _offering18100 = json['offering_18_100'];
    _offering20100 = json['offering_20_100'];
    _offering21100 = json['offering_21_100'];
    _offering22100 = json['offering_22_100'];
    _offering23100 = json['offering_23_100'];
    _offering2750 = json['offering_27_50'];
    _offering4850 = json['offering_48_50'];
    _offering4335 = json['offering_43_35'];
    _offering48100 = json['offering_48_100'];
    _offering4350 = json['offering_43_50'];
    _offering5435 = json['offering_54_35'];
    _offering5450 = json['offering_54_50'];
    _offering53100 = json['offering_53_100'];
    _offering11100 = json['offering_11_100'];
    _offering6190 = json['offering_61_90'];
    _offering6175 = json['offering_61_75'];
    _offering6150 = json['offering_61_50'];
    _offering6135 = json['offering_61_35'];
    _offering6250 = json['offering_62_50'];
    _offering6275 = json['offering_62_75'];
  }
  String? _offering450;
  String? _offering475;
  String? _offering490;
  String? _offering16100;
  String? _offering19100;
  String? _offering1850;
  String? _offering18100;
  String? _offering20100;
  String? _offering21100;
  String? _offering22100;
  String? _offering23100;
  String? _offering2750;
  String? _offering4850;
  String? _offering4335;
  String? _offering48100;
  String? _offering4350;
  String? _offering5435;
  String? _offering5450;
  String? _offering53100;
  String? _offering11100;
  String? _offering6190;
  String? _offering6175;
  String? _offering6150;
  String? _offering6135;
  String? _offering6250;
  String? _offering6275;

  String? get offering450 => _offering450;
  String? get offering475 => _offering475;
  String? get offering490 => _offering490;
  String? get offering16100 => _offering16100;
  String? get offering19100 => _offering19100;
  String? get offering1850 => _offering1850;
  String? get offering18100 => _offering18100;
  String? get offering20100 => _offering20100;
  String? get offering21100 => _offering21100;
  String? get offering22100 => _offering22100;
  String? get offering23100 => _offering23100;
  String? get offering2750 => _offering2750;
  String? get offering4850 => _offering4850;
  String? get offering4335 => _offering4335;
  String? get offering48100 => _offering48100;
  String? get offering4350 => _offering4350;
  String? get offering5435 => _offering5435;
  String? get offering5450 => _offering5450;
  String? get offering53100 => _offering53100;
  String? get offering11100 => _offering11100;
  String? get offering6190 => _offering6190;
  String? get offering6175 => _offering6175;
  String? get offering6150 => _offering6150;
  String? get offering6135 => _offering6135;
  String? get offering6250 => _offering6250;
  String? get offering6275 => _offering6275;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['offering_4_50'] = _offering450;
    map['offering_4_75'] = _offering475;
    map['offering_4_90'] = _offering490;
    map['offering_16_100'] = _offering16100;
    map['offering_19_100'] = _offering19100;
    map['offering_18_50'] = _offering1850;
    map['offering_18_100'] = _offering18100;
    map['offering_20_100'] = _offering20100;
    map['offering_21_100'] = _offering21100;
    map['offering_22_100'] = _offering22100;
    map['offering_23_100'] = _offering23100;
    map['offering_27_50'] = _offering2750;
    map['offering_48_50'] = _offering4850;
    map['offering_43_35'] = _offering4335;
    map['offering_48_100'] = _offering48100;
    map['offering_43_50'] = _offering4350;
    map['offering_54_35'] = _offering5435;
    map['offering_54_50'] = _offering5450;
    map['offering_53_100'] = _offering53100;
    map['offering_11_100'] = _offering11100;
    map['offering_61_90'] = _offering6190;
    map['offering_61_75'] = _offering6175;
    map['offering_61_50'] = _offering6150;
    map['offering_61_35'] = _offering6135;
    map['offering_62_50'] = _offering6250;
    map['offering_62_75'] = _offering6275;
    return map;
  }
}

/// mail_from_address : "info@awaed.co"
/// mail_from_name : "Awaed"
/// email_notification_enabled : "1"
/// mailgun_secret : ""
/// mailgun_domain : ""
/// mailgun_endpoint : "api.mailgun.net"
/// mailer : "smtp"

class Notifications {
  Notifications({
    String? mailFromAddress,
    String? mailFromName,
    String? emailNotificationEnabled,
    String? mailgunSecret,
    String? mailgunDomain,
    String? mailgunEndpoint,
    String? mailer,
  }) {
    _mailFromAddress = mailFromAddress;
    _mailFromName = mailFromName;
    _emailNotificationEnabled = emailNotificationEnabled;
    _mailgunSecret = mailgunSecret;
    _mailgunDomain = mailgunDomain;
    _mailgunEndpoint = mailgunEndpoint;
    _mailer = mailer;
  }

  Notifications.fromJson(dynamic json) {
    _mailFromAddress = json['mail_from_address'];
    _mailFromName = json['mail_from_name'];
    _emailNotificationEnabled = json['email_notification_enabled'];
    _mailgunSecret = json['mailgun_secret'];
    _mailgunDomain = json['mailgun_domain'];
    _mailgunEndpoint = json['mailgun_endpoint'];
    _mailer = json['mailer'];
  }
  String? _mailFromAddress;
  String? _mailFromName;
  String? _emailNotificationEnabled;
  String? _mailgunSecret;
  String? _mailgunDomain;
  String? _mailgunEndpoint;
  String? _mailer;

  String? get mailFromAddress => _mailFromAddress;
  String? get mailFromName => _mailFromName;
  String? get emailNotificationEnabled => _emailNotificationEnabled;
  String? get mailgunSecret => _mailgunSecret;
  String? get mailgunDomain => _mailgunDomain;
  String? get mailgunEndpoint => _mailgunEndpoint;
  String? get mailer => _mailer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mail_from_address'] = _mailFromAddress;
    map['mail_from_name'] = _mailFromName;
    map['email_notification_enabled'] = _emailNotificationEnabled;
    map['mailgun_secret'] = _mailgunSecret;
    map['mailgun_domain'] = _mailgunDomain;
    map['mailgun_endpoint'] = _mailgunEndpoint;
    map['mailer'] = _mailer;
    return map;
  }
}

/// contact_email : "support@awaed.co"
/// secondary_email : "support@awaed.co"
/// phone : ""
/// address : ""
/// latitude : ""
/// longitude : ""
/// google_maps_key : ""

class Contact_details {
  Contact_details({
    String? contactEmail,
    String? secondaryEmail,
    String? phone,
    String? address,
    String? latitude,
    String? longitude,
    String? googleMapsKey,
  }) {
    _contactEmail = contactEmail;
    _secondaryEmail = secondaryEmail;
    _phone = phone;
    _address = address;
    _latitude = latitude;
    _longitude = longitude;
    _googleMapsKey = googleMapsKey;
  }

  Contact_details.fromJson(dynamic json) {
    _contactEmail = json['contact_email'];
    _secondaryEmail = json['secondary_email'];
    _phone = json['phone'];
    _address = json['address'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _googleMapsKey = json['google_maps_key'];
  }
  dynamic _contactEmail;
  String? _secondaryEmail;
  String? _phone;
  String? _address;
  String? _latitude;
  String? _longitude;
  String? _googleMapsKey;

  String? get contactEmail => _contactEmail;
  String? get secondaryEmail => _secondaryEmail;
  String? get phone => _phone;
  String? get address => _address;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get googleMapsKey => _googleMapsKey;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['contact_email'] = _contactEmail;
    map['secondary_email'] = _secondaryEmail;
    map['phone'] = _phone;
    map['address'] = _address;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['google_maps_key'] = _googleMapsKey;
    return map;
  }
}

/// setup_completed : "1"
/// app_name : "Awaed"
/// admin_session_lifetime : "120"
/// webapp_session_lifetime : "120"
/// webapp_refresh_token_lifetime : "120"
/// project_currency : "SAR"
/// minimum_user_age : "18"
/// api_date_format : "d F Y"
/// api_time_format : "g:i A"
/// locale : "en"
/// is_enabled_facebook : "0"
/// is_enabled_linkedin : "0"
/// is_enabled_twitter : "0"
/// mailgun_secret : ""
/// mailgun_domain : ""
/// mailgun_endpoint : "api.mailgun.net"
/// mandrill_secret : ""
/// mailer : "smtp"
/// admin_date_format : "d F Y"
/// admin_time_format : "g:i A"
/// filesystem_driver : "local"
/// filesystem_storage : "local"
/// certificate_number : "7009255170"

class Core {
  Core({
    String? setupCompleted,
    String? appName,
    String? adminSessionLifetime,
    String? webappSessionLifetime,
    String? webappRefreshTokenLifetime,
    String? projectCurrency,
    String? minimumUserAge,
    String? apiDateFormat,
    String? apiTimeFormat,
    String? locale,
    String? isEnabledFacebook,
    String? isEnabledLinkedin,
    String? isEnabledTwitter,
    String? mailgunSecret,
    String? mailgunDomain,
    String? mailgunEndpoint,
    String? mandrillSecret,
    String? mailer,
    String? adminDateFormat,
    String? adminTimeFormat,
    String? filesystemDriver,
    String? filesystemStorage,
    String? certificateNumber,
  }) {
    _setupCompleted = setupCompleted;
    _appName = appName;
    _adminSessionLifetime = adminSessionLifetime;
    _webappSessionLifetime = webappSessionLifetime;
    _webappRefreshTokenLifetime = webappRefreshTokenLifetime;
    _projectCurrency = projectCurrency;
    _minimumUserAge = minimumUserAge;
    _apiDateFormat = apiDateFormat;
    _apiTimeFormat = apiTimeFormat;
    _locale = locale;
    _isEnabledFacebook = isEnabledFacebook;
    _isEnabledLinkedin = isEnabledLinkedin;
    _isEnabledTwitter = isEnabledTwitter;
    _mailgunSecret = mailgunSecret;
    _mailgunDomain = mailgunDomain;
    _mailgunEndpoint = mailgunEndpoint;
    _mandrillSecret = mandrillSecret;
    _mailer = mailer;
    _adminDateFormat = adminDateFormat;
    _adminTimeFormat = adminTimeFormat;
    _filesystemDriver = filesystemDriver;
    _filesystemStorage = filesystemStorage;
    _certificateNumber = certificateNumber;
  }

  Core.fromJson(dynamic json) {
    _setupCompleted = json['setup_completed'];
    _appName = json['app_name'];
    _adminSessionLifetime = json['admin_session_lifetime'];
    _webappSessionLifetime = json['webapp_session_lifetime'];
    _webappRefreshTokenLifetime = json['webapp_refresh_token_lifetime'];
    _projectCurrency = json['project_currency'];
    _minimumUserAge = json['minimum_user_age'];
    _apiDateFormat = json['api_date_format'];
    _apiTimeFormat = json['api_time_format'];
    _locale = json['locale'];
    _isEnabledFacebook = json['is_enabled_facebook'];
    _isEnabledLinkedin = json['is_enabled_linkedin'];
    _isEnabledTwitter = json['is_enabled_twitter'];
    _mailgunSecret = json['mailgun_secret'];
    _mailgunDomain = json['mailgun_domain'];
    _mailgunEndpoint = json['mailgun_endpoint'];
    _mandrillSecret = json['mandrill_secret'];
    _mailer = json['mailer'];
    _adminDateFormat = json['admin_date_format'];
    _adminTimeFormat = json['admin_time_format'];
    _filesystemDriver = json['filesystem_driver'];
    _filesystemStorage = json['filesystem_storage'];
    _certificateNumber = json['certificate_number'];
  }
  String? _setupCompleted;
  String? _appName;
  String? _adminSessionLifetime;
  String? _webappSessionLifetime;
  String? _webappRefreshTokenLifetime;
  String? _projectCurrency;
  String? _minimumUserAge;
  String? _apiDateFormat;
  String? _apiTimeFormat;
  String? _locale;
  String? _isEnabledFacebook;
  String? _isEnabledLinkedin;
  String? _isEnabledTwitter;
  String? _mailgunSecret;
  String? _mailgunDomain;
  String? _mailgunEndpoint;
  String? _mandrillSecret;
  String? _mailer;
  String? _adminDateFormat;
  String? _adminTimeFormat;
  String? _filesystemDriver;
  String? _filesystemStorage;
  String? _certificateNumber;

  String? get setupCompleted => _setupCompleted;
  String? get appName => _appName;
  String? get adminSessionLifetime => _adminSessionLifetime;
  String? get webappSessionLifetime => _webappSessionLifetime;
  String? get webappRefreshTokenLifetime => _webappRefreshTokenLifetime;
  String? get projectCurrency => _projectCurrency;
  String? get minimumUserAge => _minimumUserAge;
  String? get apiDateFormat => _apiDateFormat;
  String? get apiTimeFormat => _apiTimeFormat;
  String? get locale => _locale;
  String? get isEnabledFacebook => _isEnabledFacebook;
  String? get isEnabledLinkedin => _isEnabledLinkedin;
  String? get isEnabledTwitter => _isEnabledTwitter;
  String? get mailgunSecret => _mailgunSecret;
  String? get mailgunDomain => _mailgunDomain;
  String? get mailgunEndpoint => _mailgunEndpoint;
  String? get mandrillSecret => _mandrillSecret;
  String? get mailer => _mailer;
  String? get adminDateFormat => _adminDateFormat;
  String? get adminTimeFormat => _adminTimeFormat;
  String? get filesystemDriver => _filesystemDriver;
  String? get filesystemStorage => _filesystemStorage;
  String? get certificateNumber => _certificateNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['setup_completed'] = _setupCompleted;
    map['app_name'] = _appName;
    map['admin_session_lifetime'] = _adminSessionLifetime;
    map['webapp_session_lifetime'] = _webappSessionLifetime;
    map['webapp_refresh_token_lifetime'] = _webappRefreshTokenLifetime;
    map['project_currency'] = _projectCurrency;
    map['minimum_user_age'] = _minimumUserAge;
    map['api_date_format'] = _apiDateFormat;
    map['api_time_format'] = _apiTimeFormat;
    map['locale'] = _locale;
    map['is_enabled_facebook'] = _isEnabledFacebook;
    map['is_enabled_linkedin'] = _isEnabledLinkedin;
    map['is_enabled_twitter'] = _isEnabledTwitter;
    map['mailgun_secret'] = _mailgunSecret;
    map['mailgun_domain'] = _mailgunDomain;
    map['mailgun_endpoint'] = _mailgunEndpoint;
    map['mandrill_secret'] = _mandrillSecret;
    map['mailer'] = _mailer;
    map['admin_date_format'] = _adminDateFormat;
    map['admin_time_format'] = _adminTimeFormat;
    map['filesystem_driver'] = _filesystemDriver;
    map['filesystem_storage'] = _filesystemStorage;
    map['certificate_number'] = _certificateNumber;
    return map;
  }
}



class APILocale {
  APILocale({
    String? code,
    String? title,
    String? alias,
    String? slug,
    String? textDirection,
    int? isDefault,}){
    _code = code;
    _title = title;
    _alias = alias;
    _slug = slug;
    _textDirection = textDirection;
    _isDefault = isDefault;
  }

  APILocale.fromJson(dynamic json) {
    _code = json['code'];
    _title = json['title'];
    _alias = json['alias'];
    _slug = json['slug'];
    _textDirection = json['text_direction'];
    _isDefault = json['is_default'];
  }
  String? _code;
  String? _title;
  String? _alias;
  String? _slug;
  String? _textDirection;
  int? _isDefault;

  String? get code => _code;
  String? get title => _title;
  String? get alias => _alias;
  String? get slug => _slug;
  String? get textDirection => _textDirection;
  int? get isDefault => _isDefault;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['title'] = _title;
    map['alias'] = _alias;
    map['slug'] = _slug;
    map['text_direction'] = _textDirection;
    map['is_default'] = _isDefault;
    return map;
  }

}
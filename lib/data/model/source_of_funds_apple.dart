/// sourceOfFunds : {"provided":{"card":{"devicePayment":{"paymentToken":"{\r\n\t\"version\": \"EC_v1\",\r\n\t\"data\": \"WO/fTbdARsB1Rg3tS4ISwNG4cWDRk3JZDSbP32iDdeMP7UFouS...\",\r\n\t\"signature\": \"MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkg...\",\r\n\t\"header\": {\r\n\t\t\"transactionId\": \"c162557e7ae1c69a47583bc2364d1a3e531428d13fb664032f9e09fa37381fc1\",\r\n\t\t\"ephemeralPublicKey\": \"MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEMeuRqVEOZAQ...\",\r\n\t\t\"publicKeyHash\": \"tBGp1mEoHLiHwfOkazpKVbf3cMKmVS98PGufUJ2Q3ys=\"\r\n\t}\r\n}"}}},"type":"CARD"}

class SourceOfFundsApple {
  SourceOfFundsApple({
    SourceOfFundsApplePay? sourceOfFunds,
  }) {
    _sourceOfFunds = sourceOfFunds;
  }

  SourceOfFundsApple.fromJson(dynamic json) {
    _sourceOfFunds = json['sourceOfFunds'] != null
        ? SourceOfFundsApplePay.fromJson(json['sourceOfFunds'])
        : null;
  }
  SourceOfFundsApplePay? _sourceOfFunds;

  SourceOfFundsApplePay? get sourceOfFunds => _sourceOfFunds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_sourceOfFunds != null) {
      map['sourceOfFunds'] = _sourceOfFunds?.toJson();
    }
    return map;
  }
}

/// provided : {"card":{"devicePayment":{"paymentToken":"{\r\n\t\"version\": \"EC_v1\",\r\n\t\"data\": \"WO/fTbdARsB1Rg3tS4ISwNG4cWDRk3JZDSbP32iDdeMP7UFouS...\",\r\n\t\"signature\": \"MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkg...\",\r\n\t\"header\": {\r\n\t\t\"transactionId\": \"c162557e7ae1c69a47583bc2364d1a3e531428d13fb664032f9e09fa37381fc1\",\r\n\t\t\"ephemeralPublicKey\": \"MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEMeuRqVEOZAQ...\",\r\n\t\t\"publicKeyHash\": \"tBGp1mEoHLiHwfOkazpKVbf3cMKmVS98PGufUJ2Q3ys=\"\r\n\t}\r\n}"}}}
/// type : "CARD"

class SourceOfFundsApplePay {
  SourceOfFundsApplePay({
    ProvidedApple? provided,
    String? type,
  }) {
    _provided = provided;
    _type = type;
  }

  SourceOfFundsApplePay.fromJson(dynamic json) {
    _provided = json['provided'] != null
        ? ProvidedApple.fromJson(json['provided'])
        : null;
    _type = json['type'];
  }
  ProvidedApple? _provided;
  String? _type;

  ProvidedApple? get provided => _provided;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['provided'] = _provided?.toJson();

    map['type'] = _type;
    return map;
  }
}

/// card : {"devicePayment":{"paymentToken":"{\r\n\t\"version\": \"EC_v1\",\r\n\t\"data\": \"WO/fTbdARsB1Rg3tS4ISwNG4cWDRk3JZDSbP32iDdeMP7UFouS...\",\r\n\t\"signature\": \"MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkg...\",\r\n\t\"header\": {\r\n\t\t\"transactionId\": \"c162557e7ae1c69a47583bc2364d1a3e531428d13fb664032f9e09fa37381fc1\",\r\n\t\t\"ephemeralPublicKey\": \"MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEMeuRqVEOZAQ...\",\r\n\t\t\"publicKeyHash\": \"tBGp1mEoHLiHwfOkazpKVbf3cMKmVS98PGufUJ2Q3ys=\"\r\n\t}\r\n}"}}

class ProvidedApple {
  ProvidedApple({
    CardApple? card,
  }) {
    _card = card;
  }

  ProvidedApple.fromJson(dynamic json) {
    _card = json['card'] != null ? CardApple.fromJson(json['card']) : null;
  }
  CardApple? _card;

  CardApple? get card => _card;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_card != null) {
      map['card'] = _card?.toJson();
    }
    return map;
  }
}

/// devicePayment : {"paymentToken":"{\r\n\t\"version\": \"EC_v1\",\r\n\t\"data\": \"WO/fTbdARsB1Rg3tS4ISwNG4cWDRk3JZDSbP32iDdeMP7UFouS...\",\r\n\t\"signature\": \"MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkg...\",\r\n\t\"header\": {\r\n\t\t\"transactionId\": \"c162557e7ae1c69a47583bc2364d1a3e531428d13fb664032f9e09fa37381fc1\",\r\n\t\t\"ephemeralPublicKey\": \"MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEMeuRqVEOZAQ...\",\r\n\t\t\"publicKeyHash\": \"tBGp1mEoHLiHwfOkazpKVbf3cMKmVS98PGufUJ2Q3ys=\"\r\n\t}\r\n}"}

class CardApple {
  CardApple({
    DevicePayment? devicePayment,
  }) {
    _devicePayment = devicePayment;
  }

  CardApple.fromJson(dynamic json) {
    _devicePayment = json['devicePayment'] != null
        ? DevicePayment.fromJson(json['devicePayment'])
        : null;
  }
  DevicePayment? _devicePayment;

  DevicePayment? get devicePayment => _devicePayment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_devicePayment != null) {
      map['devicePayment'] = _devicePayment?.toJson();
    }
    return map;
  }
}

/// paymentToken : "{\r\n\t\"version\": \"EC_v1\",\r\n\t\"data\": \"WO/fTbdARsB1Rg3tS4ISwNG4cWDRk3JZDSbP32iDdeMP7UFouS...\",\r\n\t\"signature\": \"MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkg...\",\r\n\t\"header\": {\r\n\t\t\"transactionId\": \"c162557e7ae1c69a47583bc2364d1a3e531428d13fb664032f9e09fa37381fc1\",\r\n\t\t\"ephemeralPublicKey\": \"MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEMeuRqVEOZAQ...\",\r\n\t\t\"publicKeyHash\": \"tBGp1mEoHLiHwfOkazpKVbf3cMKmVS98PGufUJ2Q3ys=\"\r\n\t}\r\n}"

class DevicePayment {
  DevicePayment({
    String? paymentToken,
  }) {
    _paymentToken = paymentToken;
  }

  DevicePayment.fromJson(dynamic json) {
    _paymentToken = json['paymentToken'];
  }
  String? _paymentToken;

  String? get paymentToken => _paymentToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['paymentToken'] = _paymentToken;
    return map;
  }
}

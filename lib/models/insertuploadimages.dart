class InsertUploadImages {
  InsertUploadImages({
      this.deviceid, 
      this.guid, 
      this.strBase64, 
      this.fileName,});

  InsertUploadImages.fromJson(dynamic json) {
    deviceid = json['deviceid'];
    guid = json['guid'];
    strBase64 = json['strBase64'];
    fileName = json['FileName'];
  }
  String? deviceid;
  String? guid;
  String? strBase64;
  String? fileName;
InsertUploadImages copyWith({  String? deviceid,
  String? guid,
  String? strBase64,
  String? fileName,
}) => InsertUploadImages(  deviceid: deviceid ?? this.deviceid,
  guid: guid ?? this.guid,
  strBase64: strBase64 ?? this.strBase64,
  fileName: fileName ?? this.fileName,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['deviceid'] = deviceid;
    map['guid'] = guid;
    map['strBase64'] = strBase64;
    map['FileName'] = fileName;
    return map;
  }

}
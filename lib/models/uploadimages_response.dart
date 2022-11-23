class UploadImagesResponse {
  UploadImagesResponse({
      this.status, 
      this.deviceid, 
      this.guid,});

  UploadImagesResponse.fromJson(dynamic json) {
    status = json['Status'];
    deviceid = json['deviceid'];
    guid = json['guid'];
  }
  bool? status;
  String? deviceid;
  String? guid;
UploadImagesResponse copyWith({  bool? status,
  String? deviceid,
  String? guid,
}) => UploadImagesResponse(  status: status ?? this.status,
  deviceid: deviceid ?? this.deviceid,
  guid: guid ?? this.guid,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['deviceid'] = deviceid;
    map['guid'] = guid;
    return map;
  }

}
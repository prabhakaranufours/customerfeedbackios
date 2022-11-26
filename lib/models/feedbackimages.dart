class FeedbackImages {
  FeedbackImages({
      String? deviceId, 
      String? imageGUID, 
      String? image, 
      String? categoryid, 
      String? auditId, 
      String? locationId, 
      String? companyId, 
      String? sbuId, 
      String? imageName,}){
    _deviceId = deviceId;
    _imageGUID = imageGUID;
    _image = image;
    _categoryid = categoryid;
    _auditId = auditId;
    _locationId = locationId;
    _companyId = companyId;
    _sbuId = sbuId;
    _imageName = imageName;
}

  FeedbackImages.fromJson(dynamic json) {
    _deviceId = json['deviceId'];
    _imageGUID = json['imageGUID'];
    _image = json['image'];
    _categoryid = json['categoryid'];
    _auditId = json['auditId'];
    _locationId = json['locationId'];
    _companyId = json['companyId'];
    _sbuId = json['sbuId'];
    _imageName = json['imageName'];
  }
  String? _deviceId;
  String? _imageGUID;
  String? _image;
  String? _categoryid;
  String? _auditId;
  String? _locationId;
  String? _companyId;
  String? _sbuId;
  String? _imageName;
FeedbackImages copyWith({  String? deviceId,
  String? imageGUID,
  String? image,
  String? categoryid,
  String? auditId,
  String? locationId,
  String? companyId,
  String? sbuId,
  String? imageName,
}) => FeedbackImages(  deviceId: deviceId ?? _deviceId,
  imageGUID: imageGUID ?? _imageGUID,
  image: image ?? _image,
  categoryid: categoryid ?? _categoryid,
  auditId: auditId ?? _auditId,
  locationId: locationId ?? _locationId,
  companyId: companyId ?? _companyId,
  sbuId: sbuId ?? _sbuId,
  imageName: imageName ?? _imageName,
);
  String? get deviceId => _deviceId;
  String? get imageGUID => _imageGUID;
  String? get image => _image;
  String? get categoryid => _categoryid;
  String? get auditId => _auditId;
  String? get locationId => _locationId;
  String? get companyId => _companyId;
  String? get sbuId => _sbuId;
  String? get imageName => _imageName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['deviceId'] = _deviceId;
    map['imageGUID'] = _imageGUID;
    map['image'] = _image;
    map['categoryid'] = _categoryid;
    map['auditId'] = _auditId;
    map['locationId'] = _locationId;
    map['companyId'] = _companyId;
    map['sbuId'] = _sbuId;
    map['imageName'] = _imageName;
    return map;
  }

}
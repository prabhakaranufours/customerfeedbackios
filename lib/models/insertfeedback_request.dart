/// aomname : ""
/// auditDate : ""
/// auditeename : ""
/// AuditId : 12545
/// AuditSign : ""
/// categoryid : ""
/// Clientname : ""
/// clientPerson : ""
/// ClientSign : ""
/// CompanyId : 1245
/// deviceID : ""
/// guid : ""
/// id : 12
/// isfeedback : ""
/// LocationId : 1212
/// Sbuid : 1212
/// sbuName : ""
/// SectorId : 121
/// SiteName : ""
/// SSano : ""
/// uploadfileGUID : ""
/// uploadfilename : ""
/// UserID : ""
/// XML : ""

class InsertfeedbackRequest {
  InsertfeedbackRequest({
      String? aomname, 
      String? auditDate, 
      String? auditeename, 
      num? auditId, 
      String? auditSign, 
      String? categoryid, 
      String? clientname, 
      String? clientPerson, 
      String? clientSign, 
      num? companyId, 
      String? deviceID, 
      String? guid, 
      num? id, 
      String? isfeedback, 
      num? locationId, 
      num? sbuid, 
      String? sbuName, 
      num? sectorId, 
      String? siteName, 
      String? sSano, 
      String? uploadfileGUID, 
      String? uploadfilename, 
      String? userID, 
      String? xml,}){
    _aomname = aomname;
    _auditDate = auditDate;
    _auditeename = auditeename;
    _auditId = auditId;
    _auditSign = auditSign;
    _categoryid = categoryid;
    _clientname = clientname;
    _clientPerson = clientPerson;
    _clientSign = clientSign;
    _companyId = companyId;
    _deviceID = deviceID;
    _guid = guid;
    _id = id;
    _isfeedback = isfeedback;
    _locationId = locationId;
    _sbuid = sbuid;
    _sbuName = sbuName;
    _sectorId = sectorId;
    _siteName = siteName;
    _sSano = sSano;
    _uploadfileGUID = uploadfileGUID;
    _uploadfilename = uploadfilename;
    _userID = userID;
    _xml = xml;
}

  InsertfeedbackRequest.fromJson(dynamic json) {
    _aomname = json['aomname'];
    _auditDate = json['auditDate'];
    _auditeename = json['auditeename'];
    _auditId = json['AuditId'];
    _auditSign = json['AuditSign'];
    _categoryid = json['categoryid'];
    _clientname = json['Clientname'];
    _clientPerson = json['clientPerson'];
    _clientSign = json['ClientSign'];
    _companyId = json['CompanyId'];
    _deviceID = json['deviceID'];
    _guid = json['guid'];
    _id = json['id'];
    _isfeedback = json['isfeedback'];
    _locationId = json['LocationId'];
    _sbuid = json['Sbuid'];
    _sbuName = json['sbuName'];
    _sectorId = json['SectorId'];
    _siteName = json['SiteName'];
    _sSano = json['SSano'];
    _uploadfileGUID = json['uploadfileGUID'];
    _uploadfilename = json['uploadfilename'];
    _userID = json['UserID'];
    _xml = json['XML'];
  }
  String? _aomname;
  String? _auditDate;
  String? _auditeename;
  num? _auditId;
  String? _auditSign;
  String? _categoryid;
  String? _clientname;
  String? _clientPerson;
  String? _clientSign;
  num? _companyId;
  String? _deviceID;
  String? _guid;
  num? _id;
  String? _isfeedback;
  num? _locationId;
  num? _sbuid;
  String? _sbuName;
  num? _sectorId;
  String? _siteName;
  String? _sSano;
  String? _uploadfileGUID;
  String? _uploadfilename;
  String? _userID;
  String? _xml;
InsertfeedbackRequest copyWith({  String? aomname,
  String? auditDate,
  String? auditeename,
  num? auditId,
  String? auditSign,
  String? categoryid,
  String? clientname,
  String? clientPerson,
  String? clientSign,
  num? companyId,
  String? deviceID,
  String? guid,
  num? id,
  String? isfeedback,
  num? locationId,
  num? sbuid,
  String? sbuName,
  num? sectorId,
  String? siteName,
  String? sSano,
  String? uploadfileGUID,
  String? uploadfilename,
  String? userID,
  String? xml,
}) => InsertfeedbackRequest(  aomname: aomname ?? _aomname,
  auditDate: auditDate ?? _auditDate,
  auditeename: auditeename ?? _auditeename,
  auditId: auditId ?? _auditId,
  auditSign: auditSign ?? _auditSign,
  categoryid: categoryid ?? _categoryid,
  clientname: clientname ?? _clientname,
  clientPerson: clientPerson ?? _clientPerson,
  clientSign: clientSign ?? _clientSign,
  companyId: companyId ?? _companyId,
  deviceID: deviceID ?? _deviceID,
  guid: guid ?? _guid,
  id: id ?? _id,
  isfeedback: isfeedback ?? _isfeedback,
  locationId: locationId ?? _locationId,
  sbuid: sbuid ?? _sbuid,
  sbuName: sbuName ?? _sbuName,
  sectorId: sectorId ?? _sectorId,
  siteName: siteName ?? _siteName,
  sSano: sSano ?? _sSano,
  uploadfileGUID: uploadfileGUID ?? _uploadfileGUID,
  uploadfilename: uploadfilename ?? _uploadfilename,
  userID: userID ?? _userID,
  xml: xml ?? _xml,
);
  String? get aomname => _aomname;
  String? get auditDate => _auditDate;
  String? get auditeename => _auditeename;
  num? get auditId => _auditId;
  String? get auditSign => _auditSign;
  String? get categoryid => _categoryid;
  String? get clientname => _clientname;
  String? get clientPerson => _clientPerson;
  String? get clientSign => _clientSign;
  num? get companyId => _companyId;
  String? get deviceID => _deviceID;
  String? get guid => _guid;
  num? get id => _id;
  String? get isfeedback => _isfeedback;
  num? get locationId => _locationId;
  num? get sbuid => _sbuid;
  String? get sbuName => _sbuName;
  num? get sectorId => _sectorId;
  String? get siteName => _siteName;
  String? get sSano => _sSano;
  String? get uploadfileGUID => _uploadfileGUID;
  String? get uploadfilename => _uploadfilename;
  String? get userID => _userID;
  String? get xml => _xml;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['aomname'] = _aomname;
    map['auditDate'] = _auditDate;
    map['auditeename'] = _auditeename;
    map['AuditId'] = _auditId;
    map['AuditSign'] = _auditSign;
    map['categoryid'] = _categoryid;
    map['Clientname'] = _clientname;
    map['clientPerson'] = _clientPerson;
    map['ClientSign'] = _clientSign;
    map['CompanyId'] = _companyId;
    map['deviceID'] = _deviceID;
    map['guid'] = _guid;
    map['id'] = _id;
    map['isfeedback'] = _isfeedback;
    map['LocationId'] = _locationId;
    map['Sbuid'] = _sbuid;
    map['sbuName'] = _sbuName;
    map['SectorId'] = _sectorId;
    map['SiteName'] = _siteName;
    map['SSano'] = _sSano;
    map['uploadfileGUID'] = _uploadfileGUID;
    map['uploadfilename'] = _uploadfilename;
    map['UserID'] = _userID;
    map['XML'] = _xml;
    return map;
  }

}
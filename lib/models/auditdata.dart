class Auditdata {
  Auditdata({
      this.id, 
      this.strClientfeedback, 
      this.strAdditionalinformatin, 
      this.clientsign, 
      this.auditsign, 
      this.auditdate, 
      this.userid, 
      this.guid, 
      this.deviceid, 
      this.uploadguid, 
      this.uploadfilename, 
      this.auditeename, 
      this.auditorname, 
      this.oamname, 
      this.sbuname, 
      this.clientperson, 
      this.ssano, 
      this.sitename, 
      this.clientname, 
      this.xmldata, 
      this.categoryid, 
      this.auditid, 
      this.sectorid, 
      this.locationid, 
      this.companyid, 
      this.sbuid, 
      this.observation, 
      this.isfeedback,});

  Auditdata.fromJson(dynamic json) {
    id = json['id'];
    strClientfeedback = json['str_clientfeedback'];
    strAdditionalinformatin = json['str_additionalinformatin'];
    clientsign = json['clientsign'];
    auditsign = json['auditsign'];
    auditdate = json['auditdate'];
    userid = json['userid'];
    guid = json['guid'];
    deviceid = json['deviceid'];
    uploadguid = json['uploadguid'];
    uploadfilename = json['uploadfilename'];
    auditeename = json['auditeename'];
    auditorname = json['auditorname'];
    oamname = json['oamname'];
    sbuname = json['sbuname'];
    clientperson = json['clientperson'];
    ssano = json['ssano'];
    sitename = json['sitename'];
    clientname = json['clientname'];
    xmldata = json['xmldata'];
    categoryid = json['categoryid'];
    auditid = json['auditid'];
    sectorid = json['sectorid'];
    locationid = json['locationid'];
    companyid = json['companyid'];
    sbuid = json['sbuid'];
    observation = json['observation'];
    isfeedback = json['isfeedback'];
  }
  num? id;
  String? strClientfeedback;
  String? strAdditionalinformatin;
  String? clientsign;
  String? auditsign;
  String? auditdate;
  String? userid;
  String? guid;
  String? deviceid;
  String? uploadguid;
  String? uploadfilename;
  String? auditeename;
  String? auditorname;
  String? oamname;
  String? sbuname;
  String? clientperson;
  String? ssano;
  String? sitename;
  String? clientname;
  String? xmldata;
  String? categoryid;
  String? auditid;
  String? sectorid;
  String? locationid;
  String? companyid;
  String? sbuid;
  String? observation;
  String? isfeedback;
Auditdata copyWith({  num? id,
  String? strClientfeedback,
  String? strAdditionalinformatin,
  String? clientsign,
  String? auditsign,
  String? auditdate,
  String? userid,
  String? guid,
  String? deviceid,
  String? uploadguid,
  String? uploadfilename,
  String? auditeename,
  String? auditorname,
  String? oamname,
  String? sbuname,
  String? clientperson,
  String? ssano,
  String? sitename,
  String? clientname,
  String? xmldata,
  String? categoryid,
  String? auditid,
  String? sectorid,
  String? locationid,
  String? companyid,
  String? sbuid,
  String? observation,
  String? isfeedback,
}) => Auditdata(  id: id ?? this.id,
  strClientfeedback: strClientfeedback ?? this.strClientfeedback,
  strAdditionalinformatin: strAdditionalinformatin ?? this.strAdditionalinformatin,
  clientsign: clientsign ?? this.clientsign,
  auditsign: auditsign ?? this.auditsign,
  auditdate: auditdate ?? this.auditdate,
  userid: userid ?? this.userid,
  guid: guid ?? this.guid,
  deviceid: deviceid ?? this.deviceid,
  uploadguid: uploadguid ?? this.uploadguid,
  uploadfilename: uploadfilename ?? this.uploadfilename,
  auditeename: auditeename ?? this.auditeename,
  auditorname: auditorname ?? this.auditorname,
  oamname: oamname ?? this.oamname,
  sbuname: sbuname ?? this.sbuname,
  clientperson: clientperson ?? this.clientperson,
  ssano: ssano ?? this.ssano,
  sitename: sitename ?? this.sitename,
  clientname: clientname ?? this.clientname,
  xmldata: xmldata ?? this.xmldata,
  categoryid: categoryid ?? this.categoryid,
  auditid: auditid ?? this.auditid,
  sectorid: sectorid ?? this.sectorid,
  locationid: locationid ?? this.locationid,
  companyid: companyid ?? this.companyid,
  sbuid: sbuid ?? this.sbuid,
  observation: observation ?? this.observation,
  isfeedback: isfeedback ?? this.isfeedback,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['str_clientfeedback'] = strClientfeedback;
    map['str_additionalinformatin'] = strAdditionalinformatin;
    map['clientsign'] = clientsign;
    map['auditsign'] = auditsign;
    map['auditdate'] = auditdate;
    map['userid'] = userid;
    map['guid'] = guid;
    map['deviceid'] = deviceid;
    map['uploadguid'] = uploadguid;
    map['uploadfilename'] = uploadfilename;
    map['auditeename'] = auditeename;
    map['auditorname'] = auditorname;
    map['oamname'] = oamname;
    map['sbuname'] = sbuname;
    map['clientperson'] = clientperson;
    map['ssano'] = ssano;
    map['sitename'] = sitename;
    map['clientname'] = clientname;
    map['xmldata'] = xmldata;
    map['categoryid'] = categoryid;
    map['auditid'] = auditid;
    map['sectorid'] = sectorid;
    map['locationid'] = locationid;
    map['companyid'] = companyid;
    map['sbuid'] = sbuid;
    map['observation'] = observation;
    map['isfeedback'] = isfeedback;
    return map;
  }

}
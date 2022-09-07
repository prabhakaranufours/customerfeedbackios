class Auditdetails {
  Auditdetails({
      this.status, 
      this.showQa, 
      this.message, 
      this.returnData, 
      this.method, 
      this.sessionID, 
      this.id, 
      this.isshow, 
      this.data, 
      this.isOTP, 
      this.isfeedback,});

  Auditdetails.fromJson(dynamic json) {
    status = json['Status'];
    showQa = json['ShowQa'];
    message = json['Message'];
    returnData = json['ReturnData'] != null ? ReturnData.fromJson(json['ReturnData']) : null;
    method = json['Method'];
    sessionID = json['SessionID'];
    id = json['ID'];
    isshow = json['isshow'];
    data = json['data'];
    isOTP = json['isOTP'];
    isfeedback = json['isfeedback'];
  }
  bool? status;
  bool? showQa;
  String? message;
  ReturnData? returnData;
  String? method;
  String? sessionID;
  String? id;
  String? isshow;
  num? data;
  String? isOTP;
  num? isfeedback;
Auditdetails copyWith({  bool? status,
  bool? showQa,
  String? message,
  ReturnData? returnData,
  String? method,
  String? sessionID,
  String? id,
  String? isshow,
  num? data,
  String? isOTP,
  num? isfeedback,
}) => Auditdetails(  status: status ?? this.status,
  showQa: showQa ?? this.showQa,
  message: message ?? this.message,
  returnData: returnData ?? this.returnData,
  method: method ?? this.method,
  sessionID: sessionID ?? this.sessionID,
  id: id ?? this.id,
  isshow: isshow ?? this.isshow,
  data: data ?? this.data,
  isOTP: isOTP ?? this.isOTP,
  isfeedback: isfeedback ?? this.isfeedback,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['ShowQa'] = showQa;
    map['Message'] = message;
    if (returnData != null) {
      map['ReturnData'] = returnData?.toJson();
    }
    map['Method'] = method;
    map['SessionID'] = sessionID;
    map['ID'] = id;
    map['isshow'] = isshow;
    map['data'] = data;
    map['isOTP'] = isOTP;
    map['isfeedback'] = isfeedback;
    return map;
  }

}

class ReturnData {
  ReturnData({
      this.table,});

  ReturnData.fromJson(dynamic json) {
    if (json['Table'] != null) {
      table = [];
      json['Table'].forEach((v) {
        table?.add(AuditTable.fromJson(v));
      });
    }
  }
  List<AuditTable>? table;
ReturnData copyWith({  List<AuditTable>? table,
}) => ReturnData(  table: table ?? this.table,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (table != null) {
      map['Table'] = table?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class AuditTable {
  AuditTable({
      this.auditid, 
      this.sectorid, 
      this.auditname, 
      this.auditdescription, 
      this.startdate, 
      this.enddate, 
      this.cdate, 
      this.mdate,});

  AuditTable.fromJson(dynamic json) {
    auditid = json['auditid'];
    sectorid = json['sectorid'];
    auditname = json['auditname'];
    auditdescription = json['auditdescription'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    cdate = json['cdate'];
    mdate = json['mdate'];
  }
  num? auditid;
  num? sectorid;
  String? auditname;
  String? auditdescription;
  String? startdate;
  String? enddate;
  String? cdate;
  dynamic mdate;
AuditTable copyWith({  num? auditid,
  num? sectorid,
  String? auditname,
  String? auditdescription,
  String? startdate,
  String? enddate,
  String? cdate,
  dynamic mdate,
}) => AuditTable(  auditid: auditid ?? this.auditid,
  sectorid: sectorid ?? this.sectorid,
  auditname: auditname ?? this.auditname,
  auditdescription: auditdescription ?? this.auditdescription,
  startdate: startdate ?? this.startdate,
  enddate: enddate ?? this.enddate,
  cdate: cdate ?? this.cdate,
  mdate: mdate ?? this.mdate,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['auditid'] = auditid;
    map['sectorid'] = sectorid;
    map['auditname'] = auditname;
    map['auditdescription'] = auditdescription;
    map['startdate'] = startdate;
    map['enddate'] = enddate;
    map['cdate'] = cdate;
    map['mdate'] = mdate;
    return map;
  }

}
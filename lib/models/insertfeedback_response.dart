class InsertFeedbackResponse {
  InsertFeedbackResponse({
      this.id, 
      this.sessionID, 
      this.method, 
      this.returnData, 
      this.message, 
      this.status,});

  InsertFeedbackResponse.fromJson(dynamic json) {
    id = json['ID'];
    sessionID = json['SessionID'];
    method = json['Method'];
    if (json['ReturnData'] != null) {
      returnData = [];
      json['ReturnData'].forEach((v) {
        returnData?.add(ReturnData.fromJson(v));
      });
    }
    message = json['Message'];
    status = json['Status'];
  }
  String? id;
  String? sessionID;
  String? method;
  List<ReturnData>? returnData;
  String? message;
  bool? status;
InsertFeedbackResponse copyWith({  String? id,
  String? sessionID,
  String? method,
  List<ReturnData>? returnData,
  String? message,
  bool? status,
}) => InsertFeedbackResponse(  id: id ?? this.id,
  sessionID: sessionID ?? this.sessionID,
  method: method ?? this.method,
  returnData: returnData ?? this.returnData,
  message: message ?? this.message,
  status: status ?? this.status,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['SessionID'] = sessionID;
    map['Method'] = method;
    if (returnData != null) {
      map['ReturnData'] = returnData?.map((v) => v.toJson()).toList();
    }
    map['Message'] = message;
    map['Status'] = status;
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
        table?.add(Table.fromJson(v));
      });
    }
  }
  List<Table>? table;
ReturnData copyWith({  List<Table>? table,
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

class Table {
  Table({
      this.saveStatus, 
      this.clientguid, 
      this.auditorguid, 
      this.gid, 
      this.did, 
      this.auditee, 
      this.auditor, 
      this.aomname, 
      this.sbuname, 
      this.clientperon, 
      this.ssa, 
      this.site, 
      this.client, 
      this.auditdate, 
      this.sector, 
      this.location, 
      this.company, 
      this.sbu,});

  Table.fromJson(dynamic json) {
    saveStatus = json['SaveStatus'];
    clientguid = json['clientguid'];
    auditorguid = json['auditorguid'];
    gid = json['gid'];
    did = json['did'];
    auditee = json['auditee'];
    auditor = json['auditor'];
    aomname = json['aomname'];
    sbuname = json['sbuname'];
    clientperon = json['clientperon'];
    ssa = json['ssa'];
    site = json['site'];
    client = json['client'];
    auditdate = json['auditdate'];
    sector = json['sector'];
    location = json['location'];
    company = json['company'];
    sbu = json['sbu'];
  }
  String? saveStatus;
  String? clientguid;
  String? auditorguid;
  String? gid;
  String? did;
  String? auditee;
  String? auditor;
  String? aomname;
  String? sbuname;
  String? clientperon;
  String? ssa;
  String? site;
  String? client;
  String? auditdate;
  String? sector;
  String? location;
  String? company;
  String? sbu;
Table copyWith({  String? saveStatus,
  String? clientguid,
  String? auditorguid,
  String? gid,
  String? did,
  String? auditee,
  String? auditor,
  String? aomname,
  String? sbuname,
  String? clientperon,
  String? ssa,
  String? site,
  String? client,
  String? auditdate,
  String? sector,
  String? location,
  String? company,
  String? sbu,
}) => Table(  saveStatus: saveStatus ?? this.saveStatus,
  clientguid: clientguid ?? this.clientguid,
  auditorguid: auditorguid ?? this.auditorguid,
  gid: gid ?? this.gid,
  did: did ?? this.did,
  auditee: auditee ?? this.auditee,
  auditor: auditor ?? this.auditor,
  aomname: aomname ?? this.aomname,
  sbuname: sbuname ?? this.sbuname,
  clientperon: clientperon ?? this.clientperon,
  ssa: ssa ?? this.ssa,
  site: site ?? this.site,
  client: client ?? this.client,
  auditdate: auditdate ?? this.auditdate,
  sector: sector ?? this.sector,
  location: location ?? this.location,
  company: company ?? this.company,
  sbu: sbu ?? this.sbu,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['SaveStatus'] = saveStatus;
    map['clientguid'] = clientguid;
    map['auditorguid'] = auditorguid;
    map['gid'] = gid;
    map['did'] = did;
    map['auditee'] = auditee;
    map['auditor'] = auditor;
    map['aomname'] = aomname;
    map['sbuname'] = sbuname;
    map['clientperon'] = clientperon;
    map['ssa'] = ssa;
    map['site'] = site;
    map['client'] = client;
    map['auditdate'] = auditdate;
    map['sector'] = sector;
    map['location'] = location;
    map['company'] = company;
    map['sbu'] = sbu;
    return map;
  }

}
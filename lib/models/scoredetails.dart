class Scoredetails {
  Scoredetails({
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

  Scoredetails.fromJson(dynamic json) {
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
  dynamic isshow;
  num? data;
  dynamic isOTP;
  num? isfeedback;
Scoredetails copyWith({  bool? status,
  bool? showQa,
  String? message,
  ReturnData? returnData,
  String? method,
  String? sessionID,
  String? id,
  dynamic isshow,
  num? data,
  dynamic isOTP,
  num? isfeedback,
}) => Scoredetails(  status: status ?? this.status,
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
        table?.add(ScoreTable.fromJson(v));
      });
    }
  }
  List<ScoreTable>? table;
ReturnData copyWith({  List<ScoreTable>? table,
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

class ScoreTable {
  ScoreTable({
      this.scoreid, 
      this.scorename, 
      this.score, 
      this.auditid, 
      this.isdefault, 
      this.isnotapplicable,});

  ScoreTable.fromJson(dynamic json) {
    scoreid = json['scoreid'];
    scorename = json['scorename'];
    score = json['score'];
    auditid = json['auditid'];
    isdefault = json['isdefault'];
    isnotapplicable = json['isnotapplicable'];
  }
  num? scoreid;
  String? scorename;
  num? score;
  num? auditid;
  bool? isdefault;
  bool? isnotapplicable;
  ScoreTable copyWith({  num? scoreid,
  String? scorename,
    num? score,
  num? auditid,
  bool? isdefault,
  bool? isnotapplicable,
}) => ScoreTable(  scoreid: scoreid ?? this.scoreid,
  scorename: scorename ?? this.scorename,
  score: score ?? this.score,
  auditid: auditid ?? this.auditid,
  isdefault: isdefault ?? this.isdefault,
  isnotapplicable: isnotapplicable ?? this.isnotapplicable,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['scoreid'] = scoreid;
    map['scorename'] = scorename;
    map['score'] = score;
    map['auditid'] = auditid;
    map['isdefault'] = isdefault;
    map['isnotapplicable'] = isnotapplicable;
    return map;
  }

}
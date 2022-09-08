class Questiondetails {
  Questiondetails({
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

  Questiondetails.fromJson(dynamic json) {
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
Questiondetails copyWith({  bool? status,
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
}) => Questiondetails(  status: status ?? this.status,
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
        table?.add(QuestionTable.fromJson(v));
      });
    }
  }
  List<QuestionTable>? table;
ReturnData copyWith({  List<QuestionTable>? table,
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

class QuestionTable {
  QuestionTable({
      this.auditqid, 
      this.auditqname, 
      this.qdescription, 
      this.categoryid, 
      this.ratingid, 
      this.weightageid, 
      this.cdate,});

  QuestionTable.fromJson(dynamic json) {
    auditqid = json['auditqid'];
    auditqname = json['auditqname'];
    qdescription = json['qdescription'];
    categoryid = json['categoryid'];
    ratingid = json['ratingid'];
    weightageid = json['weightageid'];
    cdate = json['cdate'];
  }
  num? auditqid;
  String? auditqname;
  String? qdescription;
  num? categoryid;
  num? ratingid;
  num? weightageid;
  String? cdate;
QuestionTable copyWith({  num? auditqid,
  String? auditqname,
  String? qdescription,
  num? categoryid,
  num? ratingid,
  num? weightageid,
  String? cdate,
}) => QuestionTable(  auditqid: auditqid ?? this.auditqid,
  auditqname: auditqname ?? this.auditqname,
  qdescription: qdescription ?? this.qdescription,
  categoryid: categoryid ?? this.categoryid,
  ratingid: ratingid ?? this.ratingid,
  weightageid: weightageid ?? this.weightageid,
  cdate: cdate ?? this.cdate,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['auditqid'] = auditqid;
    map['auditqname'] = auditqname;
    map['qdescription'] = qdescription;
    map['categoryid'] = categoryid;
    map['ratingid'] = ratingid;
    map['weightageid'] = weightageid;
    map['cdate'] = cdate;
    return map;
  }

}
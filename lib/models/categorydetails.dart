class Categorydetails {
  Categorydetails({
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

  Categorydetails.fromJson(dynamic json) {
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
Categorydetails copyWith({  bool? status,
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
}) => Categorydetails(  status: status ?? this.status,
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
        table?.add(CategoryTable.fromJson(v));
      });
    }
  }
  List<CategoryTable>? table;
ReturnData copyWith({  List<CategoryTable>? table,
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

class CategoryTable {
  CategoryTable({
      this.categoryid, 
      this.companyid, 
      this.auditid, 
      this.categoryname, 
      this.emailid, 
      this.cdate,
      this.percentage,
  });

  CategoryTable.fromJson(dynamic json) {
    categoryid = json['categoryid'];
    companyid = json['companyid'];
    auditid = json['auditid'];
    categoryname = json['categoryname'];
    emailid = json['emailid'];
    cdate = json['cdate'];
    percentage = json['percentage'];
  }
  num? categoryid;
  num? companyid;
  num? auditid;
  String? categoryname;
  String? emailid;
  String? cdate;
  String? percentage;
CategoryTable copyWith({  num? categoryid,
  num? companyid,
  num? auditid,
  String? categoryname,
  String? emailid,
  String? cdate,
  String? percentage,
}) => CategoryTable(  categoryid: categoryid ?? this.categoryid,
  companyid: companyid ?? this.companyid,
  auditid: auditid ?? this.auditid,
  categoryname: categoryname ?? this.categoryname,
  emailid: emailid ?? this.emailid,
  cdate: cdate ?? this.cdate,
  percentage: percentage ?? this.percentage,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['categoryid'] = categoryid;
    map['companyid'] = companyid;
    map['auditid'] = auditid;
    map['categoryname'] = categoryname;
    map['emailid'] = emailid;
    map['cdate'] = cdate;
    map['percentage'] = percentage;
    return map;
  }

}
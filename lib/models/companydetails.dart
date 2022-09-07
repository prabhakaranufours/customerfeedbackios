class Companydetails {
  Companydetails(
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
      this.isfeedback,);

  Companydetails.fromJson(dynamic json) {
    status = json['Status'];
    showQa = json['ShowQa'];
    message = json['Message'];
    returnData = ReturnData.fromJson(json['ReturnData']) ;
    method = json['Method'];
    sessionID = json['SessionID'];
    id = json['ID'];
    isshow = json['isshow'];
    data = json['data'];
    isOTP = json['isOTP'];
    isfeedback = json['isfeedback'];
  }

  late bool status;
  late bool showQa;
  late String message;
  late ReturnData returnData;
  late String method;
  late String sessionID;
  late String id;
  dynamic isshow;
  late num data;
  dynamic isOTP;
  late num isfeedback;

// Companydetails copyWith({  bool? status,
//   bool? showQa,
//   String? message,
//   ReturnData? returnData,
//   String? method,
//   String? sessionID,
//   String? id,
//   dynamic isshow,
//   num? data,
//   dynamic isOTP,
//   num? isfeedback,
// }) => Companydetails(  status: status ?? this.status,
//   showQa: showQa ?? this.showQa,
//   message: message ?? this.message,
//   returnData: returnData ?? this.returnData,
//   method: method ?? this.method,
//   sessionID: sessionID ?? this.sessionID,
//   id: id ?? this.id,
//   isshow: isshow ?? this.isshow,
//   data: data ?? this.data,
//   isOTP: isOTP ?? this.isOTP,
//   isfeedback: isfeedback ?? this.isfeedback,
// );
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
        table?.add(CompanyTable.fromJson(v));
      });
    }
  }
  List<CompanyTable>? table;
ReturnData copyWith({  List<CompanyTable>? table,
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

class CompanyTable {
  CompanyTable(
      this.stateid, 
      this.companyID, 
      this.groupID, 
      this.companyName, 
      this.companyShortName, 
      this.sectorid, 
      this.userCompanyID, 
      this.groupName,);

  CompanyTable.fromJson(dynamic json) {
    stateid = json['stateid'];
    companyID = json['CompanyID'];
    groupID = json['GroupID'];
    companyName = json['CompanyName'];
    companyShortName = json['CompanyShortName'];
    sectorid = json['sectorid'];
    userCompanyID = json['UserCompanyID'];
    groupName = json['GroupName'];
  }
  late num stateid;
  late num companyID;
  late num groupID;
  late String companyName;
  late String companyShortName;
  late num sectorid;
  late num userCompanyID;
  late String groupName;

// Table copyWith({  num? stateid,
//   num? companyID,
//   num? groupID,
//   String? companyName,
//   String? companyShortName,
//   num? sectorid,
//   num? userCompanyID,
//   String? groupName,
// }) => Table(  stateid: stateid ?? this.stateid,
//   companyID: companyID ?? this.companyID,
//   groupID: groupID ?? this.groupID,
//   companyName: companyName ?? this.companyName,
//   companyShortName: companyShortName ?? this.companyShortName,
//   sectorid: sectorid ?? this.sectorid,
//   userCompanyID: userCompanyID ?? this.userCompanyID,
//   groupName: groupName ?? this.groupName,
// );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stateid'] = stateid;
    map['CompanyID'] = companyID;
    map['GroupID'] = groupID;
    map['CompanyName'] = companyName;
    map['CompanyShortName'] = companyShortName;
    map['sectorid'] = sectorid;
    map['UserCompanyID'] = userCompanyID;
    map['GroupName'] = groupName;
    return map;
  }

}
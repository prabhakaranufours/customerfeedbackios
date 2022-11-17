class Sbudetails {
  Sbudetails(
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

  Sbudetails.fromJson(dynamic json) {
    status = json['Status'];
    showQa = json['ShowQa'];
    message = json['Message'];
    returnData = ReturnData.fromJson(json['ReturnData']);
    method = json['Method'];
    sessionID = json['SessionID'];
    id = json['ID'];
    isshow = json['isshow'] ?? false;
    data = json['data'];
    isOTP = json['isOTP'] ?? "";
    isfeedback = json['isfeedback'];
  }
  late bool status;
  late bool showQa;
  late String message;
  late ReturnData returnData;
  late String method;
  late String sessionID;
  late String id;
  late bool isshow;
  late num data;
  late String isOTP;
  late num isfeedback;

// Sbudetails copyWith({  bool? status,
//   bool? showQa,
//   String? message,
//   ReturnData? returnData,
//   String? method,
//   String? sessionID,
//   String? id,
//   String? isshow,
//   num? data,
//   String? isOTP,
//   num? isfeedback,
// }) => Sbudetails(  status: status ?? this.status,
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
        table?.add(SBUTable.fromJson(v));
      });
    }
  }
  List<SBUTable>? table;
ReturnData copyWith({  List<SBUTable>? table,
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

class SBUTable {
  SBUTable({
      this.locationsettingsid, 
      this.locationsettingsname,});

  SBUTable.fromJson(dynamic json) {
    locationsettingsid = json['locationsettingsid'];
    locationsettingsname = json['locationsettingsname'];
  }
  num? locationsettingsid;
  String? locationsettingsname;
  SBUTable copyWith({  num? locationsettingsid,
  String? locationsettingsname,
}) => SBUTable(  locationsettingsid: locationsettingsid ?? this.locationsettingsid,
  locationsettingsname: locationsettingsname ?? this.locationsettingsname,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['locationsettingsid'] = locationsettingsid;
    map['locationsettingsname'] = locationsettingsname;
    return map;
  }

}
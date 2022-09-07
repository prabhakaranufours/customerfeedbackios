class Locationdetails {
  Locationdetails({
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

  Locationdetails.fromJson(dynamic json) {
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
Locationdetails copyWith({  bool? status,
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
}) => Locationdetails(  status: status ?? this.status,
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
        table?.add(LocationTable.fromJson(v));
      });
    }
  }
  List<LocationTable>? table;
ReturnData copyWith({  List<LocationTable>? table,
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

class LocationTable {
  LocationTable({
      this.locationID, 
      this.companyID, 
      this.locationName, 
      this.ssano, 
      this.sbu, 
      this.sectorid, 
      this.clientMobileNo,});

  LocationTable.fromJson(dynamic json) {
    locationID = json['LocationID'];
    companyID = json['CompanyID'];
    locationName = json['LocationName'];
    ssano = json['ssano'];
    sbu = json['sbu'];
    sectorid = json['sectorid'];
    clientMobileNo = json['ClientMobileNo'];
  }
  num? locationID;
  num? companyID;
  String? locationName;
  String? ssano;
  num? sbu;
  num? sectorid;
  String? clientMobileNo;
LocationTable copyWith({  num? locationID,
  num? companyID,
  String? locationName,
  String? ssano,
  num? sbu,
  num? sectorid,
  String? clientMobileNo,
}) => LocationTable(  locationID: locationID ?? this.locationID,
  companyID: companyID ?? this.companyID,
  locationName: locationName ?? this.locationName,
  ssano: ssano ?? this.ssano,
  sbu: sbu ?? this.sbu,
  sectorid: sectorid ?? this.sectorid,
  clientMobileNo: clientMobileNo ?? this.clientMobileNo,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['LocationID'] = locationID;
    map['CompanyID'] = companyID;
    map['LocationName'] = locationName;
    map['ssano'] = ssano;
    map['sbu'] = sbu;
    map['sectorid'] = sectorid;
    map['ClientMobileNo'] = clientMobileNo;
    return map;
  }

}
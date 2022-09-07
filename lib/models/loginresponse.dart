class Loginresponse {
  Loginresponse(
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
    this.isfeedback,
  );

  Loginresponse.fromJson(dynamic json) {
    status = json['Status'];
    showQa = json['ShowQa'];
    message = json['Message'];
    returnData = ReturnData.fromJson(json['ReturnData']);
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

// Loginresponse copyWith({  bool? status,
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
// }) => Loginresponse(  status: status ?? this.status,
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
    this.userDetails,
  });

  ReturnData.fromJson(dynamic json) {
    if (json['UserDetails'] != null) {
      userDetails = [];
      json['UserDetails'].forEach((v) {
        userDetails?.add(UserDetails.fromJson(v));
      });
    }
  }

  List<UserDetails>? userDetails;

  ReturnData copyWith({
    List<UserDetails>? userDetails,
  }) =>
      ReturnData(
        userDetails: userDetails ?? this.userDetails,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (userDetails != null) {
      map['UserDetails'] = userDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class UserDetails {
  UserDetails(
    this.fromFramework,
    this.countryID,
    this.countryIDCurrent,
    this.roleID,
    this.userID,
    this.companyIDUser,
    this.locationIDUser,
    this.companyName,
    this.companyIDCurrent,
    this.locationName,
    this.locationIDCurrent,
    this.groupID,
    this.groupIDCurrent,
    this.languageID,
    this.userFirstName,
    this.userLastName,
    this.themeFolderPath,
    this.compLogo,
    this.announcement,
    this.isWorkstationLogin,
    this.roleformshowid,
    this.emailID,
    this.showQA,
    this.departmentID,
    this.departmentName,
  );

  UserDetails.fromJson(dynamic json) {
    fromFramework = json['FromFramework'];
    countryID = json['CountryID'];
    countryIDCurrent = json['CountryIDCurrent'];
    roleID = json['RoleID'];
    userID = json['UserID'];
    companyIDUser = json['CompanyIDUser'];
    locationIDUser = json['LocationIDUser'];
    companyName = json['CompanyName'];
    companyIDCurrent = json['CompanyIDCurrent'];
    locationName = json['LocationName'];
    locationIDCurrent = json['LocationIDCurrent'];
    groupID = json['GroupID'];
    groupIDCurrent = json['GroupIDCurrent'];
    languageID = json['LanguageID'];
    userFirstName = json['UserFirstName'];
    userLastName = json['UserLastName'];
    themeFolderPath = json['ThemeFolderPath'];
    compLogo = json['CompLogo'];
    announcement = json['Announcement'];
    isWorkstationLogin = json['IsWorkstationLogin'];
    roleformshowid = json['Roleformshowid'];
    emailID = json['EmailID'];
    showQA = json['showQA'];
    departmentID = json['DepartmentID'];
    departmentName = json['DepartmentName'];
  }

  late bool fromFramework;
  late num countryID;
  late num countryIDCurrent;
  late num roleID;
  late num userID;
  late num companyIDUser;
  late num locationIDUser;
  late String companyName;
  late num companyIDCurrent;
  late String locationName;
  late num locationIDCurrent;
  late num groupID;
  late num groupIDCurrent;
  late num languageID;
  late String userFirstName;
  late String userLastName;
  dynamic themeFolderPath;
  late String compLogo;
  late String announcement;
  late num isWorkstationLogin;
  late num roleformshowid;
  late String emailID;
  late bool showQA;
  late num departmentID;
  dynamic departmentName;

// UserDetails copyWith({  bool? fromFramework,
//   num? countryID,
//   num? countryIDCurrent,
//   num? roleID,
//   num? userID,
//   num? companyIDUser,
//   num? locationIDUser,
//   String? companyName,
//   num? companyIDCurrent,
//   String? locationName,
//   num? locationIDCurrent,
//   num? groupID,
//   num? groupIDCurrent,
//   num? languageID,
//   String? userFirstName,
//   String? userLastName,
//   dynamic themeFolderPath,
//   String? compLogo,
//   String? announcement,
//   num? isWorkstationLogin,
//   num? roleformshowid,
//   String? emailID,
//   bool? showQA,
//   num? departmentID,
//   dynamic departmentName,
// }) => UserDetails(  fromFramework: fromFramework ?? this.fromFramework,
//   countryID: countryID ?? this.countryID,
//   countryIDCurrent: countryIDCurrent ?? this.countryIDCurrent,
//   roleID: roleID ?? this.roleID,
//   userID: userID ?? this.userID,
//   companyIDUser: companyIDUser ?? this.companyIDUser,
//   locationIDUser: locationIDUser ?? this.locationIDUser,
//   companyName: companyName ?? this.companyName,
//   companyIDCurrent: companyIDCurrent ?? this.companyIDCurrent,
//   locationName: locationName ?? this.locationName,
//   locationIDCurrent: locationIDCurrent ?? this.locationIDCurrent,
//   groupID: groupID ?? this.groupID,
//   groupIDCurrent: groupIDCurrent ?? this.groupIDCurrent,
//   languageID: languageID ?? this.languageID,
//   userFirstName: userFirstName ?? this.userFirstName,
//   userLastName: userLastName ?? this.userLastName,
//   themeFolderPath: themeFolderPath ?? this.themeFolderPath,
//   compLogo: compLogo ?? this.compLogo,
//   announcement: announcement ?? this.announcement,
//   isWorkstationLogin: isWorkstationLogin ?? this.isWorkstationLogin,
//   roleformshowid: roleformshowid ?? this.roleformshowid,
//   emailID: emailID ?? this.emailID,
//   showQA: showQA ?? this.showQA,
//   departmentID: departmentID ?? this.departmentID,
//   departmentName: departmentName ?? this.departmentName,
// );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FromFramework'] = fromFramework ? 1 : 0;
    map['CountryID'] = countryID;
    map['CountryIDCurrent'] = countryIDCurrent;
    map['RoleID'] = roleID;
    map['UserID'] = userID;
    map['CompanyIDUser'] = companyIDUser;
    map['LocationIDUser'] = locationIDUser;
    map['CompanyName'] = companyName;
    map['CompanyIDCurrent'] = companyIDCurrent;
    map['LocationName'] = locationName;
    map['LocationIDCurrent'] = locationIDCurrent;
    map['GroupID'] = groupID;
    map['GroupIDCurrent'] = groupIDCurrent;
    map['LanguageID'] = languageID;
    map['UserFirstName'] = userFirstName;
    map['UserLastName'] = userLastName;
    map['ThemeFolderPath'] = themeFolderPath;
    map['CompLogo'] = compLogo;
    map['Announcement'] = announcement;
    map['IsWorkstationLogin'] = isWorkstationLogin;
    map['Roleformshowid'] = roleformshowid;
    map['EmailID'] = emailID;
    map['showQA'] = showQA ? 1 : 0;
    map['DepartmentID'] = departmentID;
    map['DepartmentName'] = departmentName;
    return map;
  }
}

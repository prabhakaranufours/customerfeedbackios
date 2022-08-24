class UserDetails {
  UserDetails({
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
      this.departmentName,});

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
  bool? fromFramework;
  num? countryID;
  num? countryIDCurrent;
  num? roleID;
  num? userID;
  num? companyIDUser;
  num? locationIDUser;
  String? companyName;
  num? companyIDCurrent;
  String? locationName;
  num? locationIDCurrent;
  num? groupID;
  num? groupIDCurrent;
  num? languageID;
  String? userFirstName;
  String? userLastName;
  dynamic themeFolderPath;
  String? compLogo;
  String? announcement;
  num? isWorkstationLogin;
  num? roleformshowid;
  String? emailID;
  bool? showQA;
  num? departmentID;
  dynamic departmentName;
UserDetails copyWith({  bool? fromFramework,
  num? countryID,
  num? countryIDCurrent,
  num? roleID,
  num? userID,
  num? companyIDUser,
  num? locationIDUser,
  String? companyName,
  num? companyIDCurrent,
  String? locationName,
  num? locationIDCurrent,
  num? groupID,
  num? groupIDCurrent,
  num? languageID,
  String? userFirstName,
  String? userLastName,
  dynamic themeFolderPath,
  String? compLogo,
  String? announcement,
  num? isWorkstationLogin,
  num? roleformshowid,
  String? emailID,
  bool? showQA,
  num? departmentID,
  dynamic departmentName,
}) => UserDetails(  fromFramework: fromFramework ?? this.fromFramework,
  countryID: countryID ?? this.countryID,
  countryIDCurrent: countryIDCurrent ?? this.countryIDCurrent,
  roleID: roleID ?? this.roleID,
  userID: userID ?? this.userID,
  companyIDUser: companyIDUser ?? this.companyIDUser,
  locationIDUser: locationIDUser ?? this.locationIDUser,
  companyName: companyName ?? this.companyName,
  companyIDCurrent: companyIDCurrent ?? this.companyIDCurrent,
  locationName: locationName ?? this.locationName,
  locationIDCurrent: locationIDCurrent ?? this.locationIDCurrent,
  groupID: groupID ?? this.groupID,
  groupIDCurrent: groupIDCurrent ?? this.groupIDCurrent,
  languageID: languageID ?? this.languageID,
  userFirstName: userFirstName ?? this.userFirstName,
  userLastName: userLastName ?? this.userLastName,
  themeFolderPath: themeFolderPath ?? this.themeFolderPath,
  compLogo: compLogo ?? this.compLogo,
  announcement: announcement ?? this.announcement,
  isWorkstationLogin: isWorkstationLogin ?? this.isWorkstationLogin,
  roleformshowid: roleformshowid ?? this.roleformshowid,
  emailID: emailID ?? this.emailID,
  showQA: showQA ?? this.showQA,
  departmentID: departmentID ?? this.departmentID,
  departmentName: departmentName ?? this.departmentName,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FromFramework'] = fromFramework;
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
    map['showQA'] = showQA;
    map['DepartmentID'] = departmentID;
    map['DepartmentName'] = departmentName;
    return map;
  }

}
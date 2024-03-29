import 'dart:io';

import 'package:customerfeedbackios/models/auditdetails.dart';
import 'package:customerfeedbackios/models/categorydetails.dart';
import 'package:customerfeedbackios/models/companydetails.dart';
import 'package:customerfeedbackios/models/feedbackimages.dart';
import 'package:customerfeedbackios/models/locationdetails.dart';
import 'package:customerfeedbackios/models/loginresponse.dart';
import 'package:customerfeedbackios/models/questiondetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/auditdata.dart';
import '../models/categorydata.dart';
import '../models/sbudetails.dart';
import '../models/scoredetails.dart';

class DatabaseHelper {
  static const _dbName = 'CustomerFeedback.db';
  static const _dbVersion = 2;
  static const _userDetails = 'userDetails';
  static const _sbuDetails = "sbuDetails";
  static const _companyDetails = "companyDetails";
  static const _locationDetails = "locationDetails";
  static const _auditDetails = "auditDetails";
  static const _categoryDetails = "categoryDetails";
  static const _questionDetails = "questionDetails";
  static const _scoreDetails = "scoreDetails";

  static const _categoryData = "categoryData";
  static const _auditData = "auditData";
  static const _feedbackImages = "feedbackImages";

  //UserDetails
  static const FromFramework = 'FromFramework';
  static const CountryID = 'CountryID';
  static const CountryIDCurrent = 'CountryIDCurrent';
  static const RoleID = 'RoleID';
  static const UserID = 'UserID';
  static const CompanyIDUser = 'CompanyIDUser';
  static const LocationIDUser = 'LocationIDUser';
  static const CompanyName = 'CompanyName';
  static const CompanyIDCurrent = 'CompanyIDCurrent';
  static const LocationName = 'LocationName';
  static const LocationIDCurrent = 'LocationIDCurrent';
  static const GroupID = 'GroupID';
  static const GroupIDCurrent = 'GroupIDCurrent';
  static const LanguageID = 'LanguageID';
  static const UserFirstName = 'UserFirstName';
  static const UserLastName = 'UserLastName';
  static const ThemeFolderPath = 'themeFolderPath';
  static const CompLogo = 'CompLogo';
  static const Announcement = 'Announcement';
  static const IsWorkstationLogin = 'IsWorkstationLogin';
  static const Roleformshowid = 'Roleformshowid';
  static const EmailID = 'EmailID';
  static const showQA = 'showQA';
  static const departmentID = 'departmentID';
  static const departmentName = 'departmentName';
  static const id = 'id';

  //SBU Table
  static const SBUID = 'id';
  static const LocationSettingID = 'locationsettingsid';
  static const LocationSettingName = 'locationsettingsname';

  //Company Table
  static const CompID = 'id';
  static const StateID = 'stateid';
  static const CompanyID = 'CompanyID';
  static const Company_GroupID = 'GroupID';
  static const Company_CompanyName = 'CompanyName';
  static const CompanyShortName = 'CompanyShortName';
  static const SectorID = 'sectorid';
  static const UserCompanyID = 'UserCompanyID';
  static const GroupName = 'GroupName';
  static const Sbu = 'sbu';

  //Location Table
  static const LocID = 'id';
  static const LocationID = 'LocationID';
  static const Location_CompanyID = 'CompanyID';
  static const Location_LocationName = 'LocationName';
  static const Location_ssano = 'ssano';
  static const Location_sbu = 'sbu';
  static const Location_sectorid = 'sectorid';
  static const Location_ClientMobileNo = 'ClientMobileNo';

  //Audit Table
  static const AudID = 'id';
  static const AuditID = 'auditid';
  static const Audit_SectorID = 'sectorid';
  static const Audit_Auditname = 'auditname';
  static const Audit_Auditdescription = 'auditdescription';
  static const Audit_Startdate = 'startdate';
  static const Audit_Enddate = 'enddate';

  //Category Table
  static const CatID = 'id';
  static const CategoryID = 'categoryid';
  static const Cat_Companyid = 'companyid';
  static const Cat_Auditid = 'auditid';
  static const Cat_Categoryname = 'categoryname';
  static const Cat_Emailid = 'emailid';
  static const Cat_Cdate = 'cdate';
  static const Cat_Percentage = 'percentage';

  //Question Table
  static const QuesID = 'id';
  static const Ques_Auditqid = 'auditqid';
  static const Ques_Auditqname = 'auditqname';
  static const Ques_Qdescription = 'qdescription';
  static const Ques_Categoryid = 'categoryid';
  static const Ques_Ratingid = 'ratingid';
  static const Ques_Weightageid = 'weightageid';
  static const Ques_Cdate = 'cdate';

  //Score Table
  static const ScoreID = 'id';
  static const Score_Scoremdate = 'mdate';
  static const Score_Scorecdate = 'cdate';
  static const Score_Scoreisnotapplicable = 'isnotapplicable';
  static const Score_Scoreisdefault = 'isdefault';
  static const Score_Scoreauditid = 'auditid';
  static const Score_Scorescore = 'score';
  static const Score_Scorescorename = 'scorename';
  static const Score_Scorescoreid = 'scoreid';

  //categoryData Table
  static const CatDataID = 'id';
  static const CatData_CategoryDone = "categorydone";
  static const CatData_Weightage = "weightage";
  static const CatData_UploadFileName = "uploadfilename";
  static const CatData_ImageName = "imagename";
  static const CatData_Image = "image";
  static const CatData_Remarks = "remarks";
  static const CatData_ScoreId = "scoreid";
  static const CatData_Question = "question";
  static const CatData_QuestionId = "questionid";
  static const CatData_CategoryId = "categoryid";
  static const CataData_SectorId = "sectorid";
  static const CatData_AuditId = "auditid";
  static const CatData_LocationId = "locationid";
  static const CatData_CompanyId = "companyid";
  static const CatData_SbuId = "sbuid";
  static const CatData_Percentage = "Percentage";

  //AuditData Table
  static const AuditDataID = 'id';
  static const AuditData_str_clientfeedback = "str_clientfeedback";
  static const AuditData_str_additionalinformatin = "str_additionalinformatin";
  static const AuditData_clientsign = "clientsign";
  static const AuditData_auditsign = "auditsign";
  static const AuditData_auditdate = "auditdate";
  static const AuditData_userid = "userid";
  static const AuditData_guid = "guid";
  static const AuditData_deviceid = "deviceid";
  static const AuditData_uploadguid = "uploadguid";
  static const AuditData_uploadfilename = "uploadfilename";
  static const AuditData_auditeename = "auditeename";
  static const AuditData_auditorname = "auditorname";
  static const AuditData_oamname = "oamname";
  static const AuditData_sbuname = "sbuname";
  static const AuditData_clientperson = "clientperson";
  static const AuditData_ssano = "ssano";
  static const AuditData_sitename = "sitename";
  static const AuditData_clientname = "clientname";
  static const AuditData_xmldata = "xmldata";
  static const AuditData_categoryid = "categoryid";
  static const AuditData_auditid = "auditid";
  static const AuditData_sectorid = "sectorid";
  static const AuditData_locationid = "locationid";
  static const AuditData_companyid = "companyid";
  static const AuditData_sbuid = "sbuid";
  static const AuditData_observation = "observation";
  static const AuditData_isfeedback = "isfeedback";

  //FeedbackImages Table
  static const FeedbackImageID = 'id';
  static const FeedbackImage_deviceId = "deviceId";
  static const FeedbackImage_imageGUID = "imageGUID";
  static const FeedbackImage_image = "image";
  static const FeedbackImage_categoryId = "categoryid";
  static const FeedbackImage_auditId = "auditId";
  static const FeedbackImage_locationId = "locationId";
  static const FeedbackImage_companyId = "companyId";
  static const FeedbackImage_sbuId = "sbuId";
  static const FeedbackImage_imageName = "imageName";

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initiateDatabase();
    return _database!;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path + "/CustomerFeedback_IOS/", _dbName);
    return await openDatabase(path,
        version: _dbVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  // UPGRADE DATABASE TABLES
  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    if (oldVersion < newVersion) {
      db.execute("ALTER TABLE $_companyDetails ADD COLUMN sbu TEXT;");
    }
  }

  Future _onCreate(Database db, int version) async {
    db.execute('''CREATE TABLE $_userDetails( 
      $id INTEGER PRIMARY KEY, 
      $departmentName TEXT,
      $departmentID TEXT NOT NULL,
      $showQA TEXT NOT NULL,
      $EmailID TEXT NOT NULL,
      $Roleformshowid TEXT NOT NULL,      
      $IsWorkstationLogin TEXT NOT NULL,
      $Announcement TEXT NOT NULL,
      $CompLogo TEXT NOT NULL,
      $ThemeFolderPath TEXT,
      $UserLastName TEXT NOT NULL,
      $UserFirstName TEXT NOT NULL,
      $LanguageID TEXT NOT NULL,
      $GroupIDCurrent TEXT NOT NULL,
      $GroupID TEXT NOT NULL,
      $LocationIDCurrent TEXT NOT NULL,
      $LocationName TEXT NOT NULL,
      $CompanyIDCurrent TEXT,
      $CompanyName TEXT NOT NULL,
      $LocationIDUser TEXT NOT NULL,
      $CompanyIDUser TEXT NOT NULL,
      $UserID TEXT NOT NULL,
      $RoleID TEXT NOT NULL,
      $CountryIDCurrent TEXT NOT NULL,
      $CountryID TEXT NOT NULL,
      $FromFramework BOOLEAN)
      ''');

    db.execute('''CREATE TABLE $_sbuDetails(
    $id INTEGER PRIMARY KEY,
    $LocationSettingID TEXT,
    $LocationSettingName TEXT)
    ''');

    db.execute('''CREATE TABLE $_companyDetails(
    $CompID INTEGER PRIMARY KEY,
    $StateID TEXT,
    $CompanyID TEXT,
    $Company_GroupID TEXT,
    $Company_CompanyName TEXT,
    $CompanyShortName TEXT,
    $SectorID TEXT,
    $UserCompanyID TEXT,
    $GroupName TEXT,     
    $Sbu TEXT      
    )''');

    try {
      db.execute('''CREATE TABLE $_locationDetails(
    $LocID INTEGER PRIMARY KEY,
    $LocationID TEXT,
    $Location_CompanyID TEXT,
    $Location_LocationName TEXT,
    $Location_ssano TEXT,
    $Location_sbu TEXT,
    $Location_sectorid TEXT,
    $Location_ClientMobileNo TEXT) 
    ''');
    } catch (e) {
      print(e);
    }

    db.execute('''CREATE TABLE $_auditDetails(
    $AudID INTEGER PRIMARY KEY,
    $AuditID TEXT,
    $Audit_SectorID TEXT,
    $Audit_Auditname TEXT,
    $Audit_Auditdescription TEXT,
    $Audit_Startdate TEXT,
    $Audit_Enddate TEXT)
    ''');

    db.execute('''CREATE TABLE $_categoryDetails(
      $CatID INTEGER PRIMARY KEY,
      $CategoryID TEXT,
      $Cat_Companyid TEXT,
      $Cat_Auditid TEXT,
      $Cat_Categoryname TEXT,
      $Cat_Emailid TEXT,
      $Cat_Cdate TEXT,
      $Cat_Percentage TEXT)
      ''');

    db.execute('''CREATE TABLE $_questionDetails(
      $QuesID INTEGER PRIMARY KEY,
      $Ques_Auditqid TEXT,
      $Ques_Auditqname TEXT,
      $Ques_Qdescription TEXT,
      $Ques_Categoryid TEXT,
      $Ques_Ratingid TEXT,
      $Ques_Weightageid TEXT,
      $Ques_Cdate TEXT)
      ''');

    db.execute('''CREATE TABLE $_scoreDetails(
      $ScoreID INTEGER PRIMARY KEY,
      $Score_Scoremdate TEXT,
      $Score_Scorecdate TEXT,
      $Score_Scoreisnotapplicable TEXT,
      $Score_Scoreisdefault TEXT,
      $Score_Scoreauditid TEXT,
      $Score_Scorescore TEXT,
      $Score_Scorescorename TEXT,
      $Score_Scorescoreid TEXT)    
     ''');

    db.execute('''CREATE TABLE $_categoryData(
      $CatDataID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      $CatData_CategoryDone TEXT,
      $CatData_Weightage TEXT,
      $CatData_UploadFileName TEXT,
      $CatData_ImageName TEXT,
      $CatData_Image TEXT,
      $CatData_Remarks TEXT,
      $CatData_ScoreId TEXT,
      $CatData_Question TEXT,
      $CatData_QuestionId TEXT,
      $CatData_CategoryId TEXT,
      $CataData_SectorId TEXT,
      $CatData_AuditId TEXT,
      $CatData_LocationId TEXT,
      $CatData_CompanyId TEXT,  
      $CatData_SbuId TEXT,
      $CatData_Percentage TEXT)    
     ''');

    db.execute('''CREATE TABLE $_auditData(
      $AuditDataID INTEGER PRIMARY KEY,
      $AuditData_str_clientfeedback TEXT,
      $AuditData_str_additionalinformatin TEXT,
      $AuditData_clientsign TEXT,
      $AuditData_auditsign TEXT,
      $AuditData_auditdate TEXT,
      $AuditData_userid TEXT,
      $AuditData_guid TEXT,
      $AuditData_deviceid TEXT,
      $AuditData_uploadguid TEXT,
      $AuditData_uploadfilename TEXT,
      $AuditData_auditeename TEXT,
      $AuditData_auditorname TEXT,
      $AuditData_oamname TEXT,
      $AuditData_sbuname TEXT, 
      $AuditData_clientperson TEXT, 
      $AuditData_ssano TEXT, 
      $AuditData_sitename TEXT, 
      $AuditData_clientname TEXT, 
      $AuditData_xmldata TEXT, 
      $AuditData_categoryid TEXT, 
      $AuditData_auditid TEXT, 
      $AuditData_sectorid TEXT, 
      $AuditData_locationid TEXT, 
      $AuditData_companyid TEXT, 
      $AuditData_sbuid TEXT, 
      $AuditData_observation TEXT,
      $AuditData_isfeedback TEXT)    
     ''');

    db.execute('''CREATE TABLE $_feedbackImages(
      $FeedbackImageID INTEGER PRIMARY KEY,
      $FeedbackImage_deviceId TEXT,
      $FeedbackImage_imageGUID TEXT,
      $FeedbackImage_image TEXT,
      $FeedbackImage_categoryId TEXT,
      $FeedbackImage_auditId TEXT,
      $FeedbackImage_locationId TEXT,
      $FeedbackImage_companyId TEXT,
      $FeedbackImage_sbuId TEXT,
      $FeedbackImage_imageName TEXT)    
     ''');
  }

  //Insert the user table
  Future<int> userinsert(List<UserDetails>? userDetails) async {
    Database? db = await instance.database;
    userDetails?.forEach((element) async {
      await db?.insert(_userDetails, element.toJson());
    });
    return 1;
  }

  //Insert the SBU Table
  Future<int> sbuInsert(List<SBUTable>? sbuDetails) async {
    Database? db = await instance.database;
    sbuDetails?.forEach((element) async {
      await db?.insert(_sbuDetails, element.toJson());
    });
    return 1;
  }

  //Insert Company Table
  Future<int> companyInsert(List<CompanyTable>? compyDetails) async {
    Database db = await instance.database;
    compyDetails?.forEach((element) async {
      await db.insert(_companyDetails, element.toJson());
    });
    return 1;
  }

  //Insert Location Table
  Future<int> locationInsert(List<LocationTable>? locationDetails) async {
    Database? db = await instance.database;
    locationDetails?.forEach((element) async {
      await db?.insert(_locationDetails, element.toJson());
    });
    return 1;
  }

  //Insert Audit Table
  Future<int> auditInsert(List<AuditTable>? auditDetails) async {
    Database? db = await instance.database;
    auditDetails?.forEach((element) async {
      await db?.insert(_auditDetails, element.toJson());
    });
    return 1;
  }

  //Insert Category Table
  Future<int> categoryInsert(List<CategoryTable>? categoryDetails) async {
    Database? db = await instance.database;
    categoryDetails?.forEach((element) async {
      await db?.insert(_categoryDetails, element.toJson());
    });
    return 1;
  }

  //Insert Question Table
  Future<int> questionInsert(List<QuestionTable>? questionDetails) async {
    Database? db = await instance.database;
    questionDetails?.forEach((element) async {
      await db?.insert(_questionDetails, element.toJson());
    });
    return 1;
  }

  //Insert Answer Table
  Future<int> answerInsert(List<ScoreTable>? scoreDetails) async {
    Database? db = await instance.database;
    scoreDetails?.forEach((element) async {
      await db?.insert(_scoreDetails, element.toJson());
    });
    return 1;
  }

  //Insert CategoryData Table
  Future<int> categoryDataInsert(List<Categorydata> qnsDetails) async {
    Database? db = await instance.database;
    qnsDetails?.forEach((element) async {
      await db?.insert(_categoryData, element.toJson());
    });
    return 1;
  }

  //Insert AuditData Table
  Future<int> auditDataInsert(List<Auditdata> auditDetails) async {
    Database? db = await instance.database;
    auditDetails.forEach((element) async {
      await db.insert(_auditData, element.toJson());
    });
    return 1;
  }

  //Update CategoryData Table
  Future<int> categoryDataUpdate(List<Categorydata> qnsDetails) async {
    Database? db = await instance.database;
    qnsDetails.forEach((element) async {
      print(element.toJson());
      await db.update(_categoryData, element.toJson(),
          where: 'id = ?', whereArgs: [element.id]);
    });
    return 1;
  }

  //Feedback Images insert
  Future<int> feedbackImagesInsert(
      List<FeedbackImages> feedbackImagesList) async {
    Database? db = await instance.database;
    feedbackImagesList.forEach((element) async {
      print(element.toJson());
      await db.insert(
        _feedbackImages,
        element.toJson(),
      );
    });
    return 1;
  }

  //Update Category Details Percentage
  Future<int> categoryDetailsPercentageUpdate(
      String percentage, String categoryId) async {
    Database? db = await instance.database;
    await db.update(_categoryDetails, {Cat_Percentage: percentage},
        where: 'categoryid = ?', whereArgs: [categoryId]);
    return 1;
  }

  //Updated category Details percentage using auditID
  Future<int> cdPercentageUpdate_auditId(
      String percentage, String auditId) async {
    Database? db = await instance.database;
    await db.update(_categoryDetails, {Cat_Percentage: percentage},
        where: 'auditid = ?', whereArgs: [auditId]);
    return 1;
  }

  //Update Categorydata percentage
  Future<List<Map<String, Object?>>> updatePercentage(
      String categoryId, String percentage) async {
    Database? db = await instance.database;
    debugPrint("UPDATE $_categoryData SET $CatData_Percentage "
        "= $percentage Where $CatData_CategoryId = $categoryId");
    return await db.rawQuery("UPDATE $_categoryData SET $CatData_Percentage "
        "= $percentage Where $CatData_CategoryId = $categoryId");

    // return await db.update(_categoryData,percentage,where: 'categoryid = ?',whereArgs: categoryId);
  }

  //Get the sbuDetails
  Future<List<Map>> getSBU() async {
    Database? db = await instance.database;
    return await db.query(_sbuDetails);
  }

  //Get the companyDetails
  Future<List<Map>> getCompany() async {
    Database? db = await instance.database;
    return await db.query(_companyDetails);
  }

  //Get the companyDetails
  Future<List<Map>> getCompanyWithSbu(String sbuId) async {
    Database? db = await instance.database;
    return await db
        .query(_companyDetails,
        where: "$Sbu = ?",
        whereArgs: [sbuId]);
  }

  //Get the locationDetails
  Future<List<Map>> getLocation(String compId, String sbuId) async {
    Database? db = await instance.database;
    return await db.query(_locationDetails,
        where: "$CompanyID  =? and $Location_sbu =?",
        whereArgs: [compId, sbuId]);
  }

  //Get the feedbackDetails
  Future<List<Map>> getFeedback(String sectorId) async {
    Database? db = await instance.database;
    return await db.query(_auditDetails,
        where: "$Audit_SectorID  =?", whereArgs: [sectorId]);
  }

  //Get the categoryDetails
  Future<List<Map>> getCategory(String compId, String auditId) async {
    Database? db = await instance.database;
    return await db.query(_categoryDetails,
        where: "$Cat_Companyid  =? and $Cat_Auditid =?",
        whereArgs: [compId, auditId]);
  }

  //Get the questionDetails
  Future<List<Map>> getQuestion(String categoryId) async {
    Database? db = await instance.database;
    // return List.from( await db.query(_questionDetails,
    //     where: "$Ques_Categoryid  =?", whereArgs: [categoryId]));
    return List.from(await db.rawQuery(
        "Select * from $_questionDetails Where $Ques_Categoryid = $categoryId"));
  }

  //Get the answerDetails
  Future<List<Map>> getAnswer(String auditId) async {
    Database? db = await instance.database;
    return await db.query(_scoreDetails,
        where: "$Score_Scoreauditid  =?", whereArgs: [auditId]);
  }

  //Get the categoryData details
  Future<List<Map>> getCategoryDetails() async {
    Database? db = await instance.database;
    return await db.rawQuery("Select * from $_categoryData");
  }

  //Get the count of audit Data table
  Future<List<Map>> getAuditDataTableCount() async {
    Database? db = await instance.database;
    return await db.rawQuery("Select count(id) as count from $_auditData");
  }

  //Get the auditData table
  Future<List<Map>> getAuditData() async {
    Database? db = await instance.database;
    return await db.rawQuery("Select * from $_auditData");
  }

  //Get image from image table
  Future<List<Map>> getImageData() async {
    Database? db = await instance.database;
    return await db.rawQuery("Select * from $_feedbackImages");
  }

  //Get the categoryData details with parameters
  Future<List<Map>> getCategoryDetailsWithParameters(
      String sbuId,
      String compId,
      String locId,
      String auditId,
      String sectorId,
      String catId) async {
    Database? db = await instance.database;
    return await db.rawQuery("Select * from $_categoryData where "
        "$CatData_SbuId = $sbuId AND $CatData_CompanyId = $compId AND "
        "$CatData_LocationId = $locId AND $CatData_AuditId = $auditId AND "
        "$CataData_SectorId = $sectorId AND $CatData_CategoryId = $catId");
  }

  //Get the scoreCalcualtion
  Future<List<Map>> getScoreCalculation(
      String sbuId, String companyId, String locationId, String auditId) async {
    Database? db = await instance.database;
    var tex =
        "Select $Score_Scorescore,$CatData_Weightage from $_categoryData INNER JOIN $_scoreDetails"
        " on $_categoryData.$CatData_ScoreId = $_scoreDetails.$Score_Scorescore where $_scoreDetails.$Score_Scorescore != -1 AND $_categoryData.$CatData_SbuId  = $sbuId  AND"
        " $_categoryData.$CatData_CompanyId = $companyId AND $_categoryData.$CatData_LocationId = $locationId AND $_categoryData.$CatData_AuditId = $auditId";

    var tt =
        "Select $CatData_Weightage,$CatData_ScoreId from $_categoryData where $CatData_ScoreId != N/a AND  $CatData_SbuId  = $sbuId  AND $CatData_CompanyId = $companyId AND $CatData_LocationId = $locationId AND $CatData_AuditId = $auditId";
    print(tt);

    return await db.rawQuery(
        "Select $CatData_Weightage,$CatData_ScoreId from $_categoryData where $CatData_ScoreId != 'N/a' AND  $CatData_SbuId  = $sbuId  AND $CatData_CompanyId = $companyId AND $CatData_LocationId = $locationId AND $CatData_AuditId = $auditId");
  }

  //Get the category details individual category percentage
  Future<List<Map>> getCategoryDetailsPercentage(String sbuId, String compId,
      String locId, String auditId, String sectorId, String catId) async {
    Database? db = await instance.database;
    return await db
        .rawQuery("Select $CatData_Percentage from $_categoryData where "
            "$CatData_SbuId = $sbuId AND $CatData_CompanyId = $compId AND "
            "$CatData_LocationId = $locId AND $CatData_AuditId = $auditId AND "
            "$CataData_SectorId = $sectorId AND $CatData_CategoryId = $catId");
  }

  //Get the offline list from the audit data table
  Future<List<Map>> getOfflineData() async {
    Database? db = await instance.database;
    debugPrint(
        "Select CompanyName, LocationName, auditname,auditData.auditid  from auditData left join companyDetails  on companyDetails.CompanyID = auditData.companyid  left join auditDetails on auditDetails.auditid = auditData.auditid   left join locationDetails on locationDetails.LocationID= auditData.locationid group by auditData.auditid");
    // return await db.rawQuery(
    //     "Select CompanyName, LocationName, auditname,auditData.auditid  from auditData left join companyDetails  on companyDetails.CompanyID = auditData.companyid  left join auditDetails on auditDetails.auditid = auditData.auditid   left join locationDetails on locationDetails.LocationID= auditData.locationid group by auditData.auditid");

    return await db.rawQuery(
        "Select CompanyName, LocationName, auditname,auditData.auditid,(select count(id) from feedbackImages where auditid = auditid)  as count  from auditData left join companyDetails  on companyDetails.CompanyID = auditData.companyid  left join auditDetails on auditDetails.auditid = auditData.auditid   left join locationDetails on locationDetails.LocationID= auditData.locationid group by auditData.auditid");
  }

  //Insert the user table
  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db.insert(_userDetails, row);
  }

  //Select all the data from the userTable
  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_userDetails);
  }

  //Delete the data from the user table
  Future<int> delete(int userName) async {
    Database db = await instance.database;
    return await db
        .delete(_userDetails, where: '$userName = ?', whereArgs: [userName]);
  }

  //Delete sbuDetails data in table
  Future<int> sbuDelete() async {
    Database db = await instance.database;
    return await db.delete(_sbuDetails);
  }

  //Delete companyDetails data in table
  Future<int> companyDelete() async {
    Database db = await instance.database;
    return await db.delete(_companyDetails);
  }

  //Delete locationDetails data in table
  Future<int> locationDelete() async {
    Database db = await instance.database;
    return await db.delete(_locationDetails);
  }

  //Delete auditDetails data in table
  Future<int> auditDelete() async {
    Database db = await instance.database;
    return await db.delete(_auditDetails);
  }

  //Delete categoryDetails data in table
  Future<int> categoryDelete() async {
    Database db = await instance.database;
    return await db.delete(_categoryDetails);
  }

  //Delete questionDetails data in table
  Future<int> questionDelete() async {
    Database db = await instance.database;
    return await db.delete(_questionDetails);
  }

  //Delete scoreDetails data in table
  Future<int> scoreDelete() async {
    Database db = await instance.database;
    return await db.delete(_scoreDetails);
  }

  //Delete category Data after give submit in submit page
  Future<List<Map<String, Object?>>> catDataDelete(String sbuId, String compId,
      String locId, String auditId, String sectorId, String catId) async {
    Database db = await instance.database;
    return await db.rawQuery(
        "Delete from $_categoryData where $CatData_SbuId =$sbuId AND $CatData_CompanyId= $compId AND $CatData_LocationId= $locId AND $CatData_AuditId = $auditId");
  }

  //Delete FeedbackImages data using imageGUID
  Future<int> imageDelete(String? guid) async {
    Database db = await instance.database;
    return await db.delete(_feedbackImages,
        where: '$FeedbackImage_imageGUID = ?', whereArgs: [guid]);
  }

  //Delete Feedback data after push to server using guid
  Future<int> feedbackDelete(String guid) async {
    Database db = await instance.database;
    return await db
        .delete(_auditData, where: '$AuditData_guid = ?', whereArgs: [guid]);
  }
}

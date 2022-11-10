class Categorydata {
  Categorydata({
      this.id, 
      this.categorydone, 
      this.weightage, 
      this.uploadfilename, 
      this.imagename, 
      this.image, 
      this.remarks, 
      this.scoreid, 
      this.question, 
      this.questionid, 
      this.categoryid, 
      this.sectorid, 
      this.auditid, 
      this.locationid, 
      this.companyid, 
      this.sbuid, 
      this.percentage,});

  Categorydata.fromJson(dynamic json) {
    id = json['id'];
    categorydone = json['categorydone'];
    weightage = json['weightage'];
    uploadfilename = json['uploadfilename'];
    imagename = json['imagename'];
    image = json['image'];
    remarks = json['remarks'];
    scoreid = json['scoreid'];
    question = json['question'];
    questionid = json['questionid'];
    categoryid = json['categoryid'];
    sectorid = json['sectorid'];
    auditid = json['auditid'];
    locationid = json['locationid'];
    companyid = json['companyid'];
    sbuid = json['sbuid'];
    percentage = json['Percentage'];
  }
  num? id;
  String? categorydone;
  String? weightage;
  String? uploadfilename;
  String? imagename;
  String? image;
  String? remarks;
  String? scoreid;
  String? question;
  String? questionid;
  String? categoryid;
  String? sectorid;
  String? auditid;
  String? locationid;
  String? companyid;
  String? sbuid;
  String? percentage;
Categorydata copyWith({  num? id,
  String? categorydone,
  String? weightage,
  String? uploadfilename,
  String? imagename,
  String? image,
  String? remarks,
  String? scoreid,
  String? question,
  String? questionid,
  String? categoryid,
  String? sectorid,
  String? auditid,
  String? locationid,
  String? companyid,
  String? sbuid,
  String? percentage,
}) => Categorydata(  id: id ?? this.id,
  categorydone: categorydone ?? this.categorydone,
  weightage: weightage ?? this.weightage,
  uploadfilename: uploadfilename ?? this.uploadfilename,
  imagename: imagename ?? this.imagename,
  image: image ?? this.image,
  remarks: remarks ?? this.remarks,
  scoreid: scoreid ?? this.scoreid,
  question: question ?? this.question,
  questionid: questionid ?? this.questionid,
  categoryid: categoryid ?? this.categoryid,
  sectorid: sectorid ?? this.sectorid,
  auditid: auditid ?? this.auditid,
  locationid: locationid ?? this.locationid,
  companyid: companyid ?? this.companyid,
  sbuid: sbuid ?? this.sbuid,
  percentage: percentage ?? this.percentage,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['categorydone'] = categorydone;
    map['weightage'] = weightage;
    map['uploadfilename'] = uploadfilename;
    map['imagename'] = imagename;
    map['image'] = image;
    map['remarks'] = remarks;
    map['scoreid'] = scoreid;
    map['question'] = question;
    map['questionid'] = questionid;
    map['categoryid'] = categoryid;
    map['sectorid'] = sectorid;
    map['auditid'] = auditid;
    map['locationid'] = locationid;
    map['companyid'] = companyid;
    map['sbuid'] = sbuid;
    map['Percentage'] = percentage;
    return map;
  }

}
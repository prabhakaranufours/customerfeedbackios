import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:customerfeedbackios/database/database_helper.dart';
import 'package:customerfeedbackios/helpers/utils.dart';
import 'package:flutter/material.dart';

import '../helpers/colors.dart';
import '../helpers/shared_preferences_helper.dart';
import '../widgets/app_bar.dart';
import '../widgets/button.dart';
import '../widgets/textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map> sbuDetails = [];
  List<Map> companyDetails = [];
  List<Map> locationDetails = [];
  List<Map> feedbackDetails = [];

  String sbuText = "Select SBU";
  String companyText = "Select Company";
  String locationText = "Select Location";
  String feedbackText = "Select Feedback";
  String sectorText = "";

  String companyId = "";
  String sbuId = "";
  String locationId = "";
  String feedbackId = "";

  TextEditingController searchController = TextEditingController();
  var sbuTextController = TextEditingController();

  Timer? timer;
  int count = 0;




  //After click the list item in sbu then set the value in text
  void setSbuData(String value, String id) {
    setState(() {
      sbuText = value;
      sbuId = id;
      SharedPreferencesHelper.setPrefString(
          SharedPreferencesHelper.SBU_ID, sbuId);
      SharedPreferencesHelper.setPrefString(
          SharedPreferencesHelper.SBU_NAME, sbuText);

      companyText="Select Company";
      companyId='';
      locationText="Select Location";
      locationId='';
      feedbackText="Select Feedback";
      feedbackId='';
    });
  }

  void setCompanyData(String value, String id) {
    setState(() {
      companyText = value;
      companyId = id;
      //Store the companyId in sharedPreference
      SharedPreferencesHelper.setPrefString(
          SharedPreferencesHelper.COMPANY_ID, companyId);
      SharedPreferencesHelper.setPrefString(
          SharedPreferencesHelper.COMPANY_NAME, companyText);

      locationText="Select Location";
      locationId='';
      feedbackText="Select Feedback";
      feedbackId='';

    });
  }

  void setLocationData(String value, String id) {
    setState(() {
      locationText = value;
      locationId = id;
      //Store the locationId in sharedPreference
      SharedPreferencesHelper.setPrefString(
          SharedPreferencesHelper.LOCATION_ID, locationId);

      feedbackText="Select Feedback";
      feedbackId='';
    });
  }

  void setFeedbackData(String value, String id) {
    setState(() {
      feedbackText = value;
      feedbackId = id;
      SharedPreferencesHelper.setPrefString(
          SharedPreferencesHelper.FEEDBACK_ID, feedbackId);
    });
  }

  //SBU
  Future<void> _showSBU(BuildContext context) async {
    return showDialog<void>(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          child: CustomTextField(
                            placeholder: "Search",
                            onSubmitted: (_) =>
                                FocusScope.of(context).unfocus(),
                            onChanged: (val) async {
                              if (val == "") {
                                sbuDetails =
                                    await DatabaseHelper.instance.getSBU();
                              } else {
                                sbuDetails.forEach((element) {
                                  element['locationsettingsname'];
                                });
                              }
                              setState(() {});
                            },
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/search-8.png',
                                height: 15,
                                width: 15,
                              ),
                            ),
                            controller: searchController,
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: sbuDetails.length,
                            itemBuilder: (context, index) => ListTile(
                              onTap: () {
                                setSbuData(
                                  sbuDetails[index]["locationsettingsname"],
                                  sbuDetails[index]["locationsettingsid"],
                                );

                                Navigator.of(context).pop();
                                // _getLocation();
                              },
                              title: Text(
                                '${sbuDetails[index]["locationsettingsname"]}',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

  //Company
  Future<void> _showCompany(BuildContext context) async {
    return showDialog<void>(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          child: CustomTextField(
                            placeholder: "Search",
                            onSubmitted: (_) =>
                                FocusScope.of(context).unfocus(),
                            onChanged: (val) async {
                              if (val == "") {
                                companyDetails =
                                    await DatabaseHelper.instance.getCompany();
                              } else {
                                companyDetails.forEach((element) {
                                  element['CompanyName'];
                                });
                              }
                              setState(() {});
                            },
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/search-8.png',
                                height: 15,
                                width: 15,
                              ),
                            ),
                            controller: searchController,
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: companyDetails.length,
                            itemBuilder: (context, index) => ListTile(
                              onTap: () {
                                debugPrint('setstate');
                                // locationText="Select Location";
                                setCompanyData(
                                    companyDetails[index]["CompanyName"],
                                    companyDetails[index]["CompanyID"]);
                                _getLocation(
                                    companyDetails[index]["CompanyID"]);

                                Navigator.of(context).pop();
                              },
                              title: Text(
                                '${companyDetails[index]["CompanyName"]}',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

  //Location
  Future<void> _showLocation(BuildContext context) async {
    return showDialog<void>(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
                      children: [
                        Flexible(
                          child: CustomTextField(
                            placeholder: "Search",
                            onSubmitted: (_) =>
                                FocusScope.of(context).unfocus(),
                            onChanged: (val) async {
                              if (val == null || val == "") {
                                locationDetails = await DatabaseHelper.instance
                                    .getLocation(companyId, sbuId);
                              } else {
                                locationDetails.forEach((element) {
                                  element['locationName'];
                                });
                              }
                              setState(() {});
                            },
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/search-8.png',
                                height: 15,
                                width: 15,
                              ),
                            ),
                            controller: searchController,
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: locationDetails.length,
                            itemBuilder: (context, index) => ListTile(
                              onTap: () {
                                setLocationData(
                                    locationDetails[index]["LocationName"],
                                    locationDetails[index]["LocationID"]);

                                _getFeedback(
                                    locationDetails[index]["sectorid"]);
                                //SectorId store in sharedPreference
                                SharedPreferencesHelper.setPrefString(SharedPreferencesHelper.SECTOR_ID,
                                    locationDetails[index]["sectorid"] );

                                Navigator.of(context).pop();
                                // _getLocation();
                              },
                              title: Text(
                                '${locationDetails[index]["LocationName"]}',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

  //Feedback
  Future<void> _showFeedback(BuildContext context) async {
    return showDialog<void>(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
                      children: [
                        Flexible(
                          child: CustomTextField(
                            placeholder: "Search",
                            onSubmitted: (_) =>
                                FocusScope.of(context).unfocus(),
                            onChanged: (val) async {
                              if (val == null || val == "") {
                                feedbackDetails = await DatabaseHelper.instance
                                    .getFeedback(companyId);
                              } else {
                                feedbackDetails.forEach((element) {
                                  element['auditname'];
                                });
                              }
                              setState(() {});
                            },
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/search-8.png',
                                height: 15,
                                width: 15,
                              ),
                            ),
                            controller: searchController,
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: feedbackDetails.length,
                            itemBuilder: (context, index) => ListTile(
                              onTap: () {
                                setFeedbackData(
                                    feedbackDetails[index]["auditname"],
                                    feedbackDetails[index]["auditid"]);

                                Navigator.of(context).pop();
                              },
                              title: Text(
                                '${feedbackDetails[index]["auditname"]}',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkCount();
  }

  //Timer used for count show
  void  checkCount() {
    timer= Timer.periodic(Duration(seconds: 10), (t) async{
      count = (await DatabaseHelper.instance.getAuditDataTableCount())[0]["count"] ?? 0;
      setState(() {});
      if(count == 0){
        timer?.cancel();
      }
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }


  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    sbuDetails = await DatabaseHelper.instance.getSBU();
    companyDetails = await DatabaseHelper.instance.getCompany();
  }

  //Get location
  void _getLocation(String compId) async {
    debugPrint('GetLocation');
    locationDetails = await DatabaseHelper.instance.getLocation(compId, sbuId);
    setState(() {});
  }

  //get Feedback
  void _getFeedback(String sectorId) async {
    debugPrint('GetFeedback');
    feedbackDetails = await DatabaseHelper.instance.getFeedback(sectorId);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Utils.showExitDialog(context);
        return true;
      },
      child: Scaffold(
        appBar: customAppBar(
          context,
          title: Text(
            'HOME',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: primaryDark,
          actions: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/offline');
              },
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Image.asset(
                      'assets/images/cloud-computing.png',
                      height: 25,
                      width: 25,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Text('$count', style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 12,)
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 7,
                      foregroundColor:
                          Colors.black, // foreground (text) color
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$sbuText',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                        ),
                        // SizedBox(width: 10),
                        Image.asset(
                          'assets/images/downarrow.png',
                          height: 10,
                          width: 10,
                        ),
                      ],
                    ),
                    onPressed: () {
                      _showSBU(context);
                    },
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 7,
                      foregroundColor:
                          Colors.black, // foreground (text) color
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$companyText',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                        ),
                        // SizedBox(width: 10),
                        Image.asset(
                          'assets/images/downarrow.png',
                          height: 10,
                          width: 10,
                        ),
                      ],
                    ),
                    onPressed: () {
                      _showCompany(context);
                    },
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 7,
                      foregroundColor:
                          Colors.black, // foreground (text) color
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$locationText',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                        ),
                        // SizedBox(width: 10),
                        Image.asset(
                          'assets/images/downarrow.png',
                          height: 10,
                          width: 10,
                        ),
                      ],
                    ),
                    onPressed: () {
                      _showLocation(context);
                    },
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 7,
                      foregroundColor:
                          Colors.black, // foreground (text) color
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$feedbackText',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                        ),
                        // SizedBox(width: 10),
                        Image.asset(
                          'assets/images/downarrow.png',
                          height: 10,
                          width: 10,
                        ),
                      ],
                    ),
                    onPressed: () {
                      _showFeedback(context);
                    },
                  ),
                ),
                SizedBox(height: 30),
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   child: Text('Sector',
                //       style: TextStyle(fontSize: 15.0),
                //       textAlign: TextAlign.left),
                // ),
                // SizedBox(height: 30),
                CustomButton(
                  buttonText: 'Feedback',
                  onPressed: () => {
                    if (sbuId != "" &&
                        companyId != "" &&
                        locationId != "" &&
                        feedbackId != "")
                      {
                        Navigator.pushNamed(context, '/category', arguments: {
                          "companyId": companyId,
                          "feedbackId": feedbackId
                        }),
                      }
                    else
                      // {_showMessage(context, "Please select all items")}
                    {
                      Utils.showMessage(context, "Please select all items")
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

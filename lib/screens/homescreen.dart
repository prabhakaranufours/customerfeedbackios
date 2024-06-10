import 'dart:async';
import 'dart:convert';

import 'package:customerfeedbackios/database/database_helper.dart';
import 'package:customerfeedbackios/helpers/utils.dart';
import 'package:customerfeedbackios/screens/loginscreen.dart';
import 'package:customerfeedbackios/utils/sync_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upgrader/upgrader.dart';

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

  List<Map> filterSbuDetails = [];
  List<Map> filterCompanyDetails = [];
  List<Map> filterLocationDetails = [];
  List<Map> filterFeedbackDetails = [];

  String sbuText = "Select SBU";
  String companyText = "Select Company";
  String locationText = "Select Location";
  String feedbackText = "Select Feedback";
  String sectorText = "";

  String companyId = "";
  String sbuId = "";
  String locationId = "";
  String feedbackId = "";
  String userName = "";
  String compLogo = "";

  TextEditingController searchController = TextEditingController();
  var sbuTextController = TextEditingController();

  Timer? timer;
  int count = 0;

  //Sbu Filter
  void _filterItems(String query) {
    setState(() {
      if (query != "") {
        filterSbuDetails = sbuDetails
            .where((item) => item['locationsettingsname']
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  //Company Filter
  void _filterCompItems(String query) {
    setState(() {
      if (query != "") {
        filterCompanyDetails = companyDetails
            .where((item) =>
                item['CompanyName'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  //Location Filter
  void _filterLocationItems(String query) {
    setState(() {
      if (query != "") {
        filterLocationDetails = locationDetails
            .where((item) => item['locationName']
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  //Feedback Filter
  void _filterFeedbackItems(String query) {
    setState(() {
      if (query != "") {
        filterFeedbackDetails = feedbackDetails
            .where((item) =>
                item['auditname'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  //After click the list item in sbu then set the value in text
  void setSbuData(String value, String id) {
    setState(() {
      sbuText = value;
      sbuId = id;
      SharedPreferencesHelper.setPrefString(
          SharedPreferencesHelper.SBU_ID, sbuId);
      SharedPreferencesHelper.setPrefString(
          SharedPreferencesHelper.SBU_NAME, sbuText);

      companyText = "Select Company";
      companyId = '';
      locationText = "Select Location";
      locationId = '';
      feedbackText = "Select Feedback";
      feedbackId = '';
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

      locationText = "Select Location";
      locationId = '';
      feedbackText = "Select Feedback";
      feedbackId = '';
    });
  }

  void setLocationData(String value, String id) {
    setState(() {
      locationText = value;
      locationId = id;
      //Store the locationId in sharedPreference
      SharedPreferencesHelper.setPrefString(
          SharedPreferencesHelper.LOCATION_ID, locationId);
      SharedPreferencesHelper.setPrefString(
          SharedPreferencesHelper.LOCATION_NAME, locationText);

      feedbackText = "Select Feedback";
      feedbackId = '';
    });
  }

  void setFeedbackData(String value, String id) {
    setState(() {
      feedbackText = value;
      feedbackId = id;
      SharedPreferencesHelper.setPrefString(
          SharedPreferencesHelper.FEEDBACK_ID, feedbackId);
      SharedPreferencesHelper.setPrefString(
          SharedPreferencesHelper.FEEDBACK_NAME, feedbackText);
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
                  child: SizedBox(
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
                                // sbuDetails = await DatabaseHelper.instance.getSBU();
                                filterSbuDetails =
                                    await DatabaseHelper.instance.getSBU();
                              } else {
                                _filterItems(val);
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
                            // itemCount: sbuDetails.length,
                            itemCount: filterSbuDetails.length,
                            itemBuilder: (context, index) => ListTile(
                              onTap: () {
                                setSbuData(
                                  // sbuDetails[index]["locationsettingsname"],
                                  // sbuDetails[index]["locationsettingsid"],

                                  filterSbuDetails[index]
                                      ["locationsettingsname"],
                                  filterSbuDetails[index]["locationsettingsid"],
                                );
                                // _getCompany(sbuDetails[index]["locationsettingsid"]);
                                _getCompany(filterSbuDetails[index]
                                    ["locationsettingsid"]);

                                Navigator.of(context).pop();
                                // _getLocation();
                              },
                              title: Text(
                                // '${sbuDetails[index]["locationsettingsname"]}',
                                '${filterSbuDetails[index]["locationsettingsname"]}',
                                style: Theme.of(context).textTheme.bodyMedium,
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
                  child: SizedBox(
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
                                // companyDetails =
                                //     // await DatabaseHelper.instance.getCompany();
                                //     await DatabaseHelper.instance
                                //         .getCompanyWithSbu(sbuId);

                                filterCompanyDetails = await DatabaseHelper
                                    .instance
                                    .getCompanyWithSbu(sbuId);
                              } else {
                                // companyDetails.forEach((element) {
                                //   element['CompanyName'];
                                // });

                                _filterCompItems(val);
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
                            // itemCount: companyDetails.length,
                            itemCount: filterCompanyDetails.length,
                            itemBuilder: (context, index) => ListTile(
                              // onTap: () {
                              //   debugPrint('setstate');
                              //   // locationText="Select Location";
                              //   setCompanyData(
                              //       companyDetails[index]["CompanyName"],
                              //       companyDetails[index]["CompanyID"]);
                              //   _getLocation(
                              //       companyDetails[index]["CompanyID"]);
                              //
                              //   Navigator.of(context).pop();
                              // },
                              onTap: () {
                                debugPrint('setstate');
                                // locationText="Select Location";
                                setCompanyData(
                                    filterCompanyDetails[index]["CompanyName"],
                                    filterCompanyDetails[index]["CompanyID"]);
                                _getLocation(
                                    filterCompanyDetails[index]["CompanyID"]);

                                Navigator.of(context).pop();
                              },
                              title: Text(
                                '${filterCompanyDetails[index]["CompanyName"]}',
                                style: Theme.of(context).textTheme.bodyMedium,
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
                  child: SizedBox(
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
                                // locationDetails = await DatabaseHelper.instance
                                //     .getLocation(companyId, sbuId);

                                filterLocationDetails = await DatabaseHelper
                                    .instance
                                    .getLocation(companyId, sbuId);
                              } else {
                                // locationDetails.forEach((element) {
                                //   element['locationName'];
                                // });

                                _filterLocationItems(val);
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
                              // onTap: () {
                              //   setLocationData(
                              //       locationDetails[index]["LocationName"],
                              //       locationDetails[index]["LocationID"]);
                              //
                              //   _getFeedback(
                              //       locationDetails[index]["sectorid"]);
                              //   //SectorId store in sharedPreference
                              //   SharedPreferencesHelper.setPrefString(
                              //       SharedPreferencesHelper.SECTOR_ID,
                              //       locationDetails[index]["sectorid"]);
                              //
                              //   Navigator.of(context).pop();
                              //   // _getLocation();
                              // },
                              onTap: () {
                                setLocationData(
                                    filterLocationDetails[index]
                                        ["LocationName"],
                                    filterLocationDetails[index]["LocationID"]);

                                _getFeedback(
                                    filterLocationDetails[index]["sectorid"]);
                                //SectorId store in sharedPreference
                                SharedPreferencesHelper.setPrefString(
                                    SharedPreferencesHelper.SECTOR_ID,
                                    filterLocationDetails[index]["sectorid"]);

                                Navigator.of(context).pop();
                                // _getLocation();
                              },
                              title: Text(
                                '${filterLocationDetails[index]["LocationName"]}',
                                style: Theme.of(context).textTheme.bodyMedium,
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
                  child: SizedBox(
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
                                // feedbackDetails = await DatabaseHelper.instance
                                //     .getFeedback(companyId);
                                filterFeedbackDetails = await DatabaseHelper
                                    .instance
                                    .getFeedback(companyId);
                              } else {
                                // feedbackDetails.forEach((element) {
                                //   element['auditname'];
                                // });
                                _filterFeedbackItems(val);
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
                              // onTap: () {
                              //   setFeedbackData(
                              //       feedbackDetails[index]["auditname"],
                              //       feedbackDetails[index]["auditid"]);
                              //
                              //   Navigator.of(context).pop();
                              // },
                              onTap: () {
                                setFeedbackData(
                                    filterFeedbackDetails[index]["auditname"],
                                    filterFeedbackDetails[index]["auditid"]);

                                Navigator.of(context).pop();
                              },
                              title: Text(
                                '${filterFeedbackDetails[index]["auditname"]}',
                                style: Theme.of(context).textTheme.bodyMedium,
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
    setCount();
    get();

    pushOfflineData();
  }

  void get() async {
    userName = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.USER_NAME, '');
    compLogo = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.COMPANY_LOGO, '');
  }

  //Timer used for count show
  void checkCount() {
    timer = Timer.periodic(const Duration(seconds: 10), (t) async {
      setCount();
    });
  }

  //This for timer
  setCount() async {
    count = (await DatabaseHelper.instance.getAuditDataTableCount())[0]
            ["count"] ??
        0;
    setState(() {});
    if (count == 0) {
      timer?.cancel();
    }
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
    filterSbuDetails.clear();
    filterSbuDetails.addAll(sbuDetails);
    // companyDetails = await DatabaseHelper.instance.getCompany();
    // companyDetails = await DatabaseHelper.instance.getCompanyWithSbu(sbuId);
  }

  //Get Company
  void _getCompany(String sbuId) async {
    debugPrint('GetCompany');
    // companyDetails = await DatabaseHelper.instance.getCompanyWithSbu(sbuId);

    companyDetails = await DatabaseHelper.instance.getCompanyWithSbu(sbuId);
    filterCompanyDetails.clear();
    filterCompanyDetails.addAll(companyDetails);
    setState(() {});
  }

  //Get location
  void _getLocation(String compId) async {
    debugPrint('GetLocation');
    locationDetails = await DatabaseHelper.instance.getLocation(compId, sbuId);
    filterLocationDetails.clear();
    filterLocationDetails.addAll(locationDetails);
    setState(() {});
  }

  //get Feedback
  void _getFeedback(String sectorId) async {
    debugPrint('GetFeedback');
    feedbackDetails = await DatabaseHelper.instance.getFeedback(sectorId);
    filterFeedbackDetails.clear();
    filterFeedbackDetails.addAll(feedbackDetails);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Utils.showExitDialog(context, 'Do you want to exit from the app',
            () => SystemNavigator.pop(animated: true));
        return true;
      },
      child: UpgradeAlert(
        child: Scaffold(
          appBar: customAppBar(
            context,
            leading: Image.network(compLogo),
            title: const Text(
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
                      padding: const EdgeInsets.all(12.0),
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
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '$count',
                          style: const TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              InkWell(
                  onTap: () async {
                    await Utils.showExitDialog(
                        context, 'Do you want to logout from the app', () {
                      SharedPreferencesHelper.setPrefBool(
                          SharedPreferencesHelper.IS_LOGIN, false);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (Route<dynamic> route) => false);
                    });

                    // await SharedPreferencesHelper.setPrefBool(
                    //     SharedPreferencesHelper.IS_LOGIN, false);
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => LoginScreen()),
                    //     (Route<dynamic> route) => false);
                  },
                  child: const Icon(Icons.logout)),
              const SizedBox(
                width: 12,
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Utils.subHeader(context, userName, ''),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
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
                                sbuText,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
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
                            searchController.clear();
                            _showSBU(context);
                          },
                        ),
                      ),

                      const SizedBox(height: 30),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
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
                                companyText,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
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
                            _getCompany(sbuId);
                            searchController.clear();
                            _showCompany(context);
                          },
                        ),
                      ),

                      const SizedBox(height: 30),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
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
                                locationText,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
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
                            _getLocation(companyId);
                            searchController.clear();
                            _showLocation(context);
                          },
                        ),
                      ),

                      const SizedBox(height: 30),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
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
                              Flexible(
                                child: Text(
                                  feedbackText,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: false,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                      ),
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
                            searchController.clear();
                            _showFeedback(context);
                          },
                        ),
                      ),

                      const SizedBox(height: 30),

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
                              Navigator.pushNamed(context, '/category',
                                  arguments: {
                                    "companyId": companyId,
                                    "feedbackId": feedbackId
                                  }),
                            }
                          else
                            // {_showMessage(context, "Please select all items")}
                            {
                              Utils.showMessage(
                                  context, "Please select all items")
                            }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//Push offline data from audit data table
  void pushOfflineData() {
    SyncData(() {}, (val) {}).execute();
  }
}

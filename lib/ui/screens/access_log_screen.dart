import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:smart_gate/generated/keys.g.dart';
import 'package:smart_gate/models/access_log_info.dart';
import 'package:smart_gate/network/http_helper.dart';
import 'package:smart_gate/ui/components/access_log_components/access_log_item.dart';
import 'package:smart_gate/ui/components/access_log_components/date_picker.dart';
import 'package:smart_gate/ui/components/access_log_components/search_text_field.dart';
import 'package:smart_gate/ui/components/general/translation_button.dart';
import 'package:smart_gate/ui/screens/loading_screen.dart';
import 'package:smart_gate/utility/presistant_storage.dart';
// Testing
// AccessLogInfo(
// timeStamp: '2023-03-21',
// clock: '09:52:56',
// employeeName: 'Dr.Anis',
// numLetters: '112233AR',
// confidenceLicense: '1.00',
// confidenceModel: '1.00',
// entryType: 'Entry',
// parkingName: 'Building104',
// licensePlateImage:
// '/media/images/plates/9bddc103-c0d0-4344-82e5-a18183c0c636.jpg',
// vehicleImage:
// '/media/images/vehicles/9bddc103-c0d0-4344-82e5-a18183c0c636.jpg',
// authType: 'TRUE')

class AccessLogScreen extends StatefulWidget {
  static const id = '/accessLog';
  var startDate;
  var endDate;
  late Iterable<Widget> listOfLogItems;
  bool isLoading = true;
  late List<AccessLogInfo> accessLogInfo;
  int currentPage = 1;
  @override
  State<AccessLogScreen> createState() => _AccessLogScreenState();
}

class _AccessLogScreenState extends State<AccessLogScreen> {
  // remove
// phase 1
  List<AccessLogInfo> createListOfLogInfo(var records) {
    List<AccessLogInfo> accessLogItems = [];
    for (var record in records) {
      AccessLogInfo newAccessLogInfoRecord = AccessLogInfo.fromJson(record);
      accessLogItems.add(newAccessLogInfoRecord);
    }
    return accessLogItems;
  }

  //phase 2
  Iterable<Widget> createListOfLogItems(var records) {
    List<AccessLogItem> accessLogItems = [];
    for (var record in records) {
      accessLogItems.add(AccessLogItem(record));
    }
    return accessLogItems;
  }

// phase Three
  void getInfo() async {
    var respons = await HttpHelper.getAccessLogInfo(widget.currentPage);

    var jsonResponse = await jsonDecode(respons.body);
    //phase 1: creating a list of logInfo elements
    widget.accessLogInfo = createListOfLogInfo(jsonResponse);
    //phase 2: putting the logInfo elements into indidual widgets AccessLogItems
    widget.listOfLogItems = createListOfLogItems(widget.accessLogInfo);
    var currentLanguage = await PresistentStorage().getCurrentLanguage();
    if (currentLanguage != null)
      EasyLocalization.of(context)?.setLocale(Locale(currentLanguage));
    setState(() {
      widget.isLoading = false;
    });
  }
// --------------------------------------------- filtering --------------------------------

// setting starting date to show records after it
  void setStartDate(DateTime startDate) {
    // 1: getting the starting date from datapicker widget
    widget.startDate = startDate;
    //2: filtering list of record, so only record with date after start date appear
    var updatedList;
    if (widget.endDate != null) {
      updatedList = widget.accessLogInfo.where((accessLogInfo) =>
          widget.endDate.isAfter(DateTime.parse(
              accessLogInfo.timeStamp + ' ' + accessLogInfo.clock)) &&
          widget.startDate.isBefore(DateTime.parse(
              accessLogInfo.timeStamp + ' ' + accessLogInfo.clock)));
    } else {
      updatedList = widget.accessLogInfo.where((accessLogInfo) =>
          startDate.isBefore(DateTime.parse(
              accessLogInfo.timeStamp + ' ' + accessLogInfo.clock)));
    }

    //3: setting the state to reflect updates
    setState(() {
      widget.listOfLogItems = createListOfLogItems(updatedList);
    });
  }

  // setting finishing date to show records before it
  void setFinishDate(DateTime endDate) {
    // 1: getting the end date from datapicker widget
    widget.endDate = endDate;
    //2: filtering list of record, so only record with date before end date appear
    var updatedList;
    if (widget.startDate != null) {
      updatedList = widget.accessLogInfo.where((accessLogInfo) =>
          endDate.isAfter(DateTime.parse(
              accessLogInfo.timeStamp + ' ' + accessLogInfo.clock)) &&
          widget.startDate.isBefore(DateTime.parse(
              accessLogInfo.timeStamp + ' ' + accessLogInfo.clock)));
    } else {
      updatedList = widget.accessLogInfo.where((accessLogInfo) =>
          endDate.isAfter(DateTime.parse(
              accessLogInfo.timeStamp + ' ' + accessLogInfo.clock)));
    }
    //3: setting the state to reflect updates
    setState(() {
      widget.listOfLogItems = createListOfLogItems(updatedList);
    });
  }

  //Filtering based on parking
  void updateListOfLogs(currentValue) async {
    // phase 1: filter the listOfLogInfo
    var updatedList;
    // if both set
    if (widget.startDate != null && widget.endDate != null) {
      updatedList = widget.accessLogInfo.where((accessLogInfo) =>
          widget.endDate.isAfter(DateTime.parse(
                  accessLogInfo.timeStamp + ' ' + accessLogInfo.clock)) &&
              widget.startDate.isBefore(DateTime.parse(
                  accessLogInfo.timeStamp + ' ' + accessLogInfo.clock)) &&
              (accessLogInfo.parkingName
                  .toLowerCase()
                  .contains(currentValue.toString().toLowerCase())) ||
          accessLogInfo.numLetters
              .toLowerCase()
              .contains(currentValue.toString().toLowerCase()) ||
          accessLogInfo.employeeName
              .toLowerCase()
              .contains(currentValue.toString().toLowerCase()));
    } else if (widget.startDate != null) {
      updatedList = widget.accessLogInfo.where((accessLogInfo) =>
          widget.startDate.isBefore(DateTime.parse(
                  accessLogInfo.timeStamp + ' ' + accessLogInfo.clock)) &&
              (accessLogInfo.parkingName
                  .toLowerCase()
                  .contains(currentValue.toString().toLowerCase())) ||
          accessLogInfo.numLetters
              .toLowerCase()
              .contains(currentValue.toString().toLowerCase()) ||
          accessLogInfo.employeeName
              .toLowerCase()
              .contains(currentValue.toString().toLowerCase()));
    }

    // else if endset
    //else if start set
    // else none set

    if (widget.endDate != null) {
      updatedList = widget.accessLogInfo.where((accessLogInfo) =>
          widget.endDate.isAfter(DateTime.parse(
                  accessLogInfo.timeStamp + ' ' + accessLogInfo.clock)) &&
              widget.startDate.isBefore(DateTime.parse(
                  accessLogInfo.timeStamp + ' ' + accessLogInfo.clock)) &&
              (accessLogInfo.parkingName
                  .toLowerCase()
                  .contains(currentValue.toString().toLowerCase())) ||
          accessLogInfo.numLetters
              .toLowerCase()
              .contains(currentValue.toString().toLowerCase()) ||
          accessLogInfo.employeeName
              .toLowerCase()
              .contains(currentValue.toString().toLowerCase()));
    } else {
      updatedList = widget.accessLogInfo.where((accessLogInfo) =>
          (accessLogInfo.parkingName
              .toLowerCase()
              .contains(currentValue.toString().toLowerCase())) ||
          accessLogInfo.numLetters
              .toLowerCase()
              .contains(currentValue.toString().toLowerCase()) ||
          accessLogInfo.employeeName
              .toLowerCase()
              .contains(currentValue.toString().toLowerCase()));
    }

    // phase 2: build a new listOfLogItems
    // phase 3: setState to reflect the changes
    setState(() {
      widget.listOfLogItems = createListOfLogItems(updatedList);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  void translateToArabic() async {
    PresistentStorage().setCurrentLanguage(locale: 'ar');
  }

  void translateToEnglish() async {
    PresistentStorage().setCurrentLanguage(locale: 'en');
  }
  //--------------------------------- Auxiliaries ----------------

  @override
  Widget build(BuildContext context) {
    //remove
    // getInfo();
    // createListOfLogItems(widget.accessLogInfo);
    // widget.listOfLogItems = createListOfLogItems(widget.accessLogInfo);
    final RefreshController _refreshControler = RefreshController();
    return widget.isLoading
        ? LoadingScreen()
        : Scaffold(
            body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TranslationButton(
                    translateToArabic: translateToArabic,
                    translateToEnglish: translateToEnglish,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 3.5, right: 3.5, top: 10, bottom: 4),
                  child: SearchTextField(
                    label: 'yo search',
                    onChanged: updateListOfLogs,
                    // label: LocaleKeys.log_search_label.tr(),
                    // onChanged: updateListOfLogs,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3.5, right: 3.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DatePicker(
                          setDate: setStartDate,
                          text: widget.startDate != null
                              ? formatDate(
                                  widget.startDate, [yyyy, '-', mm, '-', dd])
                              : LocaleKeys.start_date.tr()),
                      SizedBox(
                        width: 4,
                      ),
                      DatePicker(
                        setDate: setFinishDate,
                        text: widget.endDate != null
                            ? formatDate(
                                widget.endDate, [yyyy, '-', mm, '-', dd])
                            : LocaleKeys.end_date.tr(),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SmartRefresher(
                    onRefresh: () async {
                      setState(() {
                        widget.isLoading = true;
                      });
                      getInfo();
                    },
                    controller: _refreshControler,
                    child: ListView(
                      shrinkWrap: true,
                      children: ListTile.divideTiles(
                              //          <-- ListTile.divideTiles
                              context: context,
                              tiles: widget.listOfLogItems)
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ));
  }
}

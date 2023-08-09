import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_gate/generated/keys.g.dart';
import 'package:smart_gate/models/access_log_info.dart';
import 'package:smart_gate/network/backend_config.dart';
import 'package:smart_gate/ui/components/access_log_components/item_details.dart';
import 'package:smart_gate/ui/screens/expanded_image_screen.dart';

class AccessLogItem extends StatelessWidget {
  Widget authorizationState(String state) {
    if (state.contains('TRUE')) {
      return Icon(
        Icons.fiber_manual_record,
        color: Colors.greenAccent,
        size: 12,
      );
    }
    return Icon(
      Icons.fiber_manual_record,
      color: Colors.redAccent,
      size: 12,
    );
  }

  late AccessLogInfo accessLogInfo;
  AccessLogItem(this.accessLogInfo);
  Widget action = TextButton(onPressed: () {}, child: Icon(Icons.delete));
  // ------------------------------------- helper functions ---------------------

  String separatedLicense(String licensePlate) {
    // Splitting the string into letters and numbers
    List<String> letters = licensePlate.split(RegExp(r'\d+'));
    List<String> numbers = licensePlate.split(RegExp(r'[A-Za-z]+'));

    // putting the list into two strings
    String lettersString = letters[1];
    String numsString = numbers[0];
    return lettersString + ' | ' + numsString;
  }

  String truncateString(String str, width) {
    int maxLength = width > 500 ? 22 : 9;
    if (str.length <= maxLength) {
      return str;
    } else {
      return str.substring(0, maxLength) + '...';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    var currentLocal = context.locale;
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(Icons.delete, color: Colors.white),
            SizedBox(width: 20),
          ],
        ),
      ),
      confirmDismiss: (DismissDirection direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: AlertDialog(
                title: Text(LocaleKeys.delete_warning_title.tr()),
                content: Text(
                    "${LocaleKeys.delete_warning_comment_beginning.tr()} (${separatedLicense(accessLogInfo.numLetters)}) ${LocaleKeys.delete_warning_comment_end.tr()}"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(LocaleKeys.delete_warning_deleteCancel.tr()),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(
                      LocaleKeys.delete_warning_deleteButton.tr(),
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      onDismissed: (direction) {
        // Handle the dismiss action here
      },
      child: ExpansionTile(
        leading: Hero(
          tag: 'zoom',
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, ExpandedImageScreen.id,
                  arguments: accessLogInfo);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(360)),
              child: Container(
                width: 40,
                height: 40,
                child: Image(
                  image: NetworkImage(
                      'http://${IP_ADDRESS}:${IP_PORT}${accessLogInfo.vehicleImage}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        title: Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 2),
                    child: Text(
                      accessLogInfo.getDate(currentLocal.toString()),
                      style: TextStyle(fontSize: 12, color: Colors.black87),
                    ),
                  ),
                  Text(accessLogInfo.getTime(currentLocal.toString()),
                      style: TextStyle(fontSize: 11, color: Colors.black54)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Text(separatedLicense(accessLogInfo.numLetters),
                          style:
                              TextStyle(fontSize: 12, color: Colors.black87))),
                  Text(accessLogInfo.parkingName.toLowerCase().tr(),
                      style: TextStyle(fontSize: 11, color: Colors.black54)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  authorizationState(accessLogInfo.authType),
                ],
              ),
              Container(
                width: screenSize.width > 500 ? 120 : 65,
                child: Center(
                  child: Text(
                      truncateString(
                          accessLogInfo.employeeName, screenSize.width),
                      style: TextStyle(fontSize: 8, color: Colors.black54)),
                ),
              )
            ],
          ),
        ),
        children: [
          ItemDetials(accessLogInfo),
        ],
      ),
    );
  }
}

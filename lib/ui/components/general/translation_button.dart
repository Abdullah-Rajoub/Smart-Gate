import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_gate/generated/keys.g.dart';
import 'package:smart_gate/utility/rounded.dart';

Future<void> restartApp() async {
  // Send a platform-specific message to request a restart
  await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}

class RestartAlertDialog extends StatelessWidget {
  const RestartAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text(
        LocaleKeys.change_lanuage_alert_title.tr(),
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(241, 186, 59, 1),
        ),
      )),
      content: Text(
        LocaleKeys.change_language_alert_text.tr(),
        style: TextStyle(
          fontSize: 14,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            LocaleKeys.change_language_alert_later.tr(),
            style: TextStyle(color: Color.fromRGBO(241, 186, 59, 1)),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(241, 186, 59, 1))),
          onPressed: () {
            Navigator.of(context).pop();
            restartApp();

            // Replace this with your code to restart the app
          },
          child: Text(
            LocaleKeys.change_language_alert_now.tr(),
            // style: TextStyle(color: Color.fromRGBO(241, 186, 59, 1)),
          ),
        ),
      ],
    );
  }
}

class TranslationButton extends StatelessWidget {
  var translateToArabic;
  var translateToEnglish;
  TranslationButton(
      {required this.translateToArabic, required this.translateToEnglish});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.blueAccent.shade100,
      splashColor: Colors.transparent,
      icon: Icon(Icons.language),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              alignment: Alignment.bottomCenter,
              // title: Align(
              //   alignment: Alignment.topCenter,
              //   child: Text(
              //     'Select a Language',
              //     style: TextStyle(fontSize: 14, color: Colors.grey),
              //   ),
              // ),
              shape: const CustomShapeBorder(),
              backgroundColor: Colors.grey.shade300,
              content: Container(
                margin: EdgeInsets.zero,
                width: double.maxFinite,
                height: 200,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 25),
                        child: Material(
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              'Select a Language',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      indent: 0,
                      height: 0,
                      thickness: 1,
                      color: Colors.grey.shade500,
                      endIndent: 0,
                    ),
                    Container(
                      margin: EdgeInsets.zero,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          translateToArabic();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return RestartAlertDialog();
                            },
                          );
                        },
                        child: Material(
                          color: Colors.transparent,
                          child: Center(
                              child: Text(
                            'عربي',
                            style: TextStyle(color: Colors.blueAccent),
                          )),
                        ),
                      ),
                    ),
                    Divider(
                      indent: 0,
                      height: 0,
                      thickness: 1,
                      color: Colors.grey.shade500,
                      endIndent: 0,
                    ),
                    TextButton(
                      onPressed: () async {
                        translateToEnglish();
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return RestartAlertDialog();
                          },
                        );
                        // EasyLocalization.of(context)?.setLocale(Locale('en'));
                      },
                      child: Container(
                        margin: EdgeInsets.all(0),
                        width: double.infinity,
                        child: Material(
                          color: Colors.transparent,
                          child: Center(
                              child: Text(
                            'English',
                            style: TextStyle(color: Colors.blueAccent),
                          )),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 8,
                      color: Color.fromRGBO(120, 116, 116, 1),
                    ),
                    Container(
                      margin: EdgeInsets.all(0),
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Material(
                          color: Colors.transparent,
                          child: Center(
                              child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.redAccent),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

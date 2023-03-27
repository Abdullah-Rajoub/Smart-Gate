import 'package:flutter/material.dart';

class CustomShapeBorder extends ShapeBorder {
  const CustomShapeBorder();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(rect.left + 20, rect.top)
      ..lineTo(rect.right - 20, rect.top)
      ..arcToPoint(
        Offset(rect.right, rect.top + 20),
        radius: const Radius.circular(20),
      )
      ..lineTo(rect.right, rect.bottom - 20)
      ..arcToPoint(
        Offset(rect.right - 20, rect.bottom),
        radius: const Radius.circular(20),
      )
      ..lineTo(rect.left + 20, rect.bottom)
      ..arcToPoint(
        Offset(rect.left, rect.bottom - 20),
        radius: const Radius.circular(20),
      )
      ..lineTo(rect.left, rect.top + 20)
      ..arcToPoint(
        Offset(rect.left + 20, rect.top),
        radius: const Radius.circular(20),
      );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return this;
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
                          Navigator.pop(context);
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
                        Navigator.pop(context);
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

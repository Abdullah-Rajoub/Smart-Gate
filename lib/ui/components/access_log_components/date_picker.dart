import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class DatePicker extends StatelessWidget {
  var setDate;
  late String text;
  DatePicker({required this.setDate, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FilledButton(
        style: FilledButton.styleFrom(backgroundColor: Colors.blue.shade300),
        onPressed: () async {
          DateTime? dateTime = await showOmniDateTimePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1600).subtract(const Duration(days: 3652)),
            lastDate: DateTime.now().add(
              const Duration(days: 3652),
            ),
            is24HourMode: false,
            isShowSeconds: false,
            minutesInterval: 1,
            secondsInterval: 1,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            constraints: const BoxConstraints(
              maxWidth: 350,
              maxHeight: 650,
            ),
            transitionBuilder: (context, anim1, anim2, child) {
              return FadeTransition(
                opacity: anim1.drive(
                  Tween(
                    begin: 0,
                    end: 1,
                  ),
                ),
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 200),
            barrierDismissible: true,
            selectableDayPredicate: (dateTime) {
              // Disable 25th Feb 2023
              if (dateTime == DateTime(2023, 2, 25)) {
                return false;
              } else {
                return true;
              }
            },
          );

          setDate(dateTime);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.calendar_month_rounded,
                color: Colors.white,
              ),
              Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class old extends StatelessWidget {
//   const old({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//
//         style: ElevatedButton.styleFrom(
//           primary: Colors.grey.shade200,
//
//         ),
//         onPressed: () async {
//           DateTime? dateTime = await showOmniDateTimePicker(
//             context: context,
//             initialDate: DateTime.now(),
//             firstDate: DateTime(1600).subtract(const Duration(days: 3652)),
//             lastDate: DateTime.now().add(
//               const Duration(days: 3652),
//             ),
//             is24HourMode: false,
//             isShowSeconds: false,
//             minutesInterval: 1,
//             secondsInterval: 1,
//             borderRadius: const BorderRadius.all(Radius.circular(16)),
//             constraints: const BoxConstraints(
//               maxWidth: 350,
//               maxHeight: 650,
//             ),
//             transitionBuilder: (context, anim1, anim2, child) {
//               return FadeTransition(
//                 opacity: anim1.drive(
//                   Tween(
//                     begin: 0,
//                     end: 1,
//                   ),
//                 ),
//                 child: child,
//               );
//             },
//             transitionDuration: const Duration(milliseconds: 200),
//             barrierDismissible: true,
//             selectableDayPredicate: (dateTime) {
//               // Disable 25th Feb 2023
//               if (dateTime == DateTime(2023, 2, 25)) {
//                 return false;
//               } else {
//                 return true;
//               }
//             },
//           );
//
//           setDate(dateTime);
//         },
//         child: const Text(
//           "Show DateTime Picker",
//           style: TextStyle(color: Colors.black45),
//         ),
//       );
//     }
//
//   }

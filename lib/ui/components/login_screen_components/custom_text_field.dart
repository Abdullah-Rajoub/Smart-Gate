import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final bool isObscure;
  String initValue = '';
  IconData icon;
  var Onchange;
  CustomTextField(
      {required this.label,
      required this.Onchange,
      this.isObscure = false,
      initValue,
      required this.icon});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    controller.value = TextEditingValue(text: widget.initValue);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.label,
              style: TextStyle(
                  fontSize: 14, color: Color.fromRGBO(140, 187, 241, 1)),
            ),
            Expanded(child: Container()),
            Icon(
              widget.icon,
              color: Color.fromRGBO(140, 187, 241, 1),
              size: 20,
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 24,
          width: double.infinity,
          child: TextField(
            controller: controller,
            obscureText: widget.isObscure,
            onChanged: widget.Onchange,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              // Remove fillColor and filled properties
            ),
          ),
        )
      ],
    );
  }
}

// UnderLined
// class _CustomTextFieldState extends State<CustomTextField> {
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController controller = TextEditingController();
//     controller.value = TextEditingValue(text: widget.initValue);
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           height: 5,
//         ),
//         Container(
//           height: 35,
//           child: TextField(
//             controller: controller,
//             obscureText: widget.isObscure,
//             onChanged: widget.Onchange,
//             decoration: InputDecoration(
//               border: UnderlineInputBorder(
//                 borderSide: BorderSide.none,
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.black54),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               enabledBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.black54),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               errorBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.red),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               focusedErrorBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.red),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

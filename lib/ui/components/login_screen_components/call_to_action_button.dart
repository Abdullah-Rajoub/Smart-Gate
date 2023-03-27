import 'package:flutter/material.dart';

class CallToActionButton extends StatelessWidget {
  var onPressed;
  final String label;
  CallToActionButton({required this.onPressed, required this.label});
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.55,
      child: Container(
        height: 38,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromRGBO(252, 238, 203, 1)),
            elevation: MaterialStateProperty.all<double>(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            minimumSize:
                MaterialStateProperty.all<Size>(Size(double.infinity, 60)),
          ),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(241, 186, 59, 1),
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}

//

//     .btn-grad {
// background-image: linear-gradient(to right, #1FA2FF 0%, #12D8FA  51%, #1FA2FF  100%);
// margin: 10px;
// padding: 15px 45px;
// text-align: center;
// text-transform: uppercase;
// transition: 0.5s;
// background-size: 200% auto;
// color: white;
// box-shadow: 0 0 20px #eee;
// border-radius: 10px;
// display: block;
// }
//
//     .btn-grad:hover {
// background-position: right center; /* change the direction of the change here */
// color: #fff;
// text-decoration: none;
// }

// FractionallySizedBox(
// widthFactor: 0.6,
// child: Container(
// decoration: BoxDecoration(
// color: Color.fromRGBO(178, 254, 250, 1),
// // gradient: LinearGradient(
// //   begin: Alignment.topLeft,
// //   end: Alignment.bottomRight,
// //   colors: [
//     Color.fromRGBO(178, 254, 250, 1),
//     Color.fromRGBO(14, 210, 247, 1),
//     Color.fromRGBO(178, 254, 250, 1)
// // //   ],
// // // ),
// borderRadius: BorderRadius.circular(70),
// border: Border.all(color: Colors.transparent, width: 1),
// ),
// child: Material(
// textStyle: TextStyle(color: Colors.white),
// elevation: 1,
// color: Colors.transparent,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(70),
// ),
// // child: TextButton(
// //   style: ButtonStyle(backgroundColor: Colors.transparent),
// //   onPressed: onPressed,
// //   child: Text(
// //     label,
// //     style: GoogleFonts.roboto(
// //       textStyle: TextStyle(
// //         fontWeight: FontWeight.w700,
// //         fontSize: 18,
// //         color: Colors.white,
// //       ),
// //     ),
// //   ),
// // ),
// ),
// ),
// );

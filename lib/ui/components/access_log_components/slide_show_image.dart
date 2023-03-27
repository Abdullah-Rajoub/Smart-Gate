import 'package:flutter/material.dart';
import 'package:smart_gate/network/backend_config.dart';

class SlideShowImage extends StatelessWidget {
  late String imageRoute;
  late String text;
  SlideShowImage(this.imageRoute, this.text);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Image(
            fit: BoxFit.cover,
            width: double.infinity,
            image: NetworkImage('http://${IP_ADDRESS}:${IP_PORT}${imageRoute}'),
          ),
        ),
        // Align(
        //   alignment: Alignment.topCenter,
        //   child: FractionallySizedBox(
        //     heightFactor: 0.3,
        //     widthFactor: 1,
        //     child: Container(
        //       child: Center(
        //         child: Text(
        //           text,
        //           textAlign: TextAlign.center,
        //           style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 30,
        //               fontWeight: FontWeight.w300),
        //         ),
        //       ),
        //       color: Colors.black.withOpacity(0.3),
        //       width: double.infinity,
        //       height: double.infinity,
        //     ),
        //   ),
        // )
      ],
    );
  }
}

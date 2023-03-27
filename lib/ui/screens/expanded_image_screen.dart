import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:smart_gate/models/access_log_info.dart';
import 'package:smart_gate/ui/components/access_log_components/slide_show_image.dart';

class ExpandedImageScreen extends StatelessWidget {
  late AccessLogInfo accessLogInfo;
  static const String id = 'ExpandedImage';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as AccessLogInfo;
    var vehicleImageRoute = args.vehicleImage;
    var licensePlateImageRoute = args.licensePlateImage;
    accessLogInfo = args;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.blue,
        ),
        title: Text(
          '             Vehical Image',
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Material(
          color: Colors.white,
          child: Hero(
            tag: 'zoom',
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: FractionallySizedBox(
                heightFactor: 0.50,
                child: ImageSlideshow(
                  height: double.infinity,
                  width: double.infinity,
                  children: [
                    SlideShowImage(accessLogInfo.vehicleImage, 'Vehical Image'),
                    SlideShowImage(
                        accessLogInfo.licensePlateImage, 'License Plate Image')
                  ],
                  initialPage: 0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

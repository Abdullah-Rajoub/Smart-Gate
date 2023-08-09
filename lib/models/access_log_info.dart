import 'package:intl/intl.dart';

class AccessLogInfo {
  late String timeStamp;
  late String clock;
  late String employeeName;
  late String numLetters;
  late String confidenceLicense;
  late String confidenceModel;
  late String entryType;
  late String parkingName;
  late String vehicleImage;
  late String licensePlateImage;
  late String authType;

  AccessLogInfo(
      {required this.timeStamp,
      required this.clock,
      required this.employeeName,
      required this.numLetters,
      required this.confidenceLicense,
      required this.confidenceModel,
      required this.entryType,
      required this.parkingName,
      required this.licensePlateImage,
      required this.vehicleImage,
      required this.authType});

  factory AccessLogInfo.fromJson(Map<String, dynamic> json) {
    String confidenceLicenseTemp =
        double.parse(json['confidenceLicense']).toStringAsFixed(2);

    String confidenceModelTemp =
        double.parse(json['confidenceModel']).toStringAsFixed(2);
    return AccessLogInfo(
        timeStamp: json['timeStamp'],
        clock: json['clock'],
        entryType: json['entryType'],
        employeeName: json['employeeName'],
        numLetters: json['numLetters'],
        confidenceModel: confidenceModelTemp,
        confidenceLicense: confidenceLicenseTemp,
        parkingName: json['parkingName'],
        vehicleImage: json['vehicleImage'],
        licensePlateImage: json['licensePlateImage'],
        authType: json['authType']);
  }
  String getTime(String local) {
    var date = DateTime.parse(timeStamp + " " + clock);
    var formatter;
    if (local == "ar") {
      formatter = DateFormat('h:mm a', 'ar');
    } else {
      formatter = DateFormat('h:mm a');
    }

    var formattedTime = formatter.format(date);
    return formattedTime;
  }

  String getDate(String local) {
    var formatter = null;
    if (local == "ar") {
      formatter = DateFormat.yMMMMd('ar');
    } else {
      formatter = DateFormat.yMMMMd('en');
    }
    var date = DateTime.parse(timeStamp + " " + clock);

    var formattedDate = formatter.format(date);
    return formattedDate;
  }
}

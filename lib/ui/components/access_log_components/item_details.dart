import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_gate/generated/keys.g.dart';
import 'package:smart_gate/models/access_log_info.dart';
import 'package:smart_gate/ui/components/access_log_components/metric_descritption.dart';

class ItemDetials extends StatelessWidget {
  late AccessLogInfo accessLogInfo;
  ItemDetials(this.accessLogInfo);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 124,
      color: Colors.white70,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: DropDownDetails(accessLogInfo),
      ),
    );
  }
}

// ------------------- helping function -----------------------------
String convertToPercentage(String number, String locale) {
  if (locale == 'ar')
    return '%' + (double.parse(number) * 100).toInt().toString();
  return (double.parse(number) * 100).toInt().toString() + '%';
}

class DropDownDetails extends StatelessWidget {
  late AccessLogInfo accessLogInfo;
  DropDownDetails(this.accessLogInfo);
  @override
  Widget build(BuildContext context) {
    String locale = context.locale.toString();
    return ListView(
      itemExtent: 28,
      padding: EdgeInsets.symmetric(vertical: 0),
      children: [
        MetricDescription(
          trailing: accessLogInfo.employeeName.tr(),
          leading: LocaleKeys.employee_name.tr(),
          icon: Icon(
            Icons.person,
            color: Colors.blue.shade300,
          ),
        ),
        MetricDescription(
            trailing:
                convertToPercentage(accessLogInfo.confidenceLicense, locale),
            leading: LocaleKeys.license_confidence.tr(),
            icon: Icon(Icons.card_membership, color: Colors.blue.shade300)),
        MetricDescription(
            trailing:
                convertToPercentage(accessLogInfo.confidenceModel, locale),
            leading: LocaleKeys.modal_confidence.tr(),
            icon: Icon(Icons.car_repair, color: Colors.blue.shade300)),
        MetricDescription(
            trailing: accessLogInfo.getTime(locale),
            leading: LocaleKeys.time.tr(),
            icon: Icon(Icons.timelapse_outlined, color: Colors.blue.shade300)),
      ],
    );
  }
}

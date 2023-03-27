import 'package:flutter/cupertino.dart';

class UserInfo extends ChangeNotifier {
  late String email;
  late String refresh;
  late String access =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjgwNzY5MDM5LCJpYXQiOjE2Nzk5MDUwMzksImp0aSI6IjgxZDY3NjJkYzYwMDQyOTJiYTJhZTEzYTA1MjhlMDM1IiwidXNlcl9pZCI6IjkyMDRiMDJkLWQyNzgtNDdlYy04MzdjLWRiYjA0YjI0ODI2YiJ9.ER-G3U5myMXuWwsVSNR-_Ww60nBF5GfGyUXRaav00d8';

  void login(
      {required String email,
      required String refresh,
      required String access}) {
    this.email = email;
    this.refresh = refresh;
    this.access = access;
  }
}

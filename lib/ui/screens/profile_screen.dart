import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_gate/provider/user_info_provider.dart';
import 'package:smart_gate/ui/screens/access_log_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const id = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userInfoProvider = Provider.of<UserInfo>(context);

    return Scaffold(
        body: ListView(
      children: [
        Center(
            child: Column(children: [
          Text(userInfoProvider.refresh),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AccessLogScreen.id);
              },
              child: Text('go to acess log'))
        ])),
      ],
    ));
  }
}

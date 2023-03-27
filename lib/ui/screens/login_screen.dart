import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_gate/generated/keys.g.dart';
import 'package:smart_gate/network/http_helper.dart';
import 'package:smart_gate/provider/user_info_provider.dart';
import 'package:smart_gate/ui/components/login_screen_components/call_to_action_button.dart';
import 'package:smart_gate/ui/components/login_screen_components/custom_check_box.dart';
import 'package:smart_gate/ui/components/login_screen_components/custom_text_field.dart';
import 'package:smart_gate/ui/screens/profile_screen.dart';
import 'package:smart_gate/utility/presistant_storage.dart';

class LoginScreen extends StatefulWidget {
  bool isChecked = false;
  static const id = '/login';

  late String email = '';
  late String password = '';
  void emailOnChange(String currentValue) {
    this.email = currentValue;
  }

  void pwsOnChange(String currentValue) {
    this.password = currentValue;
  }

  void printEmail() async {
    print(await PresistentStorage().getEmail());
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initilizingFields();
  }

  initilizingFields() async {
    String savedEmail = await PresistentStorage().getEmail();
    String savedPassword = await PresistentStorage().getPassword();
    if (savedEmail != null && savedPassword != null) {
      setState(() {
        widget.email = savedEmail;
      });
      setState(() {
        widget.password = savedPassword;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.printEmail();
    UserInfo userInfo = Provider.of<UserInfo>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    color: Color.fromRGBO(140, 187, 241, 1),
                    child: Center(
                      child: Text(
                        'Smart Gate',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 26,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CustomTextField(
                    icon: Icons.email_outlined,
                    label: LocaleKeys.email.tr(),
                    Onchange: widget.emailOnChange,
                    initValue: widget.email,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    icon: Icons.key,
                    label: LocaleKeys.password.tr(),
                    Onchange: widget.pwsOnChange,
                    isObscure: true,
                  ),
                  CustomCheckBox(
                      onChanged: (currentValue) {
                        setState(() {
                          widget.isChecked = currentValue;
                        });
                      },
                      label: LocaleKeys.remember_me.tr(),
                      value: widget.isChecked),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: CallToActionButton(
                  label: LocaleKeys.login.tr(),
                  onPressed: () async {
                    var response = await HttpHelper.loginUser(
                        email: widget.email, password: widget.password);
                    // Request worked
                    if (response != null) {
                      //Saving data into userInfo Provider
                      userInfo.login(
                          email: widget.email,
                          refresh: response['refresh'],
                          access: response['access']);
                      // Saving data into shared reference / hive?
                      if (widget.isChecked) {
                        PresistentStorage().setUserInfo(
                            password: widget.password,
                            email: widget.email,
                            refresh: response['refresh'],
                            access: response['access']);
                      }
                      Navigator.pushReplacementNamed(context, ProfileScreen.id);
                    } else {
                      print('thing are not good');
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

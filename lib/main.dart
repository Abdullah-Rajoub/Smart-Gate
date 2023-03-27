import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_gate/provider/user_info_provider.dart';
import 'package:smart_gate/routing/routes.dart';
import 'package:smart_gate/ui/screens/access_log_screen.dart';

import 'generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      assetLoader: CodegenLoader(),
      supportedLocales: [Locale('ar'), Locale('en')],
      path: 'assets/translations',
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserInfo>(
      create: (context) => UserInfo(),
      child: MaterialApp(
        // color: Color.fromRGBO(215, 221, 233, 255),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Color.fromRGBO(253, 253, 255, 1),
          primarySwatch: Colors.blue,
          fontFamily: 'Roboto',
        ),
        initialRoute: AccessLogScreen.id,
        routes: currentRoute,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_api_paihsan/pages/detail_page.dart';
import 'package:test_api_paihsan/pages/forgot_pw.dart';
import 'package:test_api_paihsan/pages/home_page.dart';
import 'package:test_api_paihsan/pages/login_page.dart';
import 'package:test_api_paihsan/pages/register_page.dart';
import 'package:test_api_paihsan/pages/reset_pw.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('TOKEN');

  runApp(MyApp(initialRoute: token != null ? '/' : '/login'));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // brightness: Brightness.dark,
        useMaterial3: true,
      ),
      initialRoute: initialRoute,
      routes: {
        '/register': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/forgotpw': (context) => const ForgotPasswordPage(),
        '/resetpw': (context) => const ResetPasswordPage(),
        '/': (context) => HomePage(),
        '/detailpage': (context) => const DetailPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:imiu_mobile/controllers/login_controller.dart';
import 'package:imiu_mobile/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import "./ultis/colors.dart";
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> loadEnv() async {
  await dotenv.load(fileName: ".env");
  print("API_ENDPOINT=${dotenv.env['API_ENDPOINT']}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadEnv();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  HttpOverrides.global = MyHttpOverrides();
  Get.put(LoginController(), tag: "loginControllerTag");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return GetMaterialApp(
      title: 'Imiu',
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: primaryBg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: const Color(0xFF0CBF1E),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              color: mainText,
              fontFamily: 'Montserrat',
              fontSize: 22,
              fontWeight: FontWeight.bold),
          displayMedium: TextStyle(
            color: mainText,
            fontFamily: 'Montserrat',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: TextStyle(
            color: greyColor,
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        useMaterial3: false,
      ),
      builder: FToastBuilder(),
      // home: const AuthPage(),
    );
  }
}

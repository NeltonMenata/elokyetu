import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:elokyetu/screens/bottom_bar/tabb_screen.dart';
import 'package:elokyetu/screens/welcome_view/welcome_view.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'app/app_controller/login_controller.dart';
import 'app/app_internacional/translations.dart';
import 'Back4app/back4app.dart';
import 'getx_network_manager.dart';
//import 'network_binding.dart';

void main() async {
  Back4app.initialize();
  await GetStorage.init();
  runApp(MyApp());
  language = await GetStorage().read("language") as int?;
}

int? language;

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final GetXNetworkManager _networkManager = Get.put(GetXNetworkManager());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialBinding: NetworkBinding(),
      locale: language == null
          ? const Locale("pt", "PT")
          : language == 2
              ? const Locale("en", "US")
              : language == 3
                  ? const Locale("fr", "FR")
                  : const Locale("pt", "PT"),
      fallbackLocale: const Locale("pt", "PT"),
      translations: Traduction(),
      title: 'Elokyetu',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        // ignore: deprecated_member_use
        accentColor: Colors.lightBlueAccent,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: GetBuilder<GetXNetworkManager>(builder: (context) {
        if (_networkManager.connectionType == 0) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Text(
                "Sem conexão com a internet. Verifica a ligação!!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
        }
        return EasySplashScreen(
          futureNavigator: userCurrent(),
          durationInSeconds: 4,
          logo: Image.asset(
            "assets/img/fundo_logo.png",
            width: 150,
            height: 150,
          ),
          title: const Text(
            "EloKyetu",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue,
            ),
          ),
          backgroundColor: Colors.black,
        );
      }),
    );
  }

  Future<Widget>? userCurrent() async {
    try {
      await GetStorage.init();
      final email = await GetStorage().read("email") as String?;
      final senha = await GetStorage().read("senha") as String?;
      if (email != null && senha != null) {
        final parseUser = ParseUser(email, senha, null);

        final response = await parseUser.login();

        final queryUser = QueryBuilder(ParseObject("Personal"))
          ..whereEqualTo("user", parseUser);
        LoginController.userInformation = await queryUser.first();
        LoginController.user = response.results!.first;

        Get.offAll(TabsScreen());
        return TabsScreen();
      } else {
        await Future.delayed(const Duration(seconds: 3));
        return WelcomeView();
      }
    } catch (error) {
      await Future.delayed(const Duration(seconds: 3));
      return WelcomeView();
    }
  }
}

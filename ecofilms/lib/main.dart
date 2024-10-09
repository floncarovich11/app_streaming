
import 'package:ecofilms/pages/cadastro.dart';
import 'package:ecofilms/pages/home.dart';
import 'package:ecofilms/pages/login.dart';
import 'package:ecofilms/pages/splash.dart';
import 'package:ecofilms/shared/style.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        fontFamily: MyFonts.fontPrimary,
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.verdeprincipal),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        // "/" : (context) => Splash(),
        // "/login" : (context) => Login(),
        // "/cadastro" : (context) => Cadastro(),
        "/" : (context) => Home()
      },
    );
  }
}

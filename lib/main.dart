import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/components/cards/luminosity_card.dart';
import 'package:mobile_project/controllers/humidity_controller.dart';
import 'package:mobile_project/controllers/luminosity_controller.dart';
import 'package:mobile_project/controllers/rainfall_controller.dart';
import 'package:mobile_project/controllers/add_station.dart';
import 'package:mobile_project/screens/favorite_station_screeen.dart';
import 'package:mobile_project/screens/map_page/map_page.dart';
import 'package:mobile_project/screens/home_page.dart';
import 'package:mobile_project/screens/settings.dart';
import 'package:mobile_project/screens/sign_in.dart';
import 'package:mobile_project/screens/map_page/map_page.dart';
import 'package:mobile_project/screens/statiscs_screens/humidity_statistic_screen.dart';
import 'package:mobile_project/screens/statiscs_screens/luminosity_statistic_screen.dart';
import 'package:mobile_project/screens/statiscs_screens/pressure_statistic_screen.dart';

import 'package:mobile_project/styles/colors.dart';
import 'package:mobile_project/screens/statiscs_screens/temperature_statistic_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main()  {



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //init
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          "HomePage": (context) => HomePage(),
          "Sign In": (context) => SignIn(),
          "Add Station": (context) => AddStationScreen(),
          "Map Page": (context) => MapPage(),
          "Favorite Station": (context) => FavoriteStationPage(),
          "TemperatureStatistics": (context) => TemperatureStatictis(),
          "HumidityStatistic": (context) => HumidityStatistics(),
          "LuminosityStatics": (context) => LuminosityStatistics(),
          "PressureStatistic": (context) => PressureStatictis(),
          "Setting": (context) => SettingsScreen(),
   //     "RainFallStatistic" :(context) => RainFallStatistics()
   }

        , theme: ThemeData(colorSchemeSeed: darkBlue),
        title: "tes",
        home: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SignIn( );
            }
            return CircularProgressIndicator();
          },)


    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_project/components/cards/humidity_card.dart';
import 'package:mobile_project/components/cards/rainfall_card.dart';
import 'package:mobile_project/components/cards/temperature_card.dart';
import 'package:mobile_project/components/cards/luminosity_card.dart';
import 'package:mobile_project/components/cards/pressure_card.dart';
import 'package:mobile_project/controllers/humidity_controller.dart';
import 'package:mobile_project/controllers/luminosity_controller.dart';
import 'package:mobile_project/controllers/pressure_controller.dart';
import 'package:mobile_project/controllers/rainfall_controller.dart';
import 'package:mobile_project/controllers/temperature_controller.dart';
import 'package:mobile_project/styles/colors.dart';
import 'package:mobile_project/styles/text_styles.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? rainfallValue;
  String? currentTemperature ;
  String? humidityValue;
  String? luminosityValue;
  String? pressureValue;
  List<List<String>>? humidityListValue ;
  List<List<String>>? luminosityListValue ;
  List<List<String>>? temperatureListValue ;
  List<List<String>>? pressureListValue ;
  List<List<String>>? rainfallListValue ;




  late HumidityController humidityController ;
  late TemperatureController temperatureController ;
   late RainFallController rainFallController;
   late LuminosityController luminosityController;
   late PressureController pressureController ;



  @override
  void initState()   {
    humidityController=HumidityController();
    pressureController=PressureController();

    temperatureController=TemperatureController();
     rainFallController = RainFallController();
     luminosityController=LuminosityController();


    super.initState();





    fetchTemperature(temperatureController).then((value) {
      setState(() {
        currentTemperature = value;
      });
    });
    fetchHumidity(humidityController).then((value) {
      setState(() {
        humidityValue = value;
      });
    });



     fetchRainFall(rainFallController).then((value) {
      setState(() {
        rainfallValue = value;

      });
    });
    fetchLuminosity(luminosityController).then((value) {
      setState(() {
        luminosityValue = value;

      });
    });
    fetchPressure(pressureController).then((value) {
      setState(() {
        pressureValue = value;

      });
    });

    fetchListCoupleTimeValueTemperature(temperatureController).then((value) {
      setState(() {
        temperatureListValue = value;
      });
    });

    fetchListCoupleTimeValueHumidity(humidityController).then((value) {
      setState(() {
        humidityListValue = value;
      });
    });
    fetchListCoupleTimeValuePressure(pressureController).then((value) {
      setState(() {
        pressureListValue = value;
      });
    });
    fetchListCoupleTimeValueLuminosity(luminosityController).then((value) {
      setState(() {
        luminosityListValue = value;
      });
    });
    fetchListCoupleTimeValueRainFall(rainFallController).then((value) {
      setState(() {
        rainfallListValue = value;

      });
    });




  }







  @override

  Widget build(BuildContext context) {


    var size = MediaQuery
        .of(context)
        .size;





    return
      Scaffold(
        drawer: Drawer(
          backgroundColor: const Color(0xFF98B0FF).withOpacity(0.5),
          elevation: 10,
          width: size.width * 0.51,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: darkBlue.withOpacity(0.1)),
                child: Image.asset(
                  "assets/logo.png",
                ),
              ),
              ListTile(
                leading: Image.asset(
                  "assets/favorite.png",

                ),
                title: const Text(
                  "Favorite Station",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "Favorite Station");
                },

              ),

              SizedBox(
                height: size.height * 0.05,
              ),
              ListTile(
                onTap: (){
                  Navigator.pushNamed(context, "Setting");
                },
                leading: Image.asset(
                  "assets/setting.png",

                ),

                title: const Text(
                  "Settings",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              ListTile(
                onTap: (){
                  Navigator.pushNamed(context, "Map Page");
                },
                leading: Image.asset(
                    "assets/map.png"

                ),
                title : const Text(
                  "Return to map",style: TextStyle(color: Colors.white),
                )
              ),
              SizedBox(
                height: size.height * 0.2,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  size: size.width * 0.14,
                  color: Colors.white,
                ),
                title: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "Sign In");
                },
              )
            ],
          ),
        ),
        backgroundColor: darkBlue,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 8),
                  child: Builder(
                      builder: (context) {
                        return InkWell(onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                            child: Icon(Icons.menu, color: Colors.white,
                              size: size.width * 0.1,)
                        );
                      }
                  ),
                ),
                SizedBox(height: size.height*0.03,),
                Center(
                  child: SizedBox(
                      height: size.height * 0.25,
                      width: size.width * 0.6,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      )),
                ),
                TextButton(onPressed: (){
                  temperatureListValue !=null ?Navigator.pushNamed(context, "TemperatureStatistics", arguments: temperatureListValue):const CircularProgressIndicator();

                },
                    child: TemperatureCard(currentTemperature: currentTemperature,)),
                TextButton(
                    onPressed: () {


                     humidityListValue != null ? Navigator.pushNamed(context, "HumidityStatistic", arguments: humidityListValue): const CircularProgressIndicator();

                    },
                    child: HumidityCard(humidityValue: humidityValue,)),
                TextButton(onPressed:(){
                //  Navigator.pushNamed(context, "RainFallStatistic");
                const AlertDialog(
                  content: Text("No data Found"),);
                } ,child: RainfallCard(rainFallValue: rainfallValue,)),

TextButton(
    onPressed: () { luminosityListValue !=null ?Navigator.pushNamed(context, "LuminosityStatics", arguments: luminosityListValue): const CircularProgressIndicator(); },
    child: LuminosityCard(luminosityValue: luminosityValue,)),
TextButton(onPressed: (){
  pressureListValue != null ? Navigator.pushNamed(context, "PressureStatistic", arguments: pressureListValue): const CircularProgressIndicator();

},child: PressureCard(humidityValue: pressureValue,))

              ]),
        ),
      ) ;}





}




Future<String> fetchTemperature(TemperatureController t) async  {
  var currentTemperature = await t.calcul();
  return currentTemperature ;}




Future<String> fetchHumidity(HumidityController h) async  {
  var currentTemperature = await h.calculHumidity();
  return currentTemperature ;}



Future<String> fetchRainFall(RainFallController r) async  {
  var currentRainFall = await r.lastValueRainFall();
  return currentRainFall ;}


Future<String> fetchLuminosity(LuminosityController r) async  {
  var currentLuminosity = await r.getLuminosityLastValue();
  return currentLuminosity ;}

Future<String> fetchPressure(PressureController r) async  {
  var currentPressure = await r.pressureLastValue();
  return currentPressure;}









Future<List<List<String>>> fetchListCoupleTimeValueHumidity(HumidityController h) async  {
  var coupleListeTimeValues = await h.getListOfCoupleTimeValues();
  return coupleListeTimeValues ;}

Future<List<List<String>>> fetchListCoupleTimeValueTemperature(TemperatureController h) async  {
  var coupleListeTimeValuesHumidity = await h.getListOfCoupleTimeValues();
  return coupleListeTimeValuesHumidity ;}


Future<List<List<String>>> fetchListCoupleTimeValueLuminosity(LuminosityController h) async  {
  var coupleListeTimeValuesLuminosity = await h.getListOfCoupleTimeValues();
  return coupleListeTimeValuesLuminosity;}

Future<List<List<String>>> fetchListCoupleTimeValuePressure(PressureController h) async  {
  var coupleListeTimeValuesPressure = await h.getListOfCoupleTimeValues();
  return coupleListeTimeValuesPressure ;}

Future<List<List<String>>> fetchListCoupleTimeValueRainFall(RainFallController h) async  {
  var coupleListeTimeValuesRainFall = await h.getListOfCoupleTimeValues();
  return coupleListeTimeValuesRainFall ;}





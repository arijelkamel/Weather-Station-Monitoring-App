import 'package:flutter/material.dart';
import 'package:mobile_project/controllers/luminosity_controller.dart';
import 'package:mobile_project/screens/home_page.dart';
import 'package:mobile_project/styles/colors.dart';
class LuminosityCard extends StatefulWidget {
  final String? luminosityValue;

  const LuminosityCard({Key? key, required this.luminosityValue}) : super(key: key);

  @override
  State<LuminosityCard> createState() => _LuminosityCardState();
}

class _LuminosityCardState extends State<LuminosityCard> {
  List<String> weatherConditions = ["Night","Sunny","Cloudy","CloudyAndClearAtTimes"];



  @override
  Widget build(BuildContext context) {


    var  size = MediaQuery.of(context).size ;
    return Center(
      child: Card(
        shadowColor: Colors.indigoAccent.withOpacity(0.1),

        shape: RoundedRectangleBorder(
            side: BorderSide(color:Colors.indigo.withOpacity(0.3),width: 0.5),
            borderRadius: BorderRadius.circular(20)),

        elevation: 10  ,


        child: Container(
          width: size.width*0.7 ,
          height: size.height*0.2,

          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: LinearGradient( begin: const Alignment(-1,1),end: const Alignment(1,-1),

            colors: [darkBlue.withOpacity(0.95),


              Color(0xFF111111).withOpacity(1)


            ],
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start
            ,

            children: [

              Row(

                children: [

                  Padding(
                    padding:  EdgeInsets.only(top:8.0,left: 8,bottom: 8),
                    child: Text(" LIGHT INTENSITY",style: TextStyle(color: whiteWith_05_Opacity,fontSize:size.width*0.02)),
                  ),


                ],),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  // icon size
                  SizedBox(
                    height: size.height*0.13,
                      width: size.width*0.13,
                      child:  Image.asset(checkWeatherCondition( luminosityValue :widget.luminosityValue ),fit: BoxFit.fill,color: PurpleLight,)),
                  Padding(
                    padding:  EdgeInsets.only(left: size.width*0.03,),
                    child: widget.luminosityValue!=null ? Text(widget.luminosityValue!,style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold,fontSize: size.width*0.07
                    )):CircularProgressIndicator(),
                  ),
                ],
              ),







            ],
          ),
        ),

      ),
    );
  }
  String checkWeatherCondition({String? luminosityValue ="35.4"}){
      if (luminosityValue == null) return "";
    if(( double.parse(luminosityValue) < 1) && (double.parse(luminosityValue) >0 )){

      return "assets/nuit.png" ;

    }
    else if(double.parse(luminosityValue)<200)  {
      return "assets/Cloudy.png";


    }else if (int.parse(luminosityValue)<2000){
      return "assets/CloudyAndClearAtTimes.png" ;
    }

else {
return "assets/Sunny.pg";
    }
  }
}

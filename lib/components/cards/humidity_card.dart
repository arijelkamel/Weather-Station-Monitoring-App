
import 'package:flutter/material.dart';

import '../../styles/colors.dart';
class HumidityCard extends StatefulWidget {
  final String? humidityValue;
  const HumidityCard({Key? key,required this.humidityValue}) : super(key: key);

  @override
  State<HumidityCard> createState() => _HumidityCardState();
}

class _HumidityCardState extends State<HumidityCard> {
  late String  humidityPercentage ;
  @override
  void initState() {
    setState(() {
      humidityPercentage=  widget.humidityValue??"";
    });

    super.initState();
  }
  String cardName = "HUMIDITY";
  String  iconAsset= "assets/Moisture.png" ;
  String dewPoint ="The Dew point is 17";
  @override
  Widget build(BuildContext context) {

    var  size = MediaQuery.of(context).size ;


    return Center(
      child: Card(
        shadowColor: Colors.indigoAccent.withOpacity(0.1),
        shape: RoundedRectangleBorder(
            side: BorderSide(color:Colors.indigo.withOpacity(0.3),width: 0.5),
            borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        child: Container(
          width: size.width*0.7,
          height: size.height*0.2,

          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: LinearGradient( begin: const Alignment(-1,1),end: const Alignment(1,-1),

            colors: [darkBlue.withOpacity(0.95),


              const Color(0xFF111111).withOpacity(1)


            ],
          )),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Row(
                children:[
                  Padding(
                    padding:  const EdgeInsets.only(top:8.0,left: 8,bottom: 8),
                     child:
                    Text( cardName ,style: TextStyle(color: whiteWith_05_Opacity,fontSize: size.width*0.03)),
                ),
          ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    SizedBox(
                        width: size.width*0.13,
                        height: size.height*0.13,

                        child: Image.asset(iconAsset,fit: BoxFit.fill,color:PurpleLight,)),
                widget.humidityValue!= null ? Text("${widget.humidityValue!}%",style: TextStyle(fontSize: size.width*0.1,color: Colors.white),):const CircularProgressIndicator(),
      ],
              ),
   ],),),
      ),
    );
  }
}

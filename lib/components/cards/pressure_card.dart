
import 'package:flutter/material.dart';

import '../../styles/colors.dart';
class PressureCard extends StatefulWidget {
final String? humidityValue;
const PressureCard({Key? key,required this.humidityValue}) : super(key: key);

@override
State<PressureCard> createState() => _PressureCardState();
}

class _PressureCardState extends State<PressureCard> {
late String  humidityPercentage ;
@override
void initState() {
setState(() {
humidityPercentage=  widget.humidityValue??"";
});

super.initState();
}
String cardName = "PRESSURE";
String  iconAsset= "assets/image 9.png" ;
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

decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: LinearGradient( begin: Alignment(-1,1),end: Alignment(1,-1),

colors: [darkBlue.withOpacity(0.95),


Color(0xFF111111).withOpacity(1)


],
)),

child: Column(
mainAxisAlignment: MainAxisAlignment.start,

children: [
Row(
children:[
Padding(
padding:  EdgeInsets.only(top:8.0,left: 8,bottom: 11),
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
height: size.height*0.1,

child: Image.asset(iconAsset,fit: BoxFit.contain,color: PurpleLight,)),
widget.humidityValue!= null ? Text("${widget.humidityValue!} h/Pa",style: TextStyle(fontSize: size.width*0.04,color: Colors.white),):CircularProgressIndicator(),
],
),
],),),
),
);
}
}
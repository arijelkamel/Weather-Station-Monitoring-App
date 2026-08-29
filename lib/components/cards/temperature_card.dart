import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class TemperatureCard extends StatefulWidget {
  final String? currentTemperature ;


  const TemperatureCard({Key? key,required this.currentTemperature}) : super(key: key);

  @override
  State<TemperatureCard> createState() => _TemperatureCardState();
}
class _TemperatureCardState extends State<TemperatureCard> {
  late String  temperature ;

  @override
  void initState() {
    temperature=  widget.currentTemperature??"";



    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    var Size = MediaQuery.of(context).size;

    String cardName = "FEELS LIKE";
    String iconAsset = "assets/Temperature.png";
    return Center(
      child: Card(
        shadowColor: Colors.indigoAccent.withOpacity(0.1),
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.indigo.withOpacity(0.3), width: 0.5),
            borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        child: SizedBox(
          width: Size.width * 0.7,
          height: Size.height * 0.2 ,
          child: Container(

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: const Alignment(-1, 1),
                  end: const Alignment(1, -1),
                  colors: [
                    darkBlue.withOpacity(0.95),
                    const Color(0xFF111111).withOpacity(1)
                  ],
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Row (
                  children: [
                    Padding(
                    padding:  EdgeInsets.only(top:8.0,left: 8,bottom: 8),
                    child: Text(cardName,
                        style: TextStyle(
                          color: whiteWith_05_Opacity,
                          fontSize: Size.width*0.03,
                        )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,


                    children: [
                      SizedBox(
                          width: Size.width * 0.2,
                          height: Size.height * 0.13,
                          child: Image.asset(
                            iconAsset,
                            fit: BoxFit.fill,
                          )
                      ),
                Container(
                  margin: EdgeInsets.only(),
                  child: widget.currentTemperature != null ? Text(
                    "${widget.currentTemperature!}°C",
                    style: TextStyle(color: Colors.white,fontSize: Size.width*0.1),
                  ) : CircularProgressIndicator(),
                ),

  ],
      ),







              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_project/styles/colors.dart';

import '../station.dart';
class StationCard extends StatefulWidget {
  final Station station;
   StationCard({Key? key, required this.station}) : super(key: key);

  @override
  State<StationCard> createState() => _StationCardState();
}

class _StationCardState extends State<StationCard> {

  @override
  Widget build(BuildContext context) {

    var  Size = MediaQuery.of(context).size ;

    return Padding(
      padding:EdgeInsets.symmetric(horizontal: Size.width*0.05,vertical: Size.height*0.011),


      child: InkWell(
        onTap: (){Navigator.pushNamed(context, "HomePage");},

        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
elevation: 5,
          child: Container(
            height: Size.height*0.14,


            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: LinearGradient( begin: Alignment(-1,1),end: Alignment(1,-1),

              colors: [darkBlue.withOpacity(0.95),


                Color(0xFF111111).withOpacity(1)


              ],
            )),
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top:8.0
                  ,left: Size.width*0.05),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top:Size.height*0.004),
                        child: Image.asset("assets/position.png"),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: Size.width*0.02),
                        child: Text("${widget.station.name}",style: TextStyle(color: Colors.white,fontSize: Size.height*0.03,fontWeight: FontWeight.bold),),
                      )



                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: Size.width*0.080),
                  child: Row(
                    children: [Column(children: [
                      Text("Latitude: ${widget.station.latitude}",style: TextStyle(color: Colors.grey,fontSize: Size.height*0.025),),
                      Text("longitude: ${widget.station.longitude}",style: TextStyle(color: Colors.grey,fontSize: Size.height*0.025)),

                    ],),
                    Spacer(),
                    Padding(
                      padding:  EdgeInsets.only(right: Size.width*0.05),
                      child: IconButton(onPressed: (){
                        Navigator.pushNamed(context,  "" );
                      },icon: SizedBox(
                        height: Size.height*0.5
                          ,width: Size.width*0.5  ,
                          child: Image.asset("assets/GoToDetails.png",fit: BoxFit.fitWidth,))),
                    )]

                  ),
                )
              ],
            ),
          )

          ,
        ),
      ),
    );
  }
}

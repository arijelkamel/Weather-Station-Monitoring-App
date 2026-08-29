import 'package:flutter/material.dart';
import 'package:mobile_project/components/station.dart';
import 'package:mobile_project/components/cards/station_card.dart';
import 'package:mobile_project/styles/colors.dart';
import 'package:mobile_project/styles/text_styles.dart';
import 'package:mobile_project/styles/variables.dart';
class FavoriteStationPage extends StatefulWidget {
  const FavoriteStationPage({Key? key}) : super(key: key);

  @override
  State<FavoriteStationPage> createState() => _FavoriteStationPageState();
}

class _FavoriteStationPageState extends State<FavoriteStationPage> {
  @override
  Widget build(BuildContext context) {
    var Size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(

        backgroundColor: darkBlue,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon:Icon(Icons.arrow_back,size: Size.width*0.1,color: Colors.white,)),
SizedBox(
  height : Size.height*0.01
),
             Padding(
               padding:  EdgeInsets.only(bottom: Size.height*0.1),
               child: Center(
                 child: Container(

                   decoration: BoxDecoration(
                     color: Colors.white.withOpacity(1),
                     borderRadius: BorderRadius.circular(30)

                   ),
                   child: Padding(
                     padding:  EdgeInsets.all(15.0),
                     child: Text("Your Favorite Stations",style: TextStyle(fontSize: Size.width*0.07,color: darkBlue),),

                   ),
                 ),
               ),
             ),

       Column(children: [
           for ( var index = 0 ; index < favoriteStation.length ;index++)...[
            InkWell(
              onTap: (){

              },
                child: StationCard(station: favoriteStation[index]))
           ]




       ],), ],
          ),
        ),
      ),
    );
  }
}

/*
}
*/

import 'package:flutter/material.dart';
class AddStationScreen extends StatefulWidget {
   AddStationScreen({Key? key}) : super(key: key);

  @override
  State<AddStationScreen> createState() => _AddStationScreenState();
}

class _AddStationScreenState extends State<AddStationScreen> {
  late TextEditingController _latitudecontroler ;
  late TextEditingController _longitudecontroler;
@override
void initState(){
  super.initState();
  _latitudecontroler= TextEditingController();
  _longitudecontroler=TextEditingController();

}
@override
void dispose()
{
  _latitudecontroler.dispose();
  _longitudecontroler.dispose();
  super.dispose();
}



  @override

  Widget build(BuildContext context) {

    return Column(
        children: [
          TextField(
            controller: _latitudecontroler,

            decoration: InputDecoration(
              hintText: "Station latitude",
              border: OutlineInputBorder()
            ),


          ),TextField(
            controller: _longitudecontroler,

    decoration: InputDecoration(
    hintText: "Station longitude  ",
    border: OutlineInputBorder()
    ))
       , MaterialButton(onPressed: (){



          }) ],
    );

  }
}

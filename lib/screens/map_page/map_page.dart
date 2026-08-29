import 'dart:math';
import 'package:mobile_project/components/station.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/styles/colors.dart';
import 'package:mobile_project/styles/text_styles.dart';
import 'package:mobile_project/styles/variables.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:tuple/tuple.dart';


class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  bool isAdministrator = false;
  bool isAddedToFavorite = false ;

  late TextEditingController _latitudecontroler;
  late TextEditingController _namecontroler;
  late TextEditingController _longitudecontroler;
  late TextEditingController _bucketcontroler;
  late TextEditingController _tokencontroler;
  late TextEditingController _urlcontroler;
  late TextEditingController _orgcontroler;


  late List<Station> _stations;
  late MapTileLayerController _controller;
  late MapZoomPanBehavior _zoomPanBehavior;
  late Station stationToAdd;

  @override
  void initState() {
    _latitudecontroler = TextEditingController();
    _longitudecontroler = TextEditingController();
    _namecontroler=TextEditingController();
    _bucketcontroler=TextEditingController();
    _tokencontroler=TextEditingController();
    _urlcontroler=TextEditingController();
    _orgcontroler=TextEditingController();



    _stations = stations;
    _controller = MapTileLayerController();
    _zoomPanBehavior = MapZoomPanBehavior(
      enableDoubleTapZooming: true,
      focalLatLng: MapLatLng(35.5, 9.7),
      zoomLevel: 8,
      minZoomLevel: 1,
      maxZoomLevel: 50
    );
    super.initState();
  }

  @override
  void dispose() {
    _latitudecontroler.dispose();
    _longitudecontroler.dispose();
    super.dispose();
  }






  @override
  Widget build(BuildContext context) {

    var Size = MediaQuery.of(context).size;

    return Scaffold(

      drawer: Drawer(backgroundColor: darkBlue.withOpacity(0.5),
        elevation: 10,
width: Size.width*0.55
        ,
      child: ListView(children: [DrawerHeader(child: Image.asset("assets/logo.png"),
      decoration: BoxDecoration(
        color: darkBlue.withOpacity(0.1)
      ),),
      ListTile( leading: Image.asset("assets/favorite.png",color: Colors.white.withOpacity(0.6),),

          title: Text("Favorite Station",style: TextStyle(color :Colors.white),),
onTap: (){
        Navigator.pushNamed(context, "Favorite Station");
},
        ),
        SizedBox(height: Size.height*0.05,),
        ListTile( onTap: (){Navigator.pushNamed(context, "Setting");}, leading: Image.asset("assets/setting.png",color: Colors.white.withOpacity(0.6),),

          title: Text("Settings",style: TextStyle(color :Colors.white),),

        ),
SizedBox(height: Size.height*0.4,),

        ListTile(leading: Icon(Icons.logout,size: Size.width*0.14,color: Colors.white,),
      title: Text("Logout",style: TextStyle(color:Colors.white),),
      onTap: (){
        Navigator.pushNamed(context, "Sign In");
      },)],),
      ),


      body: Stack(children: [
        SfMaps(
          layers: <MapLayer>[
            MapTileLayer(
              zoomPanBehavior: _zoomPanBehavior,
              initialFocalLatLng: MapLatLng(37, 11),
              initialMarkersCount: _stations.length,
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              markerBuilder: (BuildContext context, int index) {
                return MapMarker(
                  latitude: _stations[index].latitude,
                  longitude: _stations[index].longitude,

                  child: IconButton(
                      onPressed: (){ StationDetails(_stations[index]);}, icon:Icon(Icons.flag_sharp,color: darkBlue,) ,
                       ),
                );
              },
              controller: _controller,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: Size.height * 0.03),
                  child: Builder(
                    builder: (context) {
                      return InkWell(
                          onTap: () {
                            Scaffold.of(context).openDrawer();

                          },
                         child:  Icon(
                            Icons.menu,
                            size: Size.height * 0.05,
                            color: darkBlue,
                          ));
                    }
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                      right: Size.width * 0.09, top: Size.height * 0.04),
                  child: Text(
                    "Select a Station",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Size.width * 0.07,
                        color: darkBlue),
                  ),
                ),
                Spacer(
                  flex: 1,
                )
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: Size.height * 0.1),
              child: Visibility(
                visible: isAdministrator = true
                ,
                child: Container(

                  width: Size.width*0.7,
                  height: Size.height*0.08,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:  MaterialStateProperty.resolveWith((states) => darkBlue.withOpacity(0.9)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)))
                    ),

                    onPressed: () async {
                      stationToAdd = (await AddStationDialog())!;
                      setState(() {
                        this.stationToAdd = stationToAdd;
                      });


                      _stations.add(stationToAdd);
                      _controller.insertMarker(_stations.length - 1);
                    },
                    child: Center(child: Text('Add Station')),
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
Future StationDetails(Station station)=> showDialog(context: context, builder: (context){return StatefulBuilder(builder: (contex,setState){ return  SingleChildScrollView(
  child:   Center( child :AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),

    backgroundColor: darkBlue.withOpacity(0.50),

    title: Row(
      mainAxisAlignment:MainAxisAlignment.spaceEvenly,

          children: [

            Text("Station information:",style: popUpText,),

            IconButton(onPressed: (){

              setState(() {
                station.isFavorite = !station.isFavorite ;


              // isAddedToFavorite = !isAddedToFavorite ;
               if (station.isFavorite == true ){




                 if (_isInFavoriteList(favoriteStation, station)== false ){

                    favoriteStation.add(station);
                 }
              }

                if (station.isFavorite == false ){




                  if (_isInFavoriteList(favoriteStation, station)== true ){

                    favoriteStation.remove(station);
                  }
                }




              });

            }, icon: Image.asset("assets/favorite.png",color: station.isFavorite ? darkBlue  : Colors.white)

            )],

        ),
   content: Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Padding(

          padding: const EdgeInsets.all(8.0),

          child: Text("Station Name : ${station.name}",style: popUpText),

        ),

        Padding(

          padding: const EdgeInsets.all(8.0),

          child: Text('Station latitude : ${station.latitude}  ',style: popUpText),

        ), // a automatiser

        Padding(

          padding: const EdgeInsets.all(8.0),

          child: Text("Station longitude : ${station.longitude} ",style: popUpText,),

        ), // a automatiser ( njibo les coordonée toul

        SizedBox(

          height:  MediaQuery.of(context).size.height * 0.1,

        ),

        Center(child: ElevatedButton(style: ButtonStyle(
            backgroundColor:  MaterialStateProperty.resolveWith((states) => darkBlue.withOpacity(0.9)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)))
        ),
            onPressed: (){ Navigator.pushNamed(context, "HomePage");}, child: Text("Show Details ", style: popUpText,))),

        Center(child: Container(
        
          child: ElevatedButton(
            style:ButtonStyle(backgroundColor:  MaterialStateProperty.resolveWith((states) => darkBlue.withOpacity(0.9)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)))),
            onPressed: cancel,child: Text("Cancel"),),
        ),)

      ],

    ),



  ),
));});});

  Future<Station?> AddStationDialog() => showDialog<Station>(
      context: context,
      builder: ( context){
        return StatefulBuilder(builder: (context,setState){return

     AlertDialog(
            backgroundColor: darkBlue.withOpacity(0.8),
            title: Text(
              "Add Station",
              style: popUpText,
            ),
            content: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Column(
                  children: [
                    TextField(
                      style: popUpText,

                      controller: _namecontroler,
                      decoration: InputDecoration(
                          hintText: "Station Name",
                          hintStyle: popUpText,
                          fillColor: Colors.white,
                          border: OutlineInputBorder()),
                    ),
                    TextField(
                      style: popUpText,

                      controller: _latitudecontroler,
                      decoration: InputDecoration(
                          hintText: "Station latitude",
                          hintStyle: popUpText,
                          fillColor: Colors.white,
                          border: OutlineInputBorder()),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: TextField(

                      style: popUpText,
                          controller: _longitudecontroler,
                          decoration: InputDecoration(
                            labelStyle: popUpText ,

                              hintText: "Station longitude  ",
                              hintStyle: popUpText,
                              border: OutlineInputBorder(   borderSide: BorderSide(color: Colors.white),borderRadius : const BorderRadius.all(Radius.circular(8.0)),),
                          )),
                    ),
                    TextField(
                      style: popUpText,

                      controller: _orgcontroler,
                      decoration: InputDecoration(
                          hintText: "Organization name",
                          hintStyle: popUpText,
                          fillColor: Colors.white,
                          border: OutlineInputBorder()),
                    ),
                    TextField(
                      style: popUpText,

                      controller: _bucketcontroler,
                      decoration: InputDecoration(
                          hintText: "Bucket name",
                          hintStyle: popUpText,
                          fillColor: Colors.white,
                          border: OutlineInputBorder()),
                    ),
                    TextField(
                      style: popUpText,

                      controller: _urlcontroler,
                      decoration: InputDecoration(
                          hintText: "URL",
                          hintStyle: popUpText,
                          fillColor: Colors.white,
                          border: OutlineInputBorder()),
                    ),
                    TextField(
                      style: popUpText,

                      controller: _tokencontroler,
                      decoration: InputDecoration(
                          hintText: "Token",
                          hintStyle: popUpText,
                          fillColor: Colors.white,
                          border: OutlineInputBorder()),
                    ),


                    MaterialButton(onPressed: () {})
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(onPressed: cancel, child: Text("Cancel",style: popUpText,)),
              TextButton(onPressed: submit, child: Text("submit",style: popUpText,)),

            ],);});});


  void submit() {
    Navigator.of(context).pop(Station(_namecontroler.text.toString(),double.parse(_latitudecontroler.text),
        double.parse(_longitudecontroler.text),_bucketcontroler.text.toString(),_tokencontroler.text.toString(),_urlcontroler.text.toString(),_orgcontroler.text.toString()));
    _namecontroler.clear();
    _latitudecontroler.clear();
    _longitudecontroler.clear();
    _bucketcontroler.clear();

    ;
  }

  void cancel() {
    Navigator.of(context).pop();
  }
}
bool _isInFavoriteList (List<Station> stationList,Station station ) {
  for (var stationInList in stationList) {
    if ( stationInList.isEqual(station)){
      return true ;
    }

  }
  return false ;


}


import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile_project/components/settings_tile.dart';
import 'package:mobile_project/styles/colors.dart';
import 'package:mobile_project/screens/manage_station.dart';

bool _lights = false;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: darkBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.03),
                      child: Builder(builder: (context) {
                        return InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Ionicons.arrow_back_outline,
                              size: size.height * 0.05,
                              color: Colors.white,
                            ));
                      }),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                          right: size.width * 0.09, top: size.height * 0.04),
                      child: Text(
                        "Settings",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.07,
                            color: Colors.white),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    )
                  ],
                ),
                /*ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('back'),
                  style: ElevatedButton.styleFrom(
                  primary: DarkBlue, // Background color
                  ),
                ),
                const Center(
                  child: Text(
                    "Settings",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),*/
                Divider(
                  color: PurpleLight,
                  height: 20,
                  thickness: 2,
                  indent: 5,
                  endIndent: 20,
                ),

                //<ion-icon name="location-outline"></ion-icon>

                const SizedBox(
                  height: 10,
                ),
                SettingsTile(
                  color: Colors.green,
                  icon: Ionicons.pencil_outline,
                  title: "Report Problem",
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPopupDialog(context),
                    );
                  },
                ),
                //<ion-icon name="settings-outline"></ion-icon>
                const SizedBox(
                  height: 10,
                ),
              /*  SettingsTile(
                  color: Color.fromARGB(255, 175, 76, 134),
                  icon: Ionicons.settings_outline,
                  title: "Manage station",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Managestation()),
                    );
                  },
                ),
                //<ion-icon name="reader-outline"></ion-icon>
                /*
                const SizedBox(
                  height: 10,
                ),

               */


                SettingsTile(
                  color: Color.fromARGB(255, 129, 76, 175),
                  icon: Ionicons.reader_outline,
                  title: "Feedback and suggestion",
                  onTap: () {},
                ),*/
                /*const SizedBox(
                  height: 40,
                ),
                SettingsTile(
                  color: Colors.black,
                  icon: Ionicons.moon_outline,
                  title: "Theme",
                  onTap: () {},
                ),*/
                /*const SizedBox(
                  height: 10,
                ),
                SettingsTile(
                  color: Colors.purple,
                  icon: Ionicons.language_outline,
                  title: "Language",
                  onTap: () {},
                ),*/
                //<ion-icon name="notifications-outline"></ion-icon>


                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.red,
                          ),
                          child: Icon(
                            Icons.notifications_outlined,
                            color: Colors.white,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          " Notification",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: PurpleLight,
                          ),
                        ),
                      ),
                      Spacer(),
                      Switch(
                          value: _lights,
                          onChanged: (bool value) {
                            setState(() {
                              _lights = value;
                            });
                          })
                    ],
                  ),
                ),
                /*SizedBox(
                  height: 50,
                ),
                SwitchListTile(
                  title: Row(
                    children: [
                      Text('notification',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),

                  value: _lights,
                  onChanged: (bool value) {
                    setState(() {
                      _lights = value;
                    });
                  },

                  //

                  secondary: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Ionicons.notifications_outline,
                        color: Colors.white, size: 27.0),
                    height: 50,
                    width: 50,
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      backgroundColor: PurpleLight,
      insetPadding: EdgeInsets.all(40),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0))),
      title: const Text('Feedback and Suggestion'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              fillColor: Colors.white.withOpacity(0.6),
              filled: true,
              labelText: 'Please add here',
              //icon: Icon(Icons.message),
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
            maxLines: 7,
          ),
        ],
      ),
      actions: <Widget>[
        new ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            primary: darkBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          //textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
        ElevatedButton(
          child: Text("Submit"),
          onPressed: () {
            // your code
            ;
          },
          style: ElevatedButton.styleFrom(
            primary: darkBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_project/styles/colors.dart';

bool forAndroid = false;

class Managestation extends StatelessWidget {
  const Managestation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue.withOpacity(0.8),
      appBar: AppBar(
        title: const Text('Manage station'),
        backgroundColor: darkBlue,
      ),
      resizeToAvoidBottomInset: false,
      body: MyCustomForm(),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class, which holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return SingleChildScrollView(

      child: Form(

        key: _formKey,
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Text(
              'select a station',
              style: TextStyle(
                fontSize: 20,

                color: PurpleLight,
              ),
            ),
            Container(

              height: 70,
              padding: EdgeInsets.only(left: 15, bottom: 20, right: 20, top: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  //icon: const Icon(Icons.person),
                    hintText: 'Enter the station name',
                    labelText: 'station',
                    filled: true,
                    fillColor: PurpleLight,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                      ), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    contentPadding: EdgeInsets.all(15.0),
                    suffixIcon: IconButton(
                      onPressed: () {
                        // method to show the search bar
                        showSearch(
                            context: context,
                            // delegate to customize the search bar
                            delegate: CustomSearchDelegate());
                      },
                      icon: const Icon(Icons.search),
                    )),
              ),
            ),
            SizedBox(
              height: 5, // <-- SEE HERE
            ),
            Text(
              'ON/OFF',
              style: TextStyle(
                fontSize: 20,
                color: PurpleLight,
              ),
            ),
            Switch(
              // thumb color (round icon)
              activeColor: Colors.purple,
              splashRadius: 50.0,
              // boolean variable value
              value: forAndroid,
              // changes the state of the switch
              onChanged: (value) => setState(() => forAndroid = value),
            ),
            Text(
              'change the station longitude',
              style: TextStyle(
                fontSize: 20,
                color: PurpleLight,
              ),
            ),
            Container(
              height: 70,
              padding: EdgeInsets.only(left: 15, bottom: 15, right: 20, top: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  //icon: const Icon(Icons.person),
                  hintText: 'Enter the station longitude',
                  labelText: 'station longitude',
                  filled: true,
                  fillColor: PurpleLight,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                    ), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  contentPadding: EdgeInsets.all(20.0),
                ),
              ),
            ),
            SizedBox(
              height: 2, // <-- SEE HERE
            ),
            Text(
              'change the station latitude',
              style: TextStyle(
                fontSize: 20,
                color: PurpleLight,
              ),
            ),
            Container(
              height: 70,
              padding: EdgeInsets.only(left: 15, bottom: 15, right: 20, top: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  //icon: const Icon(Icons.person),
                  hintText: 'Enter the station latitude',
                  labelText: 'station latitude',
                  filled: true,
                  fillColor: PurpleLight,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                    ), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  contentPadding: EdgeInsets.all(20.0),
                ),
              ),
            ),
            SizedBox(
              height: 2, // <-- SEE HERE
            ),
            Text(
              ' change Weather bucket station ',
              style: TextStyle(
                fontSize: 20,
                color: PurpleLight,
              ),
            ),
            Container(
              height: 70,
              padding: EdgeInsets.only(left: 15, bottom: 15, right: 20, top: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  //icon: const Icon(Icons.person),
                  hintText: 'Enter Weather bucket station',
                  labelText: ' weather bucket station',
                  filled: true,
                  fillColor: PurpleLight,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                    ), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  contentPadding: EdgeInsets.all(20.0),
                ),
              ),
            ),
            SizedBox(
              height: 2, // <-- SEE HERE
            ),
            Text(
              'change API token',
              style: TextStyle(
                fontSize: 20,
                color: PurpleLight,
              ),
            ),
            Container(
              height: 70,
              padding: EdgeInsets.only(left: 15, bottom: 15, right: 20, top: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  //icon: const Icon(Icons.person),
                  hintText: 'Enter API token',
                  labelText: 'API token',
                  filled: true,
                  fillColor: PurpleLight,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                    ), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  contentPadding: EdgeInsets.all(20.0),
                ),
              ),
            ),
            SizedBox(
              height: 2, // <-- SEE HERE
            ),
            Text(
              'Add URL',
              style: TextStyle(
                fontSize: 20,
                color: PurpleLight,
              ),
            ),
            Container(
              height: 70,
              padding: EdgeInsets.only(left: 15, bottom: 15, right: 20, top: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  //icon: const Icon(Icons.person),
                  hintText: 'Enter URL',
                  labelText: 'URL',
                  filled: true,
                  fillColor: PurpleLight,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                    ), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  contentPadding: EdgeInsets.all(20.0),
                ),
              ),
            ),
            SizedBox(
              height: 5, // <-- SEE HERE
            ),
            Row(
              mainAxisAlignment:
              MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment:
              CrossAxisAlignment.center, //Center Row contents vertically,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ;
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 75, 78, 165),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  //textColor: Theme.of(context).primaryColor,
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 15,
                      color: PurpleLight,
                    ),
                  ),
                ),
                Text(
                  'space',
                  style: TextStyle(
                    fontSize: 10,
                    color: darkBlue,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    ;
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 75, 78, 165),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  //textColor: Theme.of(context).primaryColor,
                  child: Text(
                    'save changes',
                    style: TextStyle(
                      fontSize: 15,
                      color: PurpleLight,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<String> searchTerms = [
    "station 1",
    "station 2",
    "station 3",
  ];

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          textColor: PurpleLight,
        );
      },
    );
  }
}

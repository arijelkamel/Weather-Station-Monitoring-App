import 'dart:developer';

import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class RainfallCard extends StatefulWidget {
  final String? rainFallValue;

  const RainfallCard({Key? key, required this.rainFallValue}) : super(key: key);

  @override
  State<RainfallCard> createState() => _RainfallCardState();
}

class _RainfallCardState extends State<RainfallCard> {
  late String rainData;

  @override
  void initState() {
    setState(() {
      rainData = widget.rainFallValue ?? "";
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.rainFallValue.toString());
    String cardName = "RAINFALL";
    String iconAsset = "assets/Blur.png";
    var size = MediaQuery.of(context).size;

    return Center(
      child: Card(
        shadowColor: Colors.indigoAccent.withOpacity(0.1),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.indigo.withOpacity(0.3), width: 0.5),
            borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        child: Container(
          width: size.width * 0.7,
          height: size.height * 0.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment(-1, 1),
                end: Alignment(1, -1),
                colors: [
                  darkBlue.withOpacity(0.95),
                  Color(0xFF111111).withOpacity(1)
                ],
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(1.0),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 8, bottom: 8),
                      child: Text(cardName,
                          style: TextStyle(
                            color: whiteWith_05_Opacity,
                            fontSize: size.width*0.03
                          )),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: size.width * 0.1,
                      height: size.height * 0.1,
                      child: Image.asset(
                        iconAsset,color: PurpleLight,
                        fit: BoxFit.fill,
                      )),
                  Column(
                    children: [
                      widget.rainFallValue != null
                          ? Text(
                              "${widget.rainFallValue!}mm",
                              style: TextStyle(
                                  fontSize: size.width*0.05,
                                  color: Colors.white),
                            )
                          : CircularProgressIndicator(),
                      ],
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

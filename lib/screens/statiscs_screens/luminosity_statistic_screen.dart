import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mobile_project/styles/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


enum WidgetMarker { daily, weekly, monthly }

class LuminosityStatistics extends StatefulWidget {

  @override
  State<LuminosityStatistics> createState() => _LuminosityStatisticsState();
}

class _LuminosityStatisticsState extends State<LuminosityStatistics> {
  late List<List<String>>  pressureListCoupleTimeValue ;
  @override
  void initState() {
    // temperatureListCoupleTimeValue = ModalRoute.of(context)?.settings.arguments as List<List<String>>;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final  temperatureListCoupleTimeValue = ModalRoute.of(context)?.settings.arguments as List<List<String>>;
    log(temperatureListCoupleTimeValue.toString());

    return
       Scaffold(
         backgroundColor: darkBlue,

        body: Center(child: BodyWidget(day: temperatureListCoupleTimeValue[0],data: temperatureListCoupleTimeValue[1],)),
      )
    ;
  }
}

class BodyWidget extends StatefulWidget {
  final List<String> day ;
  final List<String> data;
  const BodyWidget({super.key,required this.day,required this.data});



  @override
  State<StatefulWidget> createState() => BodyWidgetState();
}

class BodyWidgetState extends State<BodyWidget> {
  late ZoomPanBehavior _zoomPanBehavior;
  late TooltipBehavior _tooltipBehavior;


  List<String> timeStrings = [];

  List<double> valueDouble = [
    1.0,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
  ];




  List day = [
    "8:00",
    "10:00",
    "12:00",
    "14:00",
    "16:00",
    "18:00",
    "20:00",
    "22:00",
    "00:00",
    /*
  "10/01",
  "11/01",
  "12/01",
  "13/01",
  "14/01",
  "15/01",
  "16/01",
  "17/01",
  "18/01",
  "19/01",
  "20/01"*/
  ];
  // List<List<String>>  temperatureListCoupleTimeValue;
  /* List<double> temp = [
    18.5,
    19,
    19.4,
    19.6,
    19.9,
    20,
    22,
    12.5,
    17.8,
    /*
  19.6,
  15.6,
  14.5,
  19.8,
  17.8,
  16.5,
  17.6,
  17.8,
  24.5,
  35,
  37*/
  ];
*/
  @override
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(enablePanning: true);
    _tooltipBehavior = TooltipBehavior(enable: true);
    // temperatureListCoupleTimeValue = ModalRoute.of(context)?.settings.arguments as List<List<String>>;

    super.initState();
  }

  WidgetMarker selectedWidgetMarker = WidgetMarker.daily;

  Widget getGraphWidget() {
    timeStrings= widget.day;

    valueDouble= dataDouble(widget.data) ;

    List<Data> pointList = listData(timeStrings, valueDouble);
    log(pointList.toString());


    return Column(




      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back,color: Colors.white,size: 40, )),
            Spacer(),

            Text("Luminosity Lx",style: TextStyle(color: Colors.white , fontSize: 30),),
            Spacer(),
          ],
        ),
        SizedBox(height:50,),
        Center(
          child: SfCartesianChart(



              plotAreaBorderWidth: 5,
              plotAreaBorderColor: Colors.white,
              plotAreaBackgroundColor: Colors.transparent,



              margin: EdgeInsets.all(20),
              backgroundColor: Colors.transparent,

              primaryXAxis: CategoryAxis(visibleMinimum: 30, ),
              primaryYAxis: NumericAxis(),
              tooltipBehavior: _tooltipBehavior,
              zoomPanBehavior: _zoomPanBehavior,
              series: <ChartSeries<Data, String>>[
                LineSeries<Data, String>(color: Colors.purpleAccent,width: 5,

                    opacity: 0.9,

                    dataSource:  pointList,


                    xValueMapper: (Data, index) => Data.time ,
                    yValueMapper: (Data, index) => Data.value)
              ]),
        ),
      ],
    );

  }

  Widget getStatsWidget() {
    return Container(
      height: 300,
      color: Colors.green,
    );
  }

  Widget getInfoWidget() {
    return Container(
      height: 500,
      color: Colors.blue,
    );
  }

  Widget getCustomContainer() {
    switch (selectedWidgetMarker) {
      case WidgetMarker.daily:
        return getGraphWidget();
      case WidgetMarker.weekly:
        return getStatsWidget();
      case WidgetMarker.monthly:
        return getInfoWidget();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  selectedWidgetMarker = WidgetMarker.daily;
                });
              },
              child: const Text("Daily", style: TextStyle(color: Colors.black12),),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  selectedWidgetMarker = WidgetMarker.weekly;
                });
              },
              child: const Text("Weekly", style: TextStyle(color: Colors.black12),),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  selectedWidgetMarker = WidgetMarker.monthly;
                });
              },
              child: const Text("Monthly", style: TextStyle(color: Colors.black12),),
            ),
          ],
        ),
        Center(
          child: Center(
            child: getCustomContainer(),
          ),
        )
      ],
    );
  }
  List<Data> listData(List<String> time, List<double> value) {
    List<Data> dataList = [];
    for (int i = 0; i < time.length; i++) {
      dataList.add(Data(time[i], value[i]));
    }

    return dataList;
  }
}




class Data {
  Data(this.time, this.value);

  final String time;
  final double value;
}

List<double> dataDouble( List<String> L){
  List<double> doubleData = [];

  for ( String i in L){

    doubleData.add(double.parse(i));
  }

  return doubleData ;
}


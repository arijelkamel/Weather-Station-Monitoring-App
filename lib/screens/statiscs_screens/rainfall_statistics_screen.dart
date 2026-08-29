import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mobile_project/styles/colors.dart';
import 'package:mobile_project/styles/text_styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

enum WidgetMarker { daily, weekly, monthly }

class RainFallStatistics extends StatefulWidget {

  @override
  State<RainFallStatistics> createState() => _RainFallStatisticsState();
}

class _RainFallStatisticsState extends State<RainFallStatistics> {




  late List<List<String>>  temperatureListCoupleTimeValue ;
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
        backgroundColor :darkBlue,

        body: Center(child: Container(child: BodyWidget(day: temperatureListCoupleTimeValue[0],data: temperatureListCoupleTimeValue[1],))),

      );
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






  late ZoomPanBehavior _zoomPanBehavior;
  late TooltipBehavior _tooltipBehavior;

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


    return  Column(




      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back,color: Colors.white,size: 40, )),
            Spacer(),

            Text("RainFall",style: TextStyle(color: Colors.white , fontSize: 30),),
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
              primaryYAxis: NumericAxis(minimum: 0, maximum: 50),
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
    return Center(child: Text('''
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    this feature is not been released yet 
    
    
    
    
    
                   Coming Soon..'''));

  }

  Widget getInfoWidget() {
    return Center(child: Text('''
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    this feature is not been released yet 
    
    
    
    
    
                   Coming Soon..'''));
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
              child: Text("Daily", style: TextStyle(color: Colors.black12),),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  selectedWidgetMarker = WidgetMarker.weekly;
                });
              },
              child: Text("Weekly", style: TextStyle(color: Colors.black12),),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  selectedWidgetMarker = WidgetMarker.monthly;
                });
              },
              child: Text("Monthly", style: TextStyle(color: Colors.black12),),
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
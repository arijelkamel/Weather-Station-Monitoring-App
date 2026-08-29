import 'package:influxdb_client/api.dart';
import 'package:mobile_project/styles/variables.dart';

class RainFallController {
  Future<String> lastValueRainFall() async {

    var client = InfluxDBClient(
      url: 'http://52.51.92.31:8086',
      token:
      'hChb_sDWSnXG7zoLU6l-GbyMUdWmIkSsZYrGjfb9UK-INuKOv6FsTI0bcE7yEMixMJeuBugLku9uGT_kQFzxiA==',
      org: 'SWALP',
      bucket: 'Weather_Station_Bucket',
    );

    var queryService = client.getQueryService();

    var recordStream = await queryService.query('''
  from(bucket: "Weather_Station_Bucket")
  |> range(start:0)
  |> filter(fn: (r) => r["_measurement"] == "device_frmpayload_data_barometer_4")
  |> sort(columns: ["time"], desc: true)
  |> last()
  |> aggregateWindow(every: 1m, fn: mean, createEmpty: false)
  |> yield(name: "mean")
  ''');


    var rainfall = await recordStream.last.then((value) => value["_value"].toString());

    client.close();
    return rainfall;
  }

  Future<List<List<String>>> getListOfCoupleTimeValues() async {


    var client = InfluxDBClient(
      url: 'http://52.51.92.31:8086',
      token:
      'hChb_sDWSnXG7zoLU6l-GbyMUdWmIkSsZYrGjfb9UK-INuKOv6FsTI0bcE7yEMixMJeuBugLku9uGT_kQFzxiA==',
      org: 'SWALP',
      bucket: 'Weather_Station_Bucket',
    );
    var queryService = client.getQueryService();

    var rawCSV = await queryService.queryRaw('''
         from(bucket: "Weather_Station_Bucket")
|> range(start:0)
|> filter(fn: (r) => r["_measurement"] == "device_frmpayload_data_analoginput_0")
|> sort(columns: ["time"], desc: true)
|> aggregateWindow(every: 1m, fn: mean, createEmpty: false)
|> map(fn: (r) => ({_time: r._time, _value: r._value}))
     ''');

    List<String> strippedString = rawCSV.split(",");
    List<String> timeValues = [];
    List<String> values = [];
    int p = 7;
    for (int i = 0; i < strippedString.length; i++) {
      if (i == p) {
        p = p + 4;
        timeValues.add(strippedString[i]);
      }
      if (i % 4 == 0) {
        if (strippedString[i] != '') {
          values.add(strippedString[i].replaceAll(RegExp(r"\s+"), ""));
        }
      }
    }

    values = values.sublist(1, values.length);

    client.close();
    return [timeValues, values];
  }
}
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; // location name for UI
  String time = ""; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDaytime = false; // true or false if daytime or not

  WorldTime({ required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    print(url);
    try{
      Response response = await get(
          Uri.https('worldtimeapi.org', '/api/timezone/$url'));
      print(response.statusCode);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        String datatime = data['datetime'];
        String offset = data['utc_offset'].substring(1, 3);
        DateTime now = DateTime.parse(datatime);
        now = now.add(Duration(hours: int.parse(offset)));
        // set time
        isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
        time = DateFormat.jm().format(now);
      }

    }
    catch(e){
      print("Catch exception: $e");
      time = "loading failed!";
    }

  }
}
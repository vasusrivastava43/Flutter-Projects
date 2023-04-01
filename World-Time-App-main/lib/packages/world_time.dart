import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:intl/intl.dart';
class Worldtime {
  String time = '';
  String url = '';
  String flag = '';
  String location = '';

  Worldtime({required this.flag, required this.location, required this.url});


  Future<void> getTime() async{
  //make the request
    try{
  final response=await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
  Map data=json.decode(response.body);
  //print(data);

  //get properties from data
  String datetime=data['datetime'];
  String offset=data['utc_offset'].substring(1,3);
  // print(datetime);
  // print(offset);
  DateTime now=DateTime.parse(datetime);
  //print(now);
  now=now.add(Duration(hours: int.parse(offset)));
  //print(now);
  //print(now);
  time=DateFormat.jm().format(now);
  // time=now;
  }
    catch(e){
      print('caught an error $e');
      time='could not get time data';
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_4_world_time/packages/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time='loading';
  Future<void> setuptime() async{
    Worldtime instance = Worldtime(flag: 'germeny.png', location: 'Berlin', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments:{
    'location':instance.location,
    'time':instance.time,
    'flag':instance.flag,});
  }
  void initState(){
    super.initState();
      setuptime().then((_) => print('hi'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:SpinKitCircle(
          color: Colors.black,
          size: 80,
        ),
      ),


    );
  }
}

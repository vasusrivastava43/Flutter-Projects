import 'package:flutter/material.dart';
import 'package:flutter_4_world_time/packages/world_time.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Map data={};

  @override

  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    // print('hello');
    // print(data['location']);
    // String loc=data['location'];
    // String tym=data['time'];
    // String flg=data['flag'];
    // print(loc);
    // print (data.location.runtimeType);
    // print (data.time.runtimeType);
    // print (data.flag.runtimeType);
    return Scaffold(
      body: SafeArea(
        child:Padding(padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
          children: [
            FlatButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context,'/choose_location');
                },
                icon:Icon(Icons.add_location),
                label:Text('Choose location')),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data['location'],
                      style: TextStyle(
                        fontSize: 28,
                      )
                ),

              ],
            ),
            SizedBox(height: 20.0,),
            Text(data['time'] ,
                style:TextStyle(
                  fontSize: 100,
                ))
          ],
        ),
      ),
      )
    );
  }
}

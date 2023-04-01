import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_4_world_time/packages/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<Worldtime> Locations=[
    Worldtime(flag: 'uk.png', location: 'London', url: 'Europe/London'),
    Worldtime(flag: 'uk.png', location: 'Berlin', url: 'Europe/Berlin'),
    Worldtime(flag: 'usa.png', location: 'New_York', url: 'America/New_York'),
    Worldtime(flag: 'usa.png', location: 'Cicago', url: 'America/Cicago'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: Locations.length,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                onTap: (){

                },
                title: Text(Locations[index].location),
              ),
            );
        },
      )
    );
  }
}

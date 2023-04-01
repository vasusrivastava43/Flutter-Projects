import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget { //stateless :state of the widget cannot change over time.

  @override
  Widget build(BuildContext context) {
    return Scaffold( //Scafflod widget is a wrapper to few layout widgets .Widgets have different properties and properties have widgets as value ,and sometime we have propertes in that widget.
      appBar : AppBar( //property starts with small letter and widget starts with capital letter.
        title: Text('My first app'),
        centerTitle: true,
        backgroundColor: Colors.orange[600],
      ),
      // body: Center(
      //   // child: Text(
      //   //   'Hello World',
      //   //   style:TextStyle(
      //   //     fontSize: 20,
      //   //     fontWeight: FontWeight.bold,
      //   //     color: Colors.orange[600],
      //   //     fontFamily:'BIZ',//to add font first dwnld it then go to pubspec in font section add it and give fontfamily name then use that name in here.
      //   //   ) ,
      //   // ),
      //
      //   /*******adding image*********/
      //
      //   //child: Image(    //we can use two types of image network or asset image
      //     // image: NetworkImage('https://pbs.twimg.com/profile_images/1366808543773384704/8qFXRmFc_400x400.png'),
      //
      //     // image: AssetImage('Assets/Screenshot (4).png'),  //way to add local image first need to  update it in pubsec
      //      /**can also add image as**/
      //   //child: Image.asset('Assets/Screenshot (3)'),
      //   //child: Image.network('https://pbs.twimg.com/profile_images/1366808543773384704/8qFXRmFc_400x400.png'),
      //
      //   /****ICONS*******/
      //   // child: Icon(
      //   //   Icons.airport_shuttle,
      //   //   color: Colors.red,
      //   //   size: 100.0,
      //   // )
      //
      //   /*******BUTTONS*****/
      //   // child: RaisedButton( //can use different types of button eg FlatButton.
      //   //   onPressed: (){},
      //   //   child: Text(
      //   //       'Click' ,
      //   //       style: TextStyle(
      //   //       color: Colors.white,
      //   //       )
      //   //   ),
      //   //   color: Colors.orange[600],
      //   // )
      //
      //   /******ADDING ICON INSIDE THE BUTTON**********/
      //   // child: RaisedButton.icon(
      //   //   onPressed: (){},
      //   //   icon: Icon(
      //   //     Icons.mail,
      //   //     color: Colors.white,
      //   //   ),
      //   //   label: Text('Mail me'),
      //   //   color: Colors.orange[600],
      //   // )
      //   /******ICON BUTTON********/
      //   child: IconButton(
      //     onPressed: (){print('you clicked me');},
      //     icon: Icon(
      //       Icons.alternate_email,
      //       color: Colors.orange[600],
      //     ),
      //   ),
      //),


      /********CONTAINER WIDGET***********/
      // body: Container(
      //   padding:EdgeInsets.all(60) ,   //It is the space inside the container.
      //   margin: EdgeInsets.all(120),    //it is the space around the container.
      //   color: Colors.grey[600],
      //   child: Text('click'),
      // ),

      /********ROW*************/
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(             //we can add column into row and row into column
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.access_alarm,
              color:Colors.orange[60]),
              FlatButton(onPressed: (){}, child: Text('hEY'))
            ],
          ),
          Text('click'),
          FlatButton(
              onPressed: (){},
              child: Text('clickme',
              style: TextStyle(
                fontSize: 30,
                color:Colors.white,
              ),
              ),
              color: Colors.orange[600],
          ),
          Container(
            padding: EdgeInsets.all(40),
            color: Colors.red,
            child:Text('vasu') ,
          )
        ],
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Text('click'),
        backgroundColor: Colors.orange[600],
      ),
    );
  }
}
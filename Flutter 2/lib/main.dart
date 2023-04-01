import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int rank =0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('ID'),
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            rank+=1;
          }
          );
        },
        child: Icon(Icons.add,),
        backgroundColor: Colors.grey[850],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30,40,30, 0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('Assets/Machine Runtime.png'),
                radius: 40,
              ),
            ),
            Divider(height: 50,
            color: Colors.grey[400],
            ),
            Text('Name',
            style: TextStyle(
              color: Colors.grey,
            ),
            ),
            SizedBox(height: 10,),
            Text('Vasu',
            style: TextStyle(
              color: Colors.amberAccent,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 30,),
            Text('Rank',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10,),
            Text('$rank',
              style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Icon(Icons.email,
                color: Colors.grey[400],),
                SizedBox(width:10),
                Text('vasusrivastava816@gmail.com',
                style: TextStyle(
                  color: Colors.grey[400],
                  letterSpacing: 1.0,
                )
                  ,)
              ],
            )
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'quoteLiist.dart';
class addQuote extends StatefulWidget {
  const addQuote({Key? key}) : super(key: key);

  @override
  State<addQuote> createState() => _addQuoteState();
}

class _addQuoteState extends State<addQuote> {
  final TextEditingController quote = TextEditingController();
  final TextEditingController author= TextEditingController();

  addData(String au,String wr){
    Map<String,dynamic> demoData={"text":au,"author":wr};
    CollectionReference collectionReference=FirebaseFirestore.instance.collection('v43');
    collectionReference.add(demoData);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Quote'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top:170,left: 35,right: 35),
            child: TextField(
              controller: quote,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                hintText:'Quote'
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0,left: 35,right: 35),
            child: TextField(
              controller: author,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  hintText: 'Author'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child:RaisedButton(
              onPressed: (){
                  Navigator.pop(context, quoteList(text: quote.text, author: author.text));
                  addData(quote.text,author.text);
              },
              color: Colors.red,
              child: Text('Save',
              style:TextStyle(
                color: Colors.white,
                fontSize: 18
                )
              ),
            )

          )
        ],
      ),
    );
  }
}
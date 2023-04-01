

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quoteLiist.dart';
import 'quote_card.dart';
import 'addquote.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context)=>Quote(),
      'add':(context)=>addQuote()
    },
  ));
}
  class Quote extends StatefulWidget {
  @override
  State<Quote> createState() => _QuoteState();
  }

  class _QuoteState extends State<Quote> {
    // List<String> quote1=['fjhgfhdfkhdfhff','sdffaffefqwefw','dweaefdsfaefaf'];
    List<quoteList> quote1=[];//=[quoteList(text: 'Be so busy improving your self that you have no time to criticize others.', author: 'Chetan Bhagat'),
    //   quoteList(text: 'The only way to learn a new programming language is by writing programs in it.', author: 'Dennis Ritchie'),
    //   quoteList(text: ''"Don't write better error messages , write code that doesn't need them."'', author: 'Jason C. McDonald')];
    deleteData(int index)async{
      CollectionReference collectionReference=FirebaseFirestore.instance.collection('v43');
      QuerySnapshot querySnapshot= await collectionReference.get();
      querySnapshot.docs[index].reference.delete();
    }
    fetchData()async{
      CollectionReference collectionReference=FirebaseFirestore.instance.collection('v43');
      var querySnapshot=await collectionReference.get();
      for(var queryDocumentSnapshot in querySnapshot.docs){
        //print(queryDocumentSnapshot.data());
        final d = queryDocumentSnapshot.data() as Map<String,dynamic> ;
        // print(d);
        var text1 =d['text'];
        var author1=d['author'];
        // print(text1 );
        // print(author1);
        final result=quoteList(text: text1, author: author1);
        quote1.add(result);
      }
    }
  void initState(){
    super.initState();
    fetchData().then((_) => print('hi'));
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey[400],
    appBar: AppBar(
      title: Text('QUOTES'),
      centerTitle: true,
      backgroundColor: Colors.red,
    ),
    body: ListView.builder(
        itemCount: quote1.length,
        itemBuilder: (context,index){
          return quoteCard(quotelist:quote1[index] , delete: (){
            setState(() {
              /*quoteList deletedItem=*/quote1.removeAt(index);
              deleteData(index);
              // final snackBar = SnackBar(
              //   content: const Text('Quote Deleted'),
              //   action: SnackBarAction(label: 'Undo',
              //       onPressed: () => setState(() => quote1.insert(index, deletedItem),)
              //     ),
              //  );
              //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                 }
            );
          }
          );
          } ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.red,
      child: Icon(Icons.add),
      onPressed: () async{
        final result = await Navigator.pushNamed(context,'add') as quoteList;
        setState(() {
          quote1.add(result);
        });
      },
    ),
  );
  }
}


class quoteList{
  String text;
  String author;
  quoteList({required this.text,required this.author});

  Map<String,dynamic>toMap(){
    var map=Map<String,dynamic>();
    map['quote']=text;
    map['author']=author;
    return map;
  }
}


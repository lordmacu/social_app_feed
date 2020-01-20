import 'package:flutter/material.dart';
import 'model/book.dart';
import 'verse.dart';
class ChapterView extends StatefulWidget{
  int id=0;
  String name="";
  ChapterView(this.id,this.name);
  @override
  _ChapterState createState() => new _ChapterState(this.id,this.name);
}

class _ChapterState extends State<ChapterView>{

int id=0;
String name="";

_ChapterState(this.id,this.name);

List  productList=[];


Future openVerse(idChapter,name) async {
  await Navigator.of(context).push(new MaterialPageRoute<int>(
      builder: (BuildContext context) {
        return VerseView(idChapter,name,id);
      },
      maintainState: true,
      fullscreenDialog: false));
}

Future getChaptersByBooks() async{


   var productListtemp = await Verse().select(columnsToSelect: ["chapter"]).groupBy("chapter").where("book_id = $id").toList();

   setState(() {
     productList=productListtemp;
   });

}

@override
  void initState() {
    // TODO: implement initState
    super.initState();


    getChaptersByBooks();
  }

@override
Widget build(BuildContext context) {
  // TODO: implement build
  return Scaffold(
    appBar: AppBar(
      brightness: Brightness.dark, // status bar brightness

      centerTitle: false,
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text("Libro de ${name}",style: TextStyle(color: Colors.black),textAlign: TextAlign.left,),
      leading:InkWell(
        onTap: (){
          Navigator.pop(context);

        },
        child:  Container(
          child: Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
      ),
      actions: <Widget>[

      ],
    ),
    body:  GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 4,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(productList.length, (index) {
        return InkWell(
          onTap: (){
            openVerse(productList[index].chapter,name);
          },
          child: Center(
            child: Text(
              '${productList[index].chapter}',
              style: Theme.of(context).textTheme.headline,
            ),
          ),
        );
      }),
    ),
  );
}

}
import 'package:flutter/material.dart';

 import 'model/book.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';
import 'package:sqfentity/sqfentity.dart';
import 'chapter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'global.dart' as global;

class Biblie extends StatefulWidget{
  @override
  _BiblieState createState() => new _BiblieState();
}

class _BiblieState extends State<Biblie>{


  int isAlphabeticOrder=1;

 List productList=[];

  Future getBooksByDefault() async{


    var productListTemp = await Book().select().toList();
    setState(() {
      productList= productListTemp;
    });
    print("este es el select de books ${productList[0].name}");
  }

  getPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   
    if(prefs.getBool("isNight")){
      global.isNight=prefs.getBool("isNight");
    }

    if(prefs.getBool("fontSize")){
      global.fontSize=prefs.getDouble("fontSize");
    }


  }

 Future getBooksByOrder() async{
   var productListTemp;
   if(isAlphabeticOrder==1){
      isAlphabeticOrder=2;
      productListTemp =  await Book().select().orderBy("name").toList();
   }else if(isAlphabeticOrder==2){
     isAlphabeticOrder=3;
     productListTemp =  await Book().select().orderByDesc("name").toList();
   }else if(isAlphabeticOrder==3){
     isAlphabeticOrder=1;
     productListTemp =  await Book().select().orderBy("id").toList();
   }

   setState(() {
     productList= productListTemp;
   });

 }


  Future openChapter(id,name) async {
    await Navigator.of(context).push(new MaterialPageRoute<int>(
        builder: (BuildContext context) {
          return ChapterView(id,name);
        },
        maintainState: true,
        fullscreenDialog: false));
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // createModelFromDatabaseSample();
    getBooksByDefault();

  }

  Widget orderFont(){
    if(isAlphabeticOrder ==2){
     return  Container(
        padding: EdgeInsets.only(right: 10),
        child: Row(
          children: <Widget>[
            Icon(Icons.filter_list,color: Colors.black,),
            Icon(Icons.arrow_downward,color: Colors.black,)
          ],
        ),
      );
    }else
    if(isAlphabeticOrder ==1) {
      return Container(
        padding: EdgeInsets.only(right: 10),
        child: Icon(Icons.filter_list, color: Colors.black,),
      );
    }else{
      return  Container(
        padding: EdgeInsets.only(right: 10),
        child: Row(
          children: <Widget>[
            Icon(Icons.filter_list,color: Colors.black,),
            Icon(Icons.arrow_upward,color: Colors.black,)
          ],
        ),
      );
    }
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
          title: Text("Libros de la Biblia",style: TextStyle(color: Colors.black),textAlign: TextAlign.left,),
          leading:InkWell(
            onTap: (){
              Navigator.pop(context);

            },
            child:  Container(
              child: Icon(Icons.arrow_back_ios,color: Colors.black,),
            ),
          ),
          actions: <Widget>[
            InkWell(
              onTap: (){
                getBooksByOrder();
              },
              child: Container(
                padding: EdgeInsets.only(top: 15,right: 5),
                child: Stack(
                  children: <Widget>[
                    orderFont()
                  ],
                ),
              ),
            )
          ],
        ),
      body:  ListView.builder(
          itemCount: productList.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return ListTile(
              onTap: (){
                openChapter(productList[index].id,productList[index].name);
              },
              title: Text("${productList[index].name}",style: TextStyle(fontSize: 20),),
            );
          }),
    );
  }

}
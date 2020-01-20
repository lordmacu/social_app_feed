import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class VersiclePost extends StatefulWidget{

  String text="";

  int verse=0;
  int chapter=0;
  int book=0;
  String name="";
  VersiclePost(this.text,this.verse,this.chapter,this.book,this.name);
  @override
  _VersiclePostState createState() => new _VersiclePostState(this.text,this.verse,this.chapter,this.book,this.name);
}



class _VersiclePostState extends State<VersiclePost>{


  String text="";

  int verse=0;
  int chapter=0;
  int book=0;
  String name="";

  _VersiclePostState(this.text,this.verse,this.chapter,this.book,this.name);

  List<Widget> buildComments( ){
    List<Widget> comments=[];
    for(var i =0 ; i<10;i++){
      comments.add( Container(
        padding: EdgeInsets.all(10),
        child:Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: Image.asset("assets/icon.png",width: 40,),
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                width: 300,
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("nombre",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),),
                    Text("Este es un mensaje y puede que sea largo o corto o lo que sea",style: TextStyle(
                        fontSize: 13,
                        color: Colors.black38
                    ),)
                  ],
                ),
              ),
            )
          ],
        ),
      ));
    }

    return comments;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("${name} ${chapter}:${verse}",style: TextStyle(color: Colors.black),textAlign: TextAlign.left,),
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Card(
                child: Column(
                  children: <Widget>[

                    Container(
                      padding: EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
                      width: double.infinity,
                      child:  Text(text,style: TextStyle(fontSize: 20),),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: (){
                              print("sss");
                            },
                            child: Container(
                              child: Row(children: <Widget>[

                                Icon(EvaIcons.heartOutline,color: Colors.black38,),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text("Me Gusta"),
                                )
                              ],),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15,right: 15,bottom: 10,top: 20),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Image.asset("assets/icon.png",width: 40,),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        height: 30,
                        child: TextField(
                          decoration: new InputDecoration.collapsed(

                              hintText: "Agregar Comentario"),
                        ),
                      ),
                    ),
                    Container(
                      child: Icon(Icons.send),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Card(

                  child: Container(
                    padding: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Row(
                            children: <Widget>[
                              Text("Comentarios",style: TextStyle(fontSize: 20),)
                            ],
                          ),
                        ),
                        Column(
                          children: buildComments(),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),

        ),
      ),
    );
  }

}
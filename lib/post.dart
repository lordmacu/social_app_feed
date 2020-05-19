import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class Post extends StatefulWidget{
  @override
  _PostState createState() => new _PostState();
}



class _PostState extends State<Post>{

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
        title: Text("Noticias",style: TextStyle(color: Colors.black),textAlign: TextAlign.left,),
        leading:InkWell(
          onTap: (){
            Navigator.pop(context);

          },
          child:  Container(
            child: Icon(Icons.arrow_back_ios,color: Colors.black,),
          ),
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.search,color: Colors.black,),
          )
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
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                child: Image.asset("assets/icon.png",width: 40,),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text("nombre",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    ),),
                                    Text("Presidente de jóvenes",style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black38
                                    ),)
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child:  Image.asset("assets/full.jpeg",fit: BoxFit.cover,),
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
                  elevation: 0,

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
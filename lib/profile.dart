import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'post.dart';
class Profile extends StatefulWidget{
  @override
  _ProfileState createState() => new _ProfileState();
}

class _ProfileState extends State<Profile>{

  List<String> litems = ["1","2","Third","4"];

  Future openPost() async {
    await Navigator.of(context).push(new MaterialPageRoute<int>(
        builder: (BuildContext context) {
          return Post();
        },
        maintainState: true,
        fullscreenDialog: false));
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
        title: Text("Perfil de Cristian",style: TextStyle(color: Colors.black),textAlign: TextAlign.left,),
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
      body: Column(
        children: <Widget>[

          Card(
            child: Container(
              padding: EdgeInsets.only(left: 15,right: 15,bottom: 10,top: 15),
              child:  Row(
                children: <Widget>[
                  Container(
                    child: Image.asset("assets/icon.png",width: 80,),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(

                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: Text("nombre que puede ser muy largo",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                                ),
                              )
                            ],
                          ),
                          width: 200,
                        ),
                        Text("Presidente de jóvenes",style: TextStyle(
                            fontSize: 13,
                            color: Colors.black38
                        ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              RaisedButton(

                                shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0)),
                                child: Text("Enviar Mensaje",style: TextStyle(color: Colors.white),),
                                onPressed: (){

                                },
                                color: Color(0xff3498db),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
              child: ListView.builder
                (
                  itemCount: litems.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Column(
                      children: <Widget>[

                        Container(
                          child: Column(
                            children: <Widget>[

                              GestureDetector(

                                child: Container(
                                  width: double.infinity,
                                  child:  Image.asset("assets/full.jpeg",fit: BoxFit.cover,),
                                ),
                                onTap: (){
                                  openPost();
                                },
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
                                        child: Icon(EvaIcons.heartOutline,color: Colors.black38,),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        print("aqui mano");
                                      },
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Icon(EvaIcons.messageCircleOutline,color: Colors.black38,),
                                            Container(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Text("Comentar",style: TextStyle(color: Colors.black38,),),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6.0,
                                    spreadRadius: 0.4,
                                    offset: Offset(0.5, 0.5)),
                              ],
                              color: Colors.white),
                        )
                      ],
                    );
                  }
              ),
            ),
          )
        ],
      ),
    );
  }

}
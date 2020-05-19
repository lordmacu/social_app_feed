import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
class Messages extends StatefulWidget{

  @override
  State createState() => new Messagesstate();
}

class Messagesstate extends State<Messages> {
  List<int> flatColors = [0xff2ecc71, 0xfff39c12, 0xff3498db, 0xff9b59b6,0xffe67e22,0xffe74c3c];
  List<String> temas = ["Administración", "Visitas", "Pagos", "Vigilacia","Parqueadero","Aseo"];
  int messagesCount=5;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(

      children: <Widget>[
        Container(
          height: 6,
          width: 50,
          child: null,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Mensajes",style: TextStyle(
                  fontSize: 20 ,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent
              ),),
              RaisedButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                ),
                onPressed: (){

                },
                child: Text("Cerrar",style: TextStyle(color: Colors.blueAccent),),
              )
            ],
          ),
        ),

        messagesCount==0 ? Container(
          padding: EdgeInsets.only(top: 50,bottom: 50),
          child: Column(
            children: <Widget>[
              Container(

                child: Text("Aún no tienes mensajes"),
                margin: EdgeInsets.only(bottom: 10),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ),
                color: Colors.blueAccent,
                onPressed: (){

                },
                child: Text("Enviar Mensaje",style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ) : Container(),
        messagesCount>0 ? Expanded(
          child:  ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: messagesCount,
              itemBuilder:
                  (BuildContext ctxt, int index) {
                return  Container(

                  child: Card(
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.only(left: 15,right: 15,top: 5),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: Image.asset(
                                        "assets/icon.png",
                                        width: 40,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Cristian Camilo Garcia",
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            "Administrador",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black38),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          onTap: () {

                          },
                        ),
                        Container(

                          child: Text("Este es un texto y puede ser muy largo o aunqeu tambien puede ser contigo"),
                          padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        )
                      ],

                    ),
                  ),
                  margin: EdgeInsets.only(bottom: 15,left: 5,right: 5,top: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  padding: EdgeInsets.only(
                      top: 5,
                    left: 10,
                    right: 10
                  ),

                );
              }),
        ) :  Container()

      ],
    );
  }

}
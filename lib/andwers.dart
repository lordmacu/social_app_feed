import 'package:flutter/material.dart';

class AnsWers extends StatefulWidget{

  @override
  State createState() => new AnsWerstate();
}

class AnsWerstate extends State<AnsWers> {
  List<int> flatColors = [0xff2ecc71, 0xfff39c12, 0xff3498db, 0xff9b59b6,0xffe67e22,0xffe74c3c];
  List<String> temas = ["Administración", "Visitas", "Pagos", "Vigilacia","Parqueadero","Aseo"];

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
              Text("Pregúntas y Respuestas",style: TextStyle(
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
                child: Text("Cerrar"),
              )
            ],
          ),
        ),
        Container(
          height: 150,
          margin: EdgeInsets.only(bottom: 10),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder:
                  (BuildContext ctxt, int index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color:Color(flatColors[index]),
                  ),
                  margin: EdgeInsets.only(
                      right: 15,
                      left: index == 0 ? 15 : 0),
                  child: Stack(
                    children: <Widget>[

                      Container(
                          height: 160,
                          width: 130,
                          child: Stack(
                            children: <Widget>[
                              Align(
                                child: Container(


                                  child: Text(

                                    "Como puedo pagar la Administración o esto es muy pero muy grande?",

                                    style: TextStyle(

                                        color:
                                        Colors.white,
                                        fontSize: 16
                                    ),
                                  ),
                                  padding: EdgeInsets.all(20),
                                ),
                                alignment: Alignment.topLeft,
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(
                                Radius.circular(
                                    10)),

                            // Box decoration takes a gradient

                          ))
                    ],
                  ),
                );
              }),
        ),
        Container(
          padding: EdgeInsets.only(left: 15,right: 15),
          child: Row(
            children: <Widget>[Container(
              margin: EdgeInsets.only(left: 10,bottom: 15,top: 15),
              child: Text("Temas",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
              ),
            )],
          ),
        ),
        Expanded(
          child:  ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 6,
              itemBuilder:
                  (BuildContext ctxt, int index) {
                return Container(
                  margin: EdgeInsets.only(left: 25,right: 25,top: 10,bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color:Colors.black12,
                  ),

                  child: Stack(
                    children: <Widget>[

                      Container(

                          child: Stack(
                            children: <Widget>[
                              Align(
                                child: Container(


                                  child: Text(

                                    temas[index],

                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,


                                        fontSize: 16
                                    ),
                                  ),
                                  padding: EdgeInsets.all(15),
                                ),
                                alignment: Alignment.topLeft,
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(
                                Radius.circular(
                                    10)),

                            // Box decoration takes a gradient

                          ))
                    ],
                  ),
                );
              }),
        )

      ],
    );
  }

}
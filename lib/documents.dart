import 'package:flutter/material.dart';

class Documents extends StatefulWidget {
  @override
  State createState() => new Documentsstate();
}

class Documentsstate extends State<Documents> {
  List<int> flatColors = [
    0xff2ecc71,
    0xfff39c12,
    0xff3498db,
    0xff9b59b6,
    0xffe67e22,
    0xffe74c3c
  ];
  List<String> temas = [
    "Recibos",
    "Sanciones",
    "Alertas",
    "Reuniones",
    "Sanciones",
    "Alertas"
  ];

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
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Documentos",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
              RaisedButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ),
                onPressed: () {},
                child: Text("Cerrar"),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 6,
              itemBuilder: (BuildContext ctxt, int index) {
                return Container(
                  margin:
                      EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.folder),
                          ),
                          Container(
                            child: Text(
                              temas[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            padding: EdgeInsets.all(15),
                          )
                        ],
                      ),
                      index== 1 ? Container(


                        child: Center(
                          child: Text("1",style: TextStyle(color: Colors.white),),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.all(Radius.circular(50))
                        ),
                        width: 20,
                        height: 20,
                      ): Container()
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}

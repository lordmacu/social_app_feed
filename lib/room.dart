import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class Room extends StatefulWidget {
  @override
  State createState() => new Roomstate();
}

class Roomstate extends State<Room> {
  List<int> flatColors = [
    0xff2ecc71,
    0xfff39c12,
    0xff3498db,
    0xff9b59b6,
    0xffe67e22,
    0xffe74c3c
  ];
  List<String> temas = [
    "Administración",
    "Visitas",
    "Pagos",
    "Vigilacia",
    "Parqueadero",
    "Aseo"
  ];

  CalendarController _calendarController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting();

    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Alquiler de Salones",
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
              Container(
                height: 120,
                margin: EdgeInsets.only(bottom: 10),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Container(
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        margin: EdgeInsets.only(
                            right: 15, left: index == 0 ? 15 : 0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              child: TransitionToImage(
                                image: AdvancedNetworkImage(
                                  "https://pix10.agoda.net/hotelImages/106/1060050/1060050_15082810180035249729.jpg?s=1024x768",
                                  loadedCallback: () {
                                    print('It works!');
                                  },
                                  loadFailedCallback: () {
                                    print('Oh, no!');
                                  },
                                ),
                                loadingWidgetBuilder:
                                    (_, double progress, __) =>
                                        Text(progress.toString()),
                                fit: BoxFit.cover,
                                placeholder: const Icon(Icons.refresh),
                                height: 230.0,
                                enableRefresh: true,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              width: 200,
                            ),
                            Positioned(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      child: Text(
                                        "Salon 1",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      bottom: 0,
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    gradient: LinearGradient(
                                      // Where the linear gradient begins and ends
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      // Add one stop for each color. Stops should increase from 0 to 1
                                      stops: [0.1, 0.3, 0.6],
                                      colors: [
                                        // Colors are easy thanks to Flutter's Colors class.
                                        Colors.black54,
                                        Colors.black26,
                                        Colors.transparent,
                                      ],
                                    )),
                                width: 200,
                                height: 200,
                              ),
                              bottom: 0,
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: TableCalendar(
                  locale: 'es_ES',
                  calendarController: _calendarController,
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        left: 25, right: 25, top: 10, bottom: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black12,
                    ),
                    child: Stack(
                      children: <Widget>[
                        Container(
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  child: Container(
                                    child: Text(
                                      "22 de Febrero Hora 1:00 pm - Reservado",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    padding: EdgeInsets.all(15),
                                  ),
                                  alignment: Alignment.topLeft,
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),

                              // Box decoration takes a gradient
                            ))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.calendar_today),
          backgroundColor: Colors.blueAccent,
        ));
  }
}

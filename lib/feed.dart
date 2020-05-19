import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ipuc/chatmessage.dart';
import 'post.dart';
import 'profile.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'biblie.dart';
import 'chatscreen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import "dart:math";
import 'andwers.dart';
import 'messages.dart';
import 'tickets.dart';
import 'room.dart';
import 'documents.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => new _FeedState();
}

class _FeedState extends State<Feed> {
  final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>(); // ADD THIS LINE
  PanelController _pc = new PanelController();
  final _random = new Random();

  int ScreenPopu = 0;
  int typeFeed = 1;

  Future openPost() async {
    await Navigator.of(context).push(new MaterialPageRoute<int>(
        builder: (BuildContext context) {
          return Post();
        },
        maintainState: true,
        fullscreenDialog: false));
  }

  Future openProfile() async {
    await Navigator.of(context).push(new MaterialPageRoute<int>(
        builder: (BuildContext context) {
          return Profile();
        },
        maintainState: true,
        fullscreenDialog: false));
  }

  Future openBiblie() async {
    await Navigator.of(context).push(new MaterialPageRoute<int>(
        builder: (BuildContext context) {
          return Biblie();
        },
        maintainState: true,
        fullscreenDialog: false));
  }

  Future openChat() async {
    await Navigator.of(context).push(new MaterialPageRoute<int>(
        builder: (BuildContext context) {
          return ChatScreen();
        },
        maintainState: true,
        fullscreenDialog: false));
  }

  Widget showWidgetPopup() {
    if (ScreenPopu == 1) {
      return AnsWers();
    }else
    if (ScreenPopu == 2) {
      return Messages();
    }else
    if (ScreenPopu == 3) {
      return Ticket();
    } else
    if (ScreenPopu == 4) {
      return Room();
    } else
    if (ScreenPopu == 5) {
      return Documents();
    }  else {
      return Container(
        child: Text(""),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      // ADD THIS LINE

      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/icon.png",
                      width: 80,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text("Cristian Garcia"),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              title: Text(
                'Biblia',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Mensajes',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Predicaciónes',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Videos',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Revista',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      backgroundColor: Color(0xffFAFBFC),
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Color(0xffFAFBFC),
        title: Text(
          "Toc Toc - Luna Park",
          style: TextStyle(color: Colors.blueAccent),
          textAlign: TextAlign.left,
        ),
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState.openDrawer(); // CHANGE THIS LINE
          },
          child: Container(
            child: Icon(
              Icons.menu,
              color: Colors.blueAccent,
            ),
          ),
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
             // openChat();
              setState(() {
                ScreenPopu = 2;
              });
              _pc.open();
            },
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                EvaIcons.messageCircleOutline,
                color: Colors.blueAccent,
              ),
            ),
          )
        ],
      ),
      body: SlidingUpPanel(
        renderPanelSheet: false,
        backdropEnabled: true,
        controller: _pc,
        minHeight: 0,
        maxHeight: height - 120,
        panel: Container(
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20.0,
                  color: Colors.grey,
                ),
              ]),
          child: showWidgetPopup(),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Column(
                          children: <Widget>[
                            index == 0
                                ? Container(
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            GestureDetector(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: typeFeed==1 ?  Color(0xffEEEEEE) : Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(100)),
                                                ),
                                                child: Stack(
                                                  children: <Widget>[
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          Image.asset(
                                                            "assets/anuncesd.png",
                                                            width: 75,
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: <Widget>[
                                                              Text(
                                                                "Anuncios",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                width: 110,
                                                height: 110,
                                                margin:
                                                    EdgeInsets.only(left: 5),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  typeFeed=1;
                                                });
                                              },
                                            ),
                                            GestureDetector(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: typeFeed==0 ?  Color(0xffEEEEEE) : Colors.white,

                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(100)),
                                                ),
                                                child: Stack(
                                                  children: <Widget>[
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          Image.asset(
                                                            "assets/services.png",
                                                            width: 75,
                                                          ),
                                                          Text(
                                                            "Market",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                width: 110,
                                                height: 110,
                                                margin:
                                                    EdgeInsets.only(left: 5),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  typeFeed=0;
                                                });
                                              },
                                            ),
                                            GestureDetector(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(100)),
                                                ),
                                                child: Stack(
                                                  children: <Widget>[
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          Image.asset(
                                                            "assets/talk.png",
                                                            width: 75,
                                                          ),
                                                          Text(
                                                            "Sugerencias",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                width: 110,
                                                height: 110,
                                                margin:
                                                    EdgeInsets.only(left: 5),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  ScreenPopu = 3;
                                                });
                                                _pc.open();
                                              },
                                            )
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            GestureDetector(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(100)),
                                                ),
                                                child: Stack(
                                                  children: <Widget>[
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          Image.asset(
                                                            "assets/question.png",
                                                            width: 75,
                                                          ),
                                                          Text(
                                                            "Preguntas",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                width: 110,
                                                height: 110,
                                                margin:
                                                    EdgeInsets.only(left: 5),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  ScreenPopu = 1;
                                                });
                                                _pc.open();
                                              },
                                            ),
                                            GestureDetector(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(100)),
                                                ),
                                                child: Stack(
                                                  children: <Widget>[
                                                    Align(
                                                      alignment:
                                                      Alignment.center,
                                                      child: Column(
                                                        mainAxisSize:
                                                        MainAxisSize.min,
                                                        children: <Widget>[
                                                          Image.asset(
                                                            "assets/calendar.png",
                                                            width: 75,
                                                          ),
                                                          Text(
                                                            "Alquiler Salón",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                width: 110,
                                                height: 110,
                                                margin:
                                                EdgeInsets.only(left: 5),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  ScreenPopu = 4;
                                                });
                                                _pc.open();
                                              },
                                            ),
                                            GestureDetector(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(100)),
                                                ),
                                                child: Stack(
                                                  children: <Widget>[
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          Image.asset(
                                                            "assets/documents.png",
                                                            width: 75,
                                                          ),
                                                          Text(
                                                            "Documentos",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                width: 110,
                                                height: 110,
                                                margin:
                                                    EdgeInsets.only(left: 5),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  ScreenPopu = 5;
                                                });
                                                _pc.open();
                                              },
                                            ),

                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                        ),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(bottom: 10),
                                  )
                                : Container(),
                            typeFeed == 0
                                ? Container(
                                    child: Column(
                                      children: <Widget>[
                                        GestureDetector(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 15, right: 15, top: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                      padding: EdgeInsets.only(
                                                          left: 10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text(
                                                            "Cristian Camilo Garcia",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                          Text(
                                                            "Administrador",
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                color: Colors
                                                                    .black38),
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
                                            openProfile();
                                          },
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Flexible(

                                                    child: Text(
                                                      "Nombre del Producto",
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w700
                                                      ),
                                                    ),
                                                    flex: 5,
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      "\$5.000",
                                                      style: TextStyle(fontSize: 20,color: Colors.green),
                                                    ),
                                                    flex: 2,
                                                  )
                                                ],
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                              ),Container(
                                                color: Colors.black26,
                                                child: null,
                                                width: double.infinity,
                                                height: 0.5,
                                                margin: EdgeInsets.only(top: 10),

                                              )
                                            ],
                                          ),
                                          padding: EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 10,
                                              bottom: 5),
                                        ),
                                        Container(
                                          child: Text(
                                              "Este es un textodafsd y puede ser muy largo o aunqeu tambien puede ser contigo"),
                                          padding: EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 15,
                                              bottom: 10),
                                        ),
                                        Stack(
                                          children: <Widget>[
                                            GestureDetector(
                                              child: Container(
                                                  width: double.infinity,
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
                                                    loadingWidgetBuilder: (_,
                                                            double progress,
                                                            __) =>
                                                        Text(progress
                                                            .toString()),
                                                    fit: BoxFit.cover,
                                                    placeholder: const Icon(
                                                        Icons.refresh),
                                                    height: 230.0,
                                                    enableRefresh: true,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                  )),
                                              onTap: () {
                                                openPost();
                                              },
                                            ),
                                            Positioned(
                                              child: InkWell(
                                                onTap: () {
                                                  print("sss");
                                                },
                                                child: Container(
                                                  child: Icon(
                                                    EvaIcons.heart,
                                                    color: Colors.redAccent,
                                                    size: 30,
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white70,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  40))),
                                                  padding: EdgeInsets.all(5),
                                                ),
                                              ),
                                              bottom: 10,
                                              right: 10,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    margin: EdgeInsets.only(
                                        bottom: 15,
                                        left: 10,
                                        right: 10,
                                        top: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    padding: EdgeInsets.only(top: 5),
                                  )
                                : Container(
                                    child: Column(
                                      children: <Widget>[
                                        GestureDetector(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 15, right: 15, top: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                      padding: EdgeInsets.only(
                                                          left: 10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text(
                                                            "Cristian Camilo Garcia",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                          Text(
                                                            "Administrador",
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                color: Colors
                                                                    .black38),
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
                                            openProfile();
                                          },
                                        ),
                                        Container(
                                          child: Text(
                                              "Este es un ddd y puede ser muy largo o aunqeu tambien puede ser contigo"),
                                          padding: EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 10,
                                              bottom: 10),
                                        ),
                                        Stack(
                                          children: <Widget>[
                                            GestureDetector(
                                              child: Container(
                                                  width: double.infinity,
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
                                                    loadingWidgetBuilder: (_,
                                                            double progress,
                                                            __) =>
                                                        Text(progress
                                                            .toString()),
                                                    fit: BoxFit.cover,
                                                    placeholder: const Icon(
                                                        Icons.refresh),
                                                    height: 230.0,
                                                    enableRefresh: true,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                  )),
                                              onTap: () {
                                                openPost();
                                              },
                                            ),
                                            Positioned(
                                              child: InkWell(
                                                onTap: () {
                                                  print("sss");
                                                },
                                                child: Container(
                                                  child: Icon(
                                                    EvaIcons.heart,
                                                    color: Colors.redAccent,
                                                    size: 30,
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white70,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  40))),
                                                  padding: EdgeInsets.all(5),
                                                ),
                                              ),
                                              bottom: 10,
                                              right: 10,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    margin: EdgeInsets.only(
                                        bottom: 15,
                                        left: 10,
                                        right: 10,
                                        top: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    padding: EdgeInsets.only(top: 5),
                                  )
                          ],
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

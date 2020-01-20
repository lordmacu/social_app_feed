import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ipuc/chatmessage.dart';
import 'post.dart';
import 'profile.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'biblie.dart';
import 'chatscreen.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => new _FeedState();
}

class _FeedState extends State<Feed> {
  List<String> litems = ["1", "2", "Third", "4"];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>(); // ADD THIS LINE

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey, // ADD THIS LINE

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
                    Image.asset("assets/icon.png",width: 80,),
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
              title: Text('Biblia',style: TextStyle(fontSize: 20),),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Mensajes',style: TextStyle(fontSize: 20),),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },

            ),
            ListTile(
              title: Text('Predicaciónes',style: TextStyle(fontSize: 20),),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },

            ),
            ListTile(
              title: Text('Videos',style: TextStyle(fontSize: 20),),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },

            ),
            ListTile(
              title: Text('Revista',style: TextStyle(fontSize: 20),),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Noticias",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.left,
        ),
        leading: InkWell(
          onTap: (){
            _scaffoldKey.currentState.openDrawer(); // CHANGE THIS LINE

          },
          child: Container(
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
        actions: <Widget>[
          InkWell(
            onTap: (){
              openChat();
            },
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                EvaIcons.messageCircleOutline,
                color: Colors.black,
              ),
            ),
          ),
          InkWell(
            onTap: (){
              openBiblie();
            },
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: litems.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Column(
                      children: <Widget>[
                        index == 0
                            ? Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding:
                                          EdgeInsets.only(right: 15, left: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            "Iglesias",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 25),
                                          ),
                                          Text(
                                            "Ver más",
                                            textAlign: TextAlign.right,
                                          )
                                        ],
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 0, top: 15, bottom: 15),
                                      margin: EdgeInsets.only(top: 5),
                                      height: 160,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 10,
                                          itemBuilder:
                                              (BuildContext ctxt, int index) {
                                            return Container(
                                              margin: EdgeInsets.only(
                                                  right: 15,
                                                  left: index == 0 ? 15 : 0),
                                              child: Stack(
                                                children: <Widget>[
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    height: 160,
                                                    width: 90,
                                                    child: TransitionToImage(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      image: AdvancedNetworkImage(
                                                          "https://res.cloudinary.com/civico/image/upload/c_fit,f_auto,fl_lossy,h_1200,q_auto:low,w_1200/v1440792289/entity/image/file/006/000/55e0be94b9dd5dba39000006.jpg"),
                                                      fit: BoxFit.cover,
                                                      enableRefresh: true,
                                                    ),
                                                  ),
                                                  Container(
                                                      height: 160,
                                                      width: 90,
                                                      child: Stack(
                                                        children: <Widget>[
                                                          Align(
                                                            child: Container(

                                                              child: Text(
                                                                "Ipuc La Victoria",

                                                                style: TextStyle(
                                                                    color:
                                                                    Colors.white),
                                                                textAlign: TextAlign.center,
                                                              ),
                                                              padding: EdgeInsets.only(bottom: 10,left: 10,right: 10),
                                                            ),
                                                            alignment: Alignment.bottomCenter,
                                                          )
                                                        ],
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),

                                                        // Box decoration takes a gradient
                                                        gradient:
                                                            LinearGradient(
                                                          // Where the linear gradient begins and ends
                                                          begin: Alignment
                                                              .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                          // Add one stop for each color. Stops should increase from 0 to 1
                                                          stops: [
                                                            0.1,
                                                            0.5,
                                                            0.7,
                                                            0.9
                                                          ],
                                                          colors: [
                                                            // Colors are easy thanks to Flutter's Colors class.
                                                            Colors.transparent,
                                                            Colors.transparent,
                                                            Colors.black12,
                                                            Colors.black45,
                                                          ],
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            );
                                          }),
                                    )
                                  ],
                                ),
                                margin: EdgeInsets.only(bottom: 5),
                              )
                            : Container(),
                        Container(
                          child: Column(
                            children: <Widget>[
                              GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.all(10),
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
                                                  "nombre",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  "Presidente de jóvenes",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.black38),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        child: Icon(
                                          Icons.more_vert,
                                          color: Colors.grey,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  openProfile();
                                },
                              ),
                              GestureDetector(
                                child: Container(
                                  width: double.infinity,
                                  child: Image.asset(
                                    "assets/full.jpeg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                onTap: () {
                                  openPost();
                                },
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        print("sss");
                                      },
                                      child: Container(
                                        child: Icon(
                                          EvaIcons.heartOutline,
                                          color: Colors.black38,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        print("aqui mano");
                                      },
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              EvaIcons.messageCircleOutline,
                                              color: Colors.black38,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Text(
                                                "Comentar",
                                                style: TextStyle(
                                                  color: Colors.black38,
                                                ),
                                              ),
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
                  }),
            ),
          )
        ],
      ),
    );
  }
}

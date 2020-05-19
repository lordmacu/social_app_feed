import 'package:flutter/material.dart';

class TicketCreator extends StatefulWidget{
  @override
  _TicketCreatorState createState() => new _TicketCreatorState();
}

class _TicketCreatorState extends State<TicketCreator>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Creación de Sugerencias"),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 5),
            child: Icon(Icons.send),
          )
        ],

      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.multiline,
              minLines: 3,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Escribe la sugerencia',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: RaisedButton(
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ),
                onPressed: (){

                },

                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.attach_file,color: Colors.white,),
                    Text("Adjuntar Imágen",style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
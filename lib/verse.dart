import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'model/book.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'global.dart' as global;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:ipuc/versiclepost.dart';


class VerseView extends StatefulWidget{

  int chapter=0;
  int bookId=0;
  String name="";
  VerseView(this.chapter,this.name,this.bookId);
  @override
  _VerseState createState() => new _VerseState(this.chapter,this.name,this.bookId);
}

class _VerseState extends State<VerseView>{

  int chapter=0;
  String name="";
  int bookId=0;
  List<int> listIndexes=[];
  int verse=1;
  double fontSize=20;
 int selectedItem=0;
  int nextChapterInt=1;
  int backChapterInt=0;
 int chapterGeneral=0;

 bool hasNextChapter=false;
 bool hasBackChapter=false;
  Color fontColor= Color(0xff2b2b2b);
  Color backgroundColor= Colors.white;
  Color evenBackground= Color(0xffdee2e6);

  bool nightState=false;

  changeColorBackground() async{

    setState(() {
      if(nightState){
        fontColor= Colors.white;
        backgroundColor= Color(0xff2b2b2b);
        nightState=false;
        evenBackground= Colors.black38;

      }else{
        evenBackground= Color(0xffdee2e6);

        fontColor= Color(0xff2b2b2b);
        backgroundColor= Colors.white;
        nightState=true;

      }
    });
    global.isNight=!nightState;

        SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isNight', !nightState);

  }

  Future setFont(font) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setDouble('fontSize', font);

  }
  showPickerDialog(BuildContext context) {
    new Picker(


        adapter: PickerDataAdapter<String>(pickerdata: [20,22,24,26,28,30,35,40,50]),
        hideHeader: true,
        selecteds:[selectedItem],
        title: new Text("Seleccione el tamaño de fuente"),
        onConfirm: (Picker picker, List value) {
          print("ddd  ${value[0]}");


          setState(() {
            selectedItem=value[0];
            fontSize=double.parse(picker.getSelectedValues()[0]);
            global.fontSize=fontSize;
          });
          print(picker.getSelectedValues());
          setFont(fontSize);
        }
    ).showDialog(context);
  }

  _VerseState(this.chapter,this.name,this.bookId);
  List productList=[];
  ScrollController controller= ScrollController();

  Future nextChapter(chapter) async{

    var productListtemp = await Verse().select().where("chapter = ${chapter+1} AND book_id = ${bookId}").toList();
    setState(() {
      if(productListtemp.length>0){
        hasNextChapter=true;
        chapter=nextChapterInt;
      }else{
        hasNextChapter=false;
      }
    });


   print("el siguiente ${productListtemp.length}");

  }


  Future backChapter(chapter) async{




    var productListtemp = await Verse().select().where("chapter = $chapter AND book_id = ${bookId}").toList();

    setState(() {
      if(productListtemp.length>0){
        hasBackChapter=true;
      }else{
        hasBackChapter=false;
      }
    });



    print("el siguiente ${productListtemp.length}");

  }

  List<String> ids=[];

  Future getBooksByDefault(chapter) async{



    var productListtemp = await Verse().select().where("chapter = ${chapter} AND book_id = $bookId").toList();

    for(var i=0; i<productListtemp.length; i++){

      ids.add("${i}-${bookId}-${chapter}-${productListtemp[i].verse}");
    }
    setState(() {
      productList= productListtemp;
    });
    nextChapter(chapter);
    backChapter(chapter);

    checkComments(ids);
  }


  checkComments(ids){
    print("Estos son los ids ${ids}");

    setState(() {
      listIndexes=[1,5,7];

    });
    for(var i=0 ; i<productList.length;i++){
      if(listIndexes.contains(i)){
        setState(() {
          productList[i].hasComments=true;

        });
      }
    }

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    getBooksByDefault(chapter);

    chapterGeneral=chapter;

    fontSize=global.fontSize;
    nightState=global.isNight;
    changeColorBackground();


  }



  nextPage(){
    chapter=chapter-1;
    getBooksByDefault(chapter);
    setState(() {
      chapterGeneral=chapter;
    });
    controller.animateTo(0,duration: Duration(milliseconds: 100),curve:Curves.linear);

  }

  prevPage(){
    chapter=chapter+1;
    getBooksByDefault(chapter);
    setState(() {
      chapterGeneral=chapter;
    });
    controller.animateTo(0,duration: Duration(milliseconds: 100),curve:Curves.linear);
  }

  Future openVersiclePost(text,verse,chapter,book) async {
    await Navigator.of(context).push(new MaterialPageRoute<int>(
        builder: (BuildContext context) {
          return VersiclePost(text,verse,chapter,book,name);
        },
        maintainState: true,
        fullscreenDialog: false));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        brightness: Brightness.dark, // status bar brightness

        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("${name} ${chapterGeneral}",style: TextStyle(color: Colors.black),textAlign: TextAlign.left,),
        leading:InkWell(
          onTap: (){
            Navigator.pop(context);

          },
          child:  Container(
            child: Icon(Icons.arrow_back_ios,color: Colors.black,),
          ),
        ),
        actions: <Widget>[

          GestureDetector(
            onTap: (){
              showPickerDialog(context);
            },
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.format_size,color: Colors.black,),
            ),
          ),
          GestureDetector(
            onTap: (){
              changeColorBackground();
            },
            child: Container(
              height: 40,
              color: Colors.black,
              padding: EdgeInsets.only(right: 10,top: 5,left: 10,bottom: 5),
              child:Text("A",style: TextStyle(fontSize: 25),),
            ),
          )
        ],
      ),
      body:  WillPopScope(
        onWillPop: () async => false,

        child: Stack(
          children: <Widget>[
            SwipeDetector(

              onSwipeRight: () {
                nextPage();

              },
              onSwipeLeft: () {
                prevPage();
              },
              child: ListView.builder(
                  controller: controller,
                  itemCount: productList.length,
                  itemBuilder: (BuildContext ctxt, int index) {

                    String text=productList[index].text;
                    return ListTile(
                      onTap: (){

                        if(listIndexes.contains(index)){
                          openVersiclePost(text.trim(),productList[index].verse,chapter,bookId);
                          print("aqui esta mano");
                        }
                      },
                      title: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom:index<productList.length-1 ? 0 :100 ),
                            padding: EdgeInsets.only(left: 5,right: 5,bottom: 20,top: 20),
                            color: index.isEven ? evenBackground : backgroundColor,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text("${productList[index].verse} ",style: TextStyle(fontSize: 25,color: fontColor),),
                                ),
                                Expanded(
                                  child: Text(" ${text.trim()}",style: TextStyle(fontSize: fontSize,color: fontColor),),
                                )
                              ],
                            ),
                          ),
                          Visibility(

                            child: Positioned(

                              child:  Icon(EvaIcons.messageCircle,color: fontColor,),
                              bottom: 2,
                              right: 2,
                            ),
                            visible:listIndexes.contains(index) ,
                          )
                        ],
                      ),
                    );
                  }),
            ),

            chapter>1 ? Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: (){
                  nextPage();
                },
                child: Container(
                  child: null,
                  height: double.infinity,
                  width: 40,
                  color: Colors.transparent,
                ),
              ),
            ):Container(),
            hasNextChapter ? Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: (){
                  prevPage();
                },
                child: Container(
                  child: null,
                  height: double.infinity,
                  width: 40,
                  color: Colors.transparent,
                ),
              ),
            ):Container(),

          ],
        ),
      ),
    );
  }


}
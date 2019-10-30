import 'package:flutter/material.dart';


class Detail extends StatefulWidget{
  final tag,image;
  Detail(this.tag,this.image);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail>{
  @override
  void initState() {
    super.initState();
  }

  @override  
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:  Container(
      width: MediaQuery.of(context).size.width - 32.0,
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0), color:Color(0xff016C7A) ),
      child: FlatButton(
        child: Text(
          'Register Now',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
            fontFamily: 'Pathway Gothic One',
          ),
        ), 
        textColor: Colors.white,
        color: Colors.transparent,
        onPressed: () {
         
        },
      ),
    ),
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Color(0xff004851),
              expandedHeight: 300.0,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(widget.tag,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                  background: Hero(
                       tag: widget.tag,
                      child: Image.asset(widget.image,fit: BoxFit.fill,
                      ),
                    ),
                  ),
            ),
          ];
        },
        body: Container(
          color: Color(0xff004851),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text("Rules and Regulations :",
                      style: TextStyle(
                        fontFamily: 'segeo',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 25.0,
                        // fontStyle: FontStyle.italic
                      )),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text("Fresher's World is a competition designed specially for the budding programmers to test their skills and explore a new competitive environment. It will help the programmers to introspect themselves on where they stand among the other fellow competitors.\n"+
                            "Fresher's World is a competition designed specially for the budding programmers to test their skills and explore a new competitive environment. It will help the programmers to introspect themselves on where they stand among the other fellow competitors.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                          fontFamily: 'segoe',
                          color: Colors.grey,
                          fontSize: 18.0)),
            ),

            Container(
                padding: EdgeInsets.only(top: 20,left: 15,right: 15),
                child: Text("Event Coordinators :",
                      style: TextStyle(
                        fontFamily: 'segeo',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 25.0,
                        // fontStyle: FontStyle.italic
                      )),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text("Anil Kumar meena - 7690066126",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                          fontFamily: 'segoe',
                          color: Colors.grey,
                          fontSize: 18.0)),
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text("Pravesh Vijayvergia - 7690066126",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                          fontFamily: 'segoe',
                          color: Colors.grey,
                          fontSize: 18.0)),
            ),
            ],
          ),
        )

    ));
  }
  }
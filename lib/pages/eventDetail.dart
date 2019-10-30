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
          borderRadius: BorderRadius.circular(3.0), color:Color(0xff0EDB00) ),
      child: FlatButton(
        child: Text(
          'Register Now',
          style: TextStyle(
            fontSize: 16.0,
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
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
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
        body: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Colors.grey[100],
              padding: EdgeInsets.all(15),
              child: Text("event detail"),
          ),
          ],
        )

    ));
  }
  }
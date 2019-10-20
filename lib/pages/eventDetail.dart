import 'package:flutter/material.dart';


class Detail extends StatefulWidget{
  final tag,image;
  Detail(this.tag,this.image);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail>{
 List images = [""];
  @override
  void initState() {
    super.initState();
  }


  @override  
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Center(
          child: Text("Event Details")
          )

    ));
  }
  }
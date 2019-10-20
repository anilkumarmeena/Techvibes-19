import 'package:flutter/material.dart';


class Detail extends StatefulWidget{
  final tag;
  Detail(this.tag);
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
              expandedHeight: 250.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("TechVibes'19",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                  background: Hero(
                       tag: widget.tag,
                      child: Image.network(
                        'https://leaderonomics.com/wp-content/uploads/2017/04/1807658-1-600x470.jpg',
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
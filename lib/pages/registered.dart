 import 'package:flutter/material.dart';


class Registered extends StatefulWidget{
  @override
  _RegisteredState createState() => _RegisteredState();
}

class _RegisteredState extends State<Registered>{
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
                  title: Text("",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                  // background: Hero(
                  //      tag: "",
                  //     child: Image.asset(widget.image,fit: BoxFit.fill,
                  //     ),
                  //   ),
                  ),
            ),
          ];
        },
        body: Center(
          child: Text("Event Details")
          )

    ));
  }
 
 Widget detailCard(BuildContext context,data,i) {
    return GestureDetector(
      onTap:(){          
      },
   child: Column(
     children: <Widget>[
       Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10,top: 10.0),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[400]))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: 115,
                        height: 135,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // image: DecorationImage(
                          //   image: NetworkImage(imgUrl+data['banner_image']),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                      data['is_premimum']=='y'?Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                                // padding: EdgeInsets.all(8),
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0)),
                                  gradient: LinearGradient(
                                    // Where the linear gradient begins and ends
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                    // Add one stop for each color. Stops should increase from 0 to 1
                                    stops: [0.1, 0.9],
                                    colors: [
                                      // Colors are easy thanks to Flutter's Colors class.
                                      Colors.red[800],
                                      Colors.red[400]
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset('assets/premium.png', width:18)
                                )),
                          ):SizedBox(),
                      Positioned(
                            left: 4,
                            bottom: 4,
                            child: GestureDetector(
                              onTap: (){
                              },
                              child: Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Center(
                                  child: Icon(
                                    Icons.star,
                                    size: 14,
                                    color: data['favourites'] == 'y'?Colors.red:Colors.grey[400],
                                  ),
                                ),
                              ),
                            ),
                          )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 155,
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                         alignment: Alignment.centerLeft,
                        child: Text(
                          data['title'],
                          style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                       data['short_description'],
                        maxLines: 3,
                        style: TextStyle(fontFamily: 'Open Sans', fontSize: 14.0),
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Volume: '+data['volume'],
                            style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                                fontSize: 12.0,
                                color: Colors.red),
                          ),
                          Text(
                            'Issue: '+data['issue'],
                            style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                                fontSize: 12.0,
                                color: Colors.red),
                          ),
                        ],
                      ),
                      
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            DateTime.fromMillisecondsSinceEpoch(data['time']*1000).toString().split(" ")[0],
                            style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                                fontSize: 12.0,
                                color: Colors.grey[400]),
                          ),
                          Container(
                            width: 100,
                            child: Text(
                              data['category']['name'],
                              style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0,
                                  color: Colors.grey[400]),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
     ],
   ),
    );
  }
}
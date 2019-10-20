import 'package:flutter/material.dart';
import 'package:techvibes19/pages/eventDetail.dart';


class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
 List images = ["assets/webster.jpg","assets/admob.png","assets/bizquiz.png","assets/artboard.jpg","assets/cadewar.jpg","assets/freshercode.jpg",
                "assets/ideate.jpg","assets/iplauction.jpg","assets/linefollower.jpg","assets/mindspark.jpg","assets/pitchstart.jpg",
                "assets/poster.jpg","assets/robosoccer.jpg","assets/techtalk.jpg","assets/techx.jpg","assets/treasure.jpg",];
  List names = ["webster","admob","bizquiz","artboard","cadewar","freshercode","ideate","iplauction","linefollower","mindspark","pitchstart","poster","robosoccer","techtalk","techx","treasure",];
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
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.black87,
            pinned: false,
            floating: false,
            snap: false,
            // actions: <Widget>[
            //   new Stack(
            //     children: <Widget>[
            //       IconButton(
            //         icon: Icon(
            //           Icons.notifications,
            //           color: Colors.black,
            //           size: 25,
            //         ),
            //         onPressed: () {
            //         },
            //       ),
            //   new Positioned(
            //               right: 10,
            //               top: 10,
            //               child: Container(
            //                       padding: EdgeInsets.all(2),
            //                       decoration: new BoxDecoration(
            //                         color: Colors.red,
            //                         borderRadius: BorderRadius.circular(5),
            //                       ),
            //                       constraints: BoxConstraints(
            //                         minWidth: 14,
            //                         minHeight: 14,
            //                       ),
            //                       child: Text(
            //                         "5",
            //                         style: TextStyle(
            //                           color: Colors.white,
            //                           fontSize: 8,
            //                         ),
            //                         textAlign: TextAlign.center,
            //                       ),
            //                     ),
            //             )
            //     ],
            //   ),
            // ],
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 374,
                      color: Colors.white,
                      padding: EdgeInsets.only(top: 50.0, left: 10.0, bottom: 0.0),
                      width: MediaQuery.of(context).size.width,
                      // decoration: BoxDecoration(
                      //   borderRadius: new BorderRadius.only(
                      //       bottomLeft: const Radius.circular(25.0),
                      //       bottomRight: const Radius.circular(25.0)),
                      //   color: Colors.black87,
                      // ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("TECH",
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 30.0,
                              )),
                          Text("VIBES'19",
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 30.0,
                              )),
                          Text("// 6'th-1'st Nov, BIT JAIPUR",
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 25.0,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ];
        },
        body: Container(
          decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(25.0),
                            topRight: const Radius.circular(25.0)),
                        color: Color(0xff121212,),
                      ),
          child: new ListView.builder
              (
                itemCount: images.length,
                itemBuilder: (BuildContext ctxt, int index) {
                return eventCard(context,names[index],images[index]);
    }
            ),
        )
    ));
  }

   Widget eventCard(BuildContext context,tag,image) {
    return InkWell(
      onTap:(){
      Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Detail(tag,image)),
              );   
      },
      child: Container(
        margin: EdgeInsets.only(left: 20.0,right: 20,bottom: 30),
        child: Stack(
            children: <Widget>[
               Hero( tag: tag,
                      child:
                      Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [new BoxShadow(
            color: Colors.white,
            blurRadius: 10.0,
          ),],
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ))
          ),),
            Positioned(
              left: 20,
              top: 220,
              child: Container(
                height: 60,
                width: 300,
                    decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                  ),
                    child: Center(
                      child: Text('Webster Hackathon',style: TextStyle(
                        fontFamily: 'Open Sans',
                        color: Colors.purple[200],
                        fontWeight: FontWeight.w600,
                        fontSize: 25.0),),
                  ),),
            )                  
          ],
        ),
      ),
    );
  }

}

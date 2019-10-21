import 'package:flutter/material.dart';
import 'package:techvibes19/pages/eventDetail.dart';
import 'package:techvibes19/pages/temp.dart';


class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
 List images = ["assets/webster.jpg","assets/admob.png","assets/bizquiz.png","assets/artboard.jpg","assets/cadewar.jpg","assets/freshercode.jpg",
                "assets/ideate.jpg","assets/iplauction.jpg","assets/linefollower.jpg","assets/mindspark.jpg","assets/pitchstart.jpg",
                "assets/poster.jpg","assets/robosoccer.jpg","assets/techtalk.jpg","assets/techx.jpg","assets/treasure.jpg",];
  List names = ["Webster Hackathon","Admob","BizQuiz","artboard","codewar","freshercode","ideate","iplauction","linefollower","mindspark","pitchstart","poster","robosoccer","techtalk","techx","treasure",];
  
  @override
  void initState() {
    super.initState();
  }

  @override  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff004851),
      floatingActionButton: FancyFab(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Color(0xff004851),
            pinned: false,
            floating: false,
            snap: false,
            // actions: <Widget>[
            //   new Stack(
            //     children: <Widget>[
            //       IconButton(
            //         icon: Icon(
            //           Icons.notifications,
            //           color: Colors.white,
            //           size: 25,
            //         ),
            //         onPressed: () {
            //            Navigator.push(
            //             context,
            //             MaterialPageRoute(builder: (context) => FancyFab()),
            //           );
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
            expandedHeight: 276,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Icon(Icons.arrow_drop_up,size: 20,color: Colors.white,),
              background: Container(
                decoration: BoxDecoration(
                  color: Color(0xff004851),
                ),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 300,
                      color: Color(0xff004851),
                      padding: EdgeInsets.only(top: 60.0, left: 10.0, bottom: 0.0),
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
                          Center(child: Image.asset('assets/logo.png',width: 160,)),
                          Center(
                            child: Text("TECHVIBES'19",
                                style: TextStyle(
                                  fontFamily: 'segeo',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 40.0,
                                  // fontStyle: FontStyle.italic
                                )),
                          ),
                          // Text("VIBES'19",
                          //     style: TextStyle(
                          //       fontFamily: 'segeo',
                          //       color: Colors.white,
                          //       fontWeight: FontWeight.w900,
                          //       fontSize: 75.0,
                          //     )),
                          Center(
                            child: Text("6'th-7'st Nov, BIT JAIPUR",
                                style: TextStyle(
                                  fontFamily: 'seoge',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0,
                                )),
                          ),
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
          margin: EdgeInsets.only(top: 25.0),
          decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(15.0),
                            topRight: const Radius.circular(15.0)),
                        color: Color(0xff016C7A,),
                        boxShadow: [new BoxShadow(
            color: Colors.white,
            blurRadius: 20.0,
          ),],
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
        margin: EdgeInsets.only(left: 25.0,right: 25,bottom: 30,top: 20),
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
              left: 0,
              top: 230,
              child: Container(
                height: 60,
                width: 200,
                    decoration: BoxDecoration(
                  color: Color(0xff004851),
                  borderRadius: new BorderRadius.only(
                            topRight: const Radius.circular(15.0),
                            bottomRight: const Radius.circular(15.0)),
                  ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(tag,style: TextStyle(
                          fontFamily: 'segoe',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 25.0),),
                      ),
                  ),),                 
          ],
        ),
      ),
    );
  }

}

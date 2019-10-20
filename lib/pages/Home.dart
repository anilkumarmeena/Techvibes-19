import 'package:flutter/material.dart';
import 'package:techvibes19/pages/eventDetail.dart';


class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
 List images = ["assets/admob.png","assets/bizquiz.png","assets/artboard.jpg","assets/cadewar.jpg","assets/freshercode.jpg",
                "assets/ideate.jpg","assets/iplauction.jpg","assets/linefollower.jpg","assets/mindspark.jpg","assets/pitchstart.jpg",
                "assets/poster.jpg","assets/robosoccer.jpg","assets/techtalk.jpg","assets/techx.jpg","assets/treasure.jpg","assets/webster.jpg"];

  ScrollController _scrollController;
  var title = "Techvibes 2019";
  @override
  void initState() {
    super.initState();
    // _scrollController = ScrollController()..addListener(() => _isAppBarExpanded ?
    //     setState(
    //       () {
    //         title = "";
    //       },
    //     ):setState((){
    //       title = "Techvibes 2019";
    //     }
    //     ));
  }
  // bool get _isAppBarExpanded {
  //   return _scrollController.hasClients &&
  //       _scrollController.offset > (200 - kToolbarHeight);
  // }

  @override  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.deepPurple,
            pinned: false,
            floating: true,
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
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
                  // centerTitle: true,
                  // title: Text(title,
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 16.0,
                  //     )),
              background: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 250.0, left: 10.0, bottom: 20.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                            bottomLeft: const Radius.circular(25.0),
                            bottomRight: const Radius.circular(25.0)),
                        color: Colors.deepPurple,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("userData['name']",
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 30.0,
                              )),
                          Text("userData['email']",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0,
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
        body: new ListView.builder
            (
              itemCount: images.length,
              itemBuilder: (BuildContext ctxt, int index) {
              return eventCard(context,"web",images[index]);
    }
          )
    ));
  }

   Widget eventCard(BuildContext context,tag,image) {
    return InkWell(
      onTap:(){
      Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Detail(tag)),
              );   
      },
          child: Container(
        margin: EdgeInsets.only(left: 20.0,right: 20,bottom: 30),
        child: Stack(
            children: <Widget>[
               Container(
              height: 300,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  )),child:
                  Container(
                    decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                  ),
                    margin: EdgeInsets.only(left: 15,right: 15,top: 220,bottom: 10),
                    child: Center(
                      child: Text('Webster Hackathon',style: TextStyle(
                        fontFamily: 'Open Sans',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 25.0),),
                  ),),
            ),                  
          ],
        ),
      ),
    );
  }

}

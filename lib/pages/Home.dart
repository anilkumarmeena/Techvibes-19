import 'package:flutter/material.dart';


class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
 List images = [""];
  @override
  void initState() {
    super.initState();
  }


  @override  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: new ListView.builder
      (
        itemCount: images.length,
        itemBuilder: (BuildContext ctxt, int index) {
        return  eventCard(context);
        }
      )

    );
  }

   Widget eventCard(BuildContext context) {
    return GestureDetector(
      onTap:(){
          
      },
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width/2 -30,
              height: 190,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage("https://leaderonomics.com/wp-content/uploads/2017/04/1807658-1-600x470.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(left: 20.0,top: 100.0,
            child: Text('Event',style: TextStyle(
                    fontFamily: 'Open Sans',
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0),),)
                       
          ],
        ),
      ),
    );
  }

}
// //api

//  Future issuelist() async {
//     // String url = '$baseUrl/issues?page=$pageNo';
//     // Response response = await get(
//     //   url, headers: {
//     //     HttpHeaders.authorizationHeader: "Bearer $apiKey",
//     //   },
//     // ); 
//     // return json.decode(response.body);  
//     return "last"; 
//   }

//   Widget updateHomeData(context) {
//     return     FutureBuilder(
//       future: issuelist(),
//       builder: (BuildContext context, AsyncSnapshot snapshot){
//         if (snapshot.hasData) {
//           if (snapshot.data != null) {
//             dynamic content = snapshot.data;
//             if(snapshot.data['errors']!=null){
//              return Container(
//                width: MediaQuery.of(context).size.width,
//                height: MediaQuery.of(context).size.height - 100,
//                child: Center(
//                  child: Text(
//                       'No Article Found',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18.0,
//                           fontFamily: 'Open Sans'),
//                     ),
//                ),
//              );
//           }else{
//             }
//             }
//             return ListView(
//                     children: <Widget>[
//                       Container(
//                         padding: EdgeInsets.only(top: 35.0,left: 10,right: 10),
//                         child: Wrap(
//                           direction: Axis.horizontal,
//                           children:  List.generate(mainlist.length, (i)=>issueCard(context,mainlist[i],i))
//                         ),
//                       ),
//                       !_isloading?Container(
//                     padding: EdgeInsets.all(5.0),
//                     width: MediaQuery.of(context).size.width,
//                     child: Center(
//                       child: CircularProgressIndicator(
//                         backgroundColor: Color(0xffffffff),
//                           strokeWidth: 2.0,
//                           valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
//                       ),
//                     )
//                 ):Container(),
//                     ],
//                   );
//           }
//           }
//         }  
//       },
//     );
//   }


// }
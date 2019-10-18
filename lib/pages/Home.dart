import 'package:flutter/material.dart';


class Home extends StatefulWidget{
  @override
  _IssueState createState() => _IssueState();
}

class _IssueState extends State<Home>{
 
  @override
  void initState() {
    super.initState();
  }


  @override  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: updateHomeData(context),
      
    );
  }

 
  
   Widget issueCard(BuildContext context,data,i) {
   
    return GestureDetector(
      onTap:(){
          
      },
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width/2 -30,
              height: 190,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(0.0),
                  image: DecorationImage(
                    image: NetworkImage("imgUrl"+data['images'][0]['image_path']),
                    fit: BoxFit.cover,
                  )),
            ),
            Text(data['month']+' '+data['year'],style: TextStyle(
                    fontFamily: 'Open Sans',
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0),),           
          ],
        ),
      ),
    );
  }


//api

 Future issuelist() async {
    // String url = '$baseUrl/issues?page=$pageNo';
    // Response response = await get(
    //   url, headers: {
    //     HttpHeaders.authorizationHeader: "Bearer $apiKey",
    //   },
    // ); 
    // return json.decode(response.body);  
    return "last"; 
  }

  Widget updateHomeData(context) {
    return     FutureBuilder(
      future: issuelist(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            dynamic content = snapshot.data;
            if(snapshot.data['errors']!=null){
             return Container(
               width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height - 100,
               child: Center(
                 child: Text(
                      'No Article Found',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: 'Open Sans'),
                    ),
               ),
             );
          }else{
            }
            }
            return ListView(
              controller: _controller,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 35.0,left: 10,right: 10),
                        child: Wrap(
                          direction: Axis.horizontal,
                          children:  List.generate(mainlist.length, (i)=>issueCard(context,mainlist[i],i))
                        ),
                      ),
                      !_isloading?Container(
                    padding: EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Color(0xffffffff),
                          strokeWidth: 2.0,
                          valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                    )
                ):Container(),
                    ],
                  );
          }
          }
        }  
      },
    );
  }


}
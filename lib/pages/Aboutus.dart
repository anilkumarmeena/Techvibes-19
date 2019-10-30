import 'package:flutter/material.dart';
//import 'package:techvibes19/pages/eventDetail.dart';
//import 'package:techvibes19/pages/temp.dart';


class Aboutus extends StatefulWidget{
  @override
  _AboutusState createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus>{
  @override
  Widget build(BuildContext context) {
    return  Material(
      child:Container(  
      padding: EdgeInsets.all(30.0),
      color: Colors.white,
      child:Column(
        children: [
          Container(
            color: Colors.black,
            margin: EdgeInsets.all(30.0),
            padding: EdgeInsets.all(10.0),
            alignment: Alignment(0, 0),
            width: 360.0,
            child: Text('Developers',
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
            ),
          ),
          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Anil kumar meena',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          Text(
            'Pravesh vijayvergia',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          Text(
            'Aman kumar sharma',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
        ],
      ),
        ],
      )
    )
    
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:techvibes19/pages/Home.dart';
// import 'package:techvibes19/pages/signup.dart';



// class Login extends StatefulWidget{    
//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final TextEditingController _emailController = new TextEditingController();

//   final TextEditingController _passwordController = new TextEditingController();
//   bool isLoading = false;
//   Map userProfile;

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: <Widget>[
//           Stack(
//             children: <Widget>[
//                Positioned(
//                 top: 10,
//                 left: 0,
//                 child: Image.asset('assets/bg-1.png',width: 70,),
//               ),
//                Positioned(
//                 bottom: 70,
//                 right: 0,
//                 child: Image.asset('assets/bg-2.png',width: 70,),
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 padding: EdgeInsets.symmetric(vertical: 100,horizontal: 30),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                  Image.asset('assets/logo.png',width: 100,),
//                   SizedBox(height: 30.0,),
//                    Text('Log In',style:TextStyle(
//                       color: Colors.black,
//                       fontFamily: 'Open Sans',
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                   )),
//                   SizedBox(height: 25.0,),

//                   Container(
//                     alignment: Alignment.centerLeft,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                     Text('Email',style:TextStyle(
//                       color: Colors.black,
//                       fontFamily: 'Open Sans',
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                   )),
//                   SizedBox(height:10),
//                   email(),
//                   SizedBox(height:20),
//                   Text('Password',style:TextStyle(
//                       color: Colors.black,
//                       fontFamily: 'Open Sans',
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                   )),
//                   SizedBox(height:10),
//                  password(),
                 

//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 15,),
//                   GestureDetector(
//                     onTap:(){
//                       //  Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(builder: (context) => ForgotPassword()),
//                       // );
//                     },
//                                       child: Container(
//                       alignment: Alignment.centerRight,
//                       child:  Text('FORGOT PASSWORD ?',style:TextStyle(
//                         color: Colors.blue,
//                         fontFamily: 'Open Sans',
//                         fontSize: 10,
//                         fontWeight: FontWeight.w600,
//                     )),
//                     ),
//                   ),
//                   SizedBox(height: 35,),
//                   login(context),
                  
                 
//  SizedBox(height: 20,),
//                   Container(
                   
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text('Not a member yet ? ',style:TextStyle(
//                       color: Colors.black,
//                       fontFamily: 'Open Sans',
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                   )),
//                   GestureDetector(
//                     onTap: (){
//                        Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (context) => Signup()),
//                       );
//                     },
//                     child: Text('REGISTER',style:TextStyle(
//                         color: Colors.red[600],
//                         fontFamily: 'Open Sans',
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                     )),
//                   ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 30.0,),                 
//                 ],),
//               ),

//             ],
//           )
//         ],
//       ),
//     );
    
//   }

//   Material email() {
//     return Material(
//                     shadowColor: Color(0xfffcfcfc),
//                     elevation: 0.0,
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(4.0),
//                     child: TextField(
//                       keyboardType: TextInputType.emailAddress,
//                       controller: _emailController,
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(horizontal:20,vertical: 15),
//                           border: InputBorder.none,
//                           labelStyle: TextStyle(
                           
//                             fontWeight: FontWeight.w600,
//                             fontFamily: 'Open Sans',
//                             fontSize: 16.0,
//                           ),
//                           hintText: 'Enter your email id',
//                           hintStyle: TextStyle(
//                             fontSize: 16.0,
//                             fontFamily: 'Open Sans')),
//                     ),
//                   );


                  
//   }

//   Material password() {
//     return Material(
//                     shadowColor: Color(0xfffcfcfc),
//                     elevation: 0.0,
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(4.0),
//                     child: TextField(
//                      obscureText: true,
//                        controller: _passwordController,
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(horizontal:20,vertical: 15),
//                           border: InputBorder.none,
//                           labelStyle: TextStyle(
                           
//                             fontWeight: FontWeight.w600,
//                             fontFamily: 'Open Sans',
//                             fontSize: 16.0,
//                           ),
//                           hintText: 'Enter your password',
//                           hintStyle: TextStyle(
//                             fontFamily: 'Open Sans',
//                             fontSize: 16.0)),
//                     ),
//                   );

// }

// Container login(context) {
//     return !isLoading? Container(
//       width:double.infinity,
//       height: 43.0,
//       // padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0,10.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(4.0),
//         color: Colors.red[600],
//       ),
//       child: FlatButton(
//         child: Text(
//           'Login',
//           style: TextStyle(
//             fontFamily: 'Open Sans',
//             fontSize: 14.0,
            
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         textColor: Colors.white,
//         color: Colors.transparent,
//         shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
//         onPressed: () { 
//             Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (context) => Home()),
//                       );
//         },
//       ),
//     ):Container(
//             padding: EdgeInsets.symmetric(vertical: 5.0),
//             height: 43.0,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(3.0),
//                 color: Color(0xffD95068)),
//             child: FlatButton(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   SizedBox(
//                     width: 20.0,
//                   ),
//                   Center(
//                     child: CircularProgressIndicator(
//                       backgroundColor: Color(0xff00d2ff),
//                       strokeWidth: 2.0,
//                       valueColor:
//                           new AlwaysStoppedAnimation<Color>(Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//               textColor: Colors.white,
//               color: Colors.transparent,
//               onPressed: () {},
//             ),
//           );
//   }
// }
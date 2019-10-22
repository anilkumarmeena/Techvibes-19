import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techvibes19/pages/Home.dart';
import 'package:techvibes19/pages/login.dart';
import 'package:techvibes19/pages/otp.dart';


class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var genderValue = "Male";
  var categoriesValue = "I\'m a BITian";
  var physio = 0;
  DateTime date = DateTime.now();
  double _kPickerSheetHeight = 216.0;   
  DateTime dateAndroid;
  var isLoading = false ;
  var verificationId;
final TextEditingController _addressController = new TextEditingController();
  final TextEditingController _pincodeController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _rollnoController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _mobileController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              
                Positioned(
                top: 10,
                left: 0,
                child: Image.asset('assets/bg-1.png',width: 70,),
              ),
               Positioned(
                bottom: 70,
                right: 0,
                child: Image.asset('assets/bg-2.png',width: 70,),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/logo.png',width: 100,),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text('Register',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        )),
                    SizedBox(
                      height: 25.0,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 10),
                          Text('Are you a BITian ?',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              )),
                             SizedBox(height: 10),   
                          categories(context),
                          SizedBox(height: 20),

                           Text('Full Name',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              )),
                          SizedBox(height: 10),
                          name(),
                          SizedBox(height: 20),
                           Text('Roll No.',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              )),
                               SizedBox(height: 10),
                          rollno(),
                          SizedBox(height: 20),
                          
                          Text('Email',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              )),
                              
                          SizedBox(height: 10),
                          email(),
                          SizedBox(height: 20),
                           Text('Mobile',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              )),
                          SizedBox(height: 10),
                          mobile(),
                          SizedBox(height: 20),
                           Text('Password',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              )),
                          SizedBox(height: 10),
                          password(),
                            SizedBox(height: 20),
                          //  Text('Pincode',
                          //     style: TextStyle(
                          //       fontFamily: 'Open Sans',
                          //       color: Colors.black,
                          //       fontSize: 14,
                          //       fontWeight: FontWeight.w600,
                          //     )),
                          //  SizedBox(height: 10),
                          // pincode(),
                          //   SizedBox(height: 20),
                          //  Text('Address',
                          //     style: TextStyle(
                          //       fontFamily: 'Open Sans',
                          //       color: Colors.black,
                          //       fontSize: 14,
                          //       fontWeight: FontWeight.w600,
                          //     )),
                          //  SizedBox(height: 10),
                          // address(),
                        ],
                      ),
                    ),
                    
                  
                    SizedBox(
                      height: 35,
                    ),
                    login(context),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Already a member ? ',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              )),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()),
                              );
                            },
                            child: Text('LOGIN',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  color: Colors.red[600],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              isLoading==true? Container(
                padding: const EdgeInsets.only(top: 400),
                child: Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator()
                    ),
                ),
              ):Container(),
            ],
          )
        ],
      ),
    );
  }

  Material rollno() {
    return Material(
      shadowColor: Color(0xfffcfcfc),
      elevation: 0.0,
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(4.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
         controller: _rollnoController,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            border: InputBorder.none,
            labelStyle: TextStyle(
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
            hintText: 'Enter your Roll No.',
            hintStyle: TextStyle(
              fontFamily: 'Open Sans',fontSize: 16.0)),
      ),
    );
  }

  Material email() {
    return Material(
      shadowColor: Color(0xfffcfcfc),
      elevation: 0.0,
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(4.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
         controller: _emailController,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            border: InputBorder.none,
            labelStyle: TextStyle(
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
            hintText: 'Enter your email id',
            hintStyle: TextStyle(
              fontFamily: 'Open Sans',fontSize: 16.0)),
      ),
    );
  }

  Material password() {
    return Material(
      shadowColor: Color(0xfffcfcfc),
      elevation: 0.0,
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(4.0),
      child: TextField(
        obscureText: true,
         controller: _passwordController,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            border: InputBorder.none,
            labelStyle: TextStyle(
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
            hintText: 'Enter your password',
            hintStyle: TextStyle(
              fontFamily: 'Open Sans',fontSize: 16.0)),
      ),
    );
  }


  Material address() {
    return Material(
      shadowColor: Color(0xfffcfcfc),
      elevation: 0.0,
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(4.0),
      child: TextField(
        maxLines: 3,
         controller: _addressController,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            border: InputBorder.none,
            labelStyle: TextStyle(
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
            hintText: 'Enter your address',
            hintStyle: TextStyle(
              fontFamily: 'Open Sans',fontSize: 16.0)),
      ),
    );
  }

  Material pincode() {
    return Material(
      shadowColor: Color(0xfffcfcfc),
      elevation: 0.0,
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(4.0),
      child: TextField(
        keyboardType: TextInputType.number,
         controller: _pincodeController,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            border: InputBorder.none,
            labelStyle: TextStyle(
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
            hintText: 'Pincode',
            hintStyle: TextStyle(
              fontFamily: 'Open Sans',fontSize: 16.0)),
      ),
    );
  }



   Material name() {
    return Material(
                    shadowColor: Color(0xfffcfcfc),
                    elevation: 0.0,
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(4.0),
                    child: TextField(
                     
                       controller: _nameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal:20,vertical: 15),
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                            fontFamily: 'Open Sans',
                           
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                          hintText: 'Enter your full name',
                          hintStyle: TextStyle(
                            fontFamily: 'Open Sans',fontSize: 16.0)),
                    ),
                  );


                  
  }

   Material mobile() {
    return Material(
                    shadowColor: Color(0xfffcfcfc),
                    elevation: 0.0,
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(4.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                       controller: _mobileController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal:20,vertical: 15),
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                            fontFamily: 'Open Sans',
                           
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                          hintText: 'Enter your mobile number',
                          hintStyle: TextStyle(
                            fontFamily: 'Open Sans',fontSize: 16.0)),
                    ),
                  );


                  
  }

  Container login(context) {
    return Container(
      width: double.infinity,
      height: 43.0,
      // padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0,10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: Colors.red[600],
      ),
      child: FlatButton(
        child: Text(
          'Register',
          style: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        textColor: Colors.white,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        onPressed: () {
         !isLoading? _sendCodeToPhoneNumber():print('wait');
        },
      ),
    );
  }

   

  Widget _buildMenu(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.transparent,
        // border: const Border(
        //   top: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
        //   bottom: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
        // ),
      ),
      height: 58.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        child: SafeArea(
          top: false,
          bottom: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          ),
        ),
      ),
    );
  }




  Widget genderInput(BuildContext context) {
    return  Container(
       width: double.infinity,
      height: 50.0,
                      padding: EdgeInsets.symmetric(
                          vertical: 17.0, horizontal: 15.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(brightness: Brightness.light,
                            canvasColor: Colors.grey[200]),
                        child: DropdownButtonHideUnderline(
                                                  child: DropdownButton<String>(
                            isDense: true,
                            isExpanded: true,
                            value: genderValue,
                            hint: Text(
                              'Gender',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                  color: Colors.grey,
                                 ),
                            ),
                            items:
                                <String>['Male', 'Female','Others'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',color: Colors.grey[600])),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                          genderValue = value;
                                        });
                            },
                          ),
                        ),
                      ),
                    );
                  
  }


  Widget categories(BuildContext context) {
    return  Container(
       width: double.infinity,
      height: 50.0,
                      padding: EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 15.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(brightness: Brightness.light,
                            canvasColor: Colors.grey[200]),
                        child: DropdownButtonHideUnderline(
                                                  child: DropdownButton<String>(
                            isDense: true,
                            isExpanded: true,
                            value: categoriesValue,
                            hint: Text(
                              'Categories',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                  color: Colors.grey,
                                  ),
                            ),
                            items:
                                <String>['I\'m not a BITian', 'I\'m a BITian'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',color: Colors.grey[600])),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                if(value == 'I\'m a BITian')physio = 1;
                                else physio = 0;
                                categoriesValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                    );
                  
  }

  Future<void> _sendCodeToPhoneNumber() async {
    setState(() {
          isLoading = true;
    });
    final PhoneVerificationCompleted verificationCompleted = (AuthCredential credential) {
      setState(() {
          isLoading = false;
    });
         Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
      setState(() {

          print('Inside _sendCodeToPhoneNumber: signInWithPhoneNumber auto succeeded: $credential');
      });
    };

    final PhoneVerificationFailed verificationFailed = (AuthException authException) {
       
      setState(() {
        print('Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');}
        );
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      this.verificationId = verificationId;
      print("code sent to " + _mobileController.text);
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (String verificationId) {
      this.verificationId = verificationId;
      print("Please check mobile");
      setState(() {
          isLoading = false;
    });
       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Otp(verificationId,false)),
                      );
    };

     await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91"+_mobileController.text,
        timeout: const Duration(seconds: 1),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

}





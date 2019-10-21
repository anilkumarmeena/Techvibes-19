import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techvibes19/pages/Home.dart';


class Otp extends StatefulWidget {
  final varificationId,loggedin;
  Otp(this.varificationId,this.loggedin);
  @override
  OtpState createState() {
    return new OtpState();
  }
}

class OtpState extends State<Otp> with SingleTickerProviderStateMixin {
  
  Animation animation, delayedAnimation;

  AnimationController animationController;

  final TextEditingController _otp1Controller = new TextEditingController();
  final TextEditingController _otp2Controller = new TextEditingController();
  final TextEditingController _otp3Controller = new TextEditingController();
  final TextEditingController _otp4Controller = new TextEditingController();
  final TextEditingController _otp5Controller = new TextEditingController();
  final TextEditingController _otp6Controller = new TextEditingController();
   final FocusNode _firstInputFocusNode = new FocusNode();
   final FocusNode _secondInputFocusNode = new FocusNode();
   final FocusNode _thirdInputFocusNode = new FocusNode();
   final FocusNode _fourthInputFocusNode = new FocusNode();
   final FocusNode _fifthInputFocusNode = new FocusNode();
   final FocusNode _sixthInputFocusNode = new FocusNode();

  bool isLoading = false;
  @override
  void initState() {
     
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Curves.fastOutSlowIn, parent: animationController));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
        parent: animationController));

   
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          backgroundColor: Color(0xffffffff),
          body: ListView(
            children: <Widget>[
              Transform(
                transform: Matrix4.translationValues(
                    animation.value * width, 0.0, 0.0),
                child: Container(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Center(
                    child: Image.asset(
                      'assets/logo.png',
                      width: 100.0,
                    ),
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.translationValues(
                    animation.value * width, 0.0, 0.0),
                child: Container(
                 padding: EdgeInsets.only(bottom: 30.0),
                  // child: Center(
                  //   child: Image.asset(
                  //     'assets/logo-text.png',
                  //     width: 180.0,
                  //   ),
                  // ),
                ),
              ),
              Transform(
                transform: Matrix4.translationValues(
                    delayedAnimation.value * width, 0.0, 0.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Center(
                        child: Text('Verify Phone',
                            style: TextStyle(
                                fontFamily: 'Open Sans',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 28.0)),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 25.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              otp_1(),
                              SizedBox(width: 5.0,),
                              otp_2(),
                               SizedBox(width: 5.0,),
                              otp_3(),
                               SizedBox(width: 5.0,),
                              otp_4(),
                               SizedBox(width: 5.0,),
                              otp_5(),
                               SizedBox(width: 5.0,),
                              otp_6(),
                            ],
                          ),
                          SizedBox(height: 25),
                          login_btn(context),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap:(){
                                // otpresend(context);
                              },
                              child: Text('Resend Otp!',
                              style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0)),
                            ),
                          ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Container login_btn(context) {
    return !isLoading
        ? Container(
            width: double.infinity,
            height: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Colors.red[600]),
            child: FlatButton(
              child: Text(
                'Verify',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Open Sans',
                ),
              ),
              textColor: Colors.white,
              color: Colors.transparent,
              onPressed: () {
                setState(() {
                  _signInWithPhoneNumber(widget.varificationId,_otp1Controller.text+_otp2Controller.text+_otp3Controller.text+_otp4Controller.text+_otp5Controller.text+_otp6Controller.text);
                });
              },
            ),
          )
        : Container(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            height: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Color(0xffD95068)),
            child: FlatButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 20.0,
                  ),
                  Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Color(0xff00d2ff),
                      strokeWidth: 2.0,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                ],
              ),
              textColor: Colors.white,
              color: Colors.transparent,
              onPressed: () {},
            ),
          );
  }

  Expanded otp_1() {
    return Expanded(
          child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(3.0),
        color: Color(0xff284E71),
        child: TextField(
          inputFormatters: [
           LengthLimitingTextInputFormatter(1),
          ],
           
          focusNode: _firstInputFocusNode,
        keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.white),
            controller: _otp1Controller,
            textInputAction: TextInputAction.next,
            onChanged: (text) {
          if(text == '')
              {
                FocusScope.of(context).requestFocus(_firstInputFocusNode);
              }else{
         
              FocusScope.of(context).requestFocus(_secondInputFocusNode);
              }
  },

            decoration: InputDecoration(
                
                border: InputBorder.none,
               
                
                contentPadding: EdgeInsets.only(
                    left: 20.0, top: 17.0, bottom: 17.0, ),
                hintStyle: TextStyle(
                    color: Color(0xffffffff),
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0))),
      ),
    );
  }

  Expanded otp_2() {
    return Expanded(
          child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(3.0),
        color: Color(0xff284E71),
        child: TextField(
         inputFormatters: [
           LengthLimitingTextInputFormatter(1),
          ],
           textInputAction: TextInputAction.next,
            onChanged: (text) {
         if(text == '')
              {
                FocusScope.of(context).requestFocus(_firstInputFocusNode);
              }else{
          FocusScope.of(context).requestFocus(_thirdInputFocusNode);
               
              }
  },
          focusNode: _secondInputFocusNode,
          keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.white),
            controller: _otp2Controller,
            decoration: InputDecoration(
                border: InputBorder.none,
               
                
                contentPadding: EdgeInsets.only(
                    left: 20.0, top: 17.0, bottom: 17.0, ),
                hintStyle: TextStyle(
                    color: Color(0xffffffff),
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0))),
      ),
    );
  }

  Expanded otp_3() {
    return Expanded(
          child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(3.0),
        color: Color(0xff284E71),
        child: TextField(
         inputFormatters: [
           LengthLimitingTextInputFormatter(1),
          ],
           textInputAction: TextInputAction.next,
            onChanged: (text) {
          if(text == '')
              {
                FocusScope.of(context).requestFocus(_secondInputFocusNode);
              }else{
         
               FocusScope.of(context).requestFocus(_fourthInputFocusNode);
              }
  },
   focusNode: _thirdInputFocusNode,
          keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.white),
            controller: _otp3Controller,
            decoration: InputDecoration(
                border: InputBorder.none,
               
                
                contentPadding: EdgeInsets.only(
                    left: 20.0, top: 17.0, bottom: 17.0, ),
                hintStyle: TextStyle(
                    color: Color(0xffffffff),
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0))),
      ),
    );
  }

  Expanded otp_4() {
    return Expanded(
          child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(3.0),
        color: Color(0xff284E71),
        child: TextField(
         inputFormatters: [
           LengthLimitingTextInputFormatter(1),
          ],
           textInputAction: TextInputAction.next,
            onChanged: (text) {
           if(text == '')
              {
                FocusScope.of(context).requestFocus(_thirdInputFocusNode);
              }else{
         
               FocusScope.of(context).requestFocus(_fifthInputFocusNode);
              }
  },
  focusNode: _fourthInputFocusNode,
          keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.white),
            controller: _otp4Controller,
            decoration: InputDecoration(
                border: InputBorder.none,
               
                
                 contentPadding: EdgeInsets.only(
                    left: 20.0, top: 17.0, bottom: 17.0, ),
                hintStyle: TextStyle(
                    color: Color(0xffffffff),
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0))),
      ),
    );
  }

  Expanded otp_5() {
    return Expanded(
          child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(3.0),
        color: Color(0xff284E71),
        child: TextField(
          inputFormatters: [
           LengthLimitingTextInputFormatter(1),
          ],
           textInputAction: TextInputAction.next,
            onChanged: (text) {
           if(text == '')
              {
                FocusScope.of(context).requestFocus(_fourthInputFocusNode);
              }else{
         
               FocusScope.of(context).requestFocus(_sixthInputFocusNode);
              }
  },
  focusNode: _fifthInputFocusNode,
          keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.white),
            controller: _otp5Controller,
            decoration: InputDecoration(
                border: InputBorder.none,
               
                
                 contentPadding: EdgeInsets.only(
                    left: 20.0, top: 17.0, bottom: 17.0, ),
                hintStyle: TextStyle(
                    color: Color(0xffffffff),
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0))),
      ),
    );
  }

  Expanded otp_6() {
    return Expanded(
          child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(3.0),
        color: Color(0xff284E71),
        child: TextField(
          inputFormatters: [
           LengthLimitingTextInputFormatter(1),
          ],
            onChanged: (text) {
                if(text == '')
              {
                FocusScope.of(context).requestFocus(_fifthInputFocusNode);
              }
          
  },
          focusNode: _sixthInputFocusNode,
          keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.white),
            controller: _otp6Controller,
            decoration: InputDecoration(
                border: InputBorder.none,
               
                
                 contentPadding: EdgeInsets.only(
                    left: 20.0, top: 17.0, bottom: 17.0, ),
                hintStyle: TextStyle(
                    color: Color(0xffffffff),
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0))),
      ),
    );
  }
  

_signInWithPhoneNumber(_verificationId,code) async {
    FirebaseAuth _auth;
   AuthCredential credential =  PhoneAuthProvider.getCredential (
      verificationId: _verificationId,
      smsCode: code,
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    setState(() {
      if (user != null) {
         Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
      } else {
        print("sorry wrong otp");
      }
    });
  }
}

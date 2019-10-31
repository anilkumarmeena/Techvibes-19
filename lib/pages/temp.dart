import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:techvibes19/pages/Aboutus.dart';
import 'package:techvibes19/pages/registered.dart';

class FancyFab extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  FancyFab({this.onPressed, this.tooltip, this.icon});

  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<FancyFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Color(0xff004851),
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget res() {
    return Container(
      child: FloatingActionButton(
        heroTag: 'registered',
        onPressed: (){
          Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Registered()),
                      );
        },
        tooltip: 'Add',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.event_available),
            Text("Registered",
            style: TextStyle(
                fontFamily: 'segeo',
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 7.0,
                // fontStyle: FontStyle.italic
              ))
          ],
        ),
      ),
    );
  }

  Widget add() {
    return Container(
      child: FloatingActionButton(
        heroTag: 'Results',
        onPressed: null,
        tooltip: 'Add',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.library_books),
            Text("Results",
            style: TextStyle(
                fontFamily: 'segeo',
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 8.0,
                // fontStyle: FontStyle.italic
              ))
          ],
        ),
      ),
    );
  }

  Widget image() {
    return Container(
      child: FloatingActionButton(
        heroTag: 'gallery',
        onPressed: (){
          Share.share('check out my app ');
        },
        tooltip: 'Image',
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.share),
            Text("Share",
            style: TextStyle(
                fontFamily: 'segeo',
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 8.0,
                // fontStyle: FontStyle.italic
              ))
          ],
        ),
      ),
    );
  }

  Widget inbox() {
    return Container(
      child: FloatingActionButton(
        heroTag: 'c',
        onPressed: (){
          Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Aboutus()),
                      );
        },
        tooltip: 'About',
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.info_outline),
            Text("About",
            style: TextStyle(
                fontFamily: 'segeo',
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 8.0,
                // fontStyle: FontStyle.italic
              ))
          ],
        ),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        heroTag: 'd',
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 4.0,
            0.0,
          ),
          child: image(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 3.0,
            0.0,
          ),
          child: add(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: res(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: inbox(),
        ),
        toggle(),
      ],
    );
  }
}
import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final double miniWidth;

  final double height;
  final  fontWeight;
  final String title;
  final bool loading;
  final double titleSize;
  final double cornerRadius;
  final Color titleColor;
  final Color btnBgColor;
  final Function onPressed;

  MyButton(
      {@required this.miniWidth,

        @required this.height,
        @required this.cornerRadius,
        @required this.fontWeight,
      @required this.title,
      @required this.titleSize,
      @required this.titleColor,
      @required this.btnBgColor,
      this.onPressed,
      this.loading});

  @override
  _MyButtonState createState() {
    return _MyButtonState();
  }
}

class _MyButtonState extends State<MyButton> {
  @override
  void initState() {
    super.initState();
  }
var screenWidth,screenHeight;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width*0.04/14.5;
    screenHeight = MediaQuery.of(context).size.height;
    return ButtonTheme(
      height:widget.height,
      minWidth: widget.miniWidth ?? double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(widget.cornerRadius ?? 10.0),
      ),
      child: RaisedButton(
        child: Text(
                widget.title,
                style: TextStyle(
                    color: widget.titleColor,
                     fontFamily: 'SourceSansPro',
                    letterSpacing: screenWidth*0.2,
                    fontSize: widget.titleSize,
                    fontWeight: widget.fontWeight),
              ),
        color: widget.btnBgColor,
        onPressed: () {
          setState(() {
            widget.onPressed();
          });
        },
      ),
    );
  }
}

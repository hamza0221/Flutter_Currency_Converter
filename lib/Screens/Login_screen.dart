import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:Mintin_techTest/Screens/Convert.dart';
import 'package:Mintin_techTest/components/button.dart';
import 'package:Mintin_techTest/constants/colorConstant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  //login
    var screenWidth, screenHeight;
      bool isLoadingfb = false;





  FocusNode passwordFocus = FocusNode();

  StreamController<String> passwordStreamcontroller;
    TextEditingController passwordController = new TextEditingController();


 
  /* Widget getFirst() {
    if (isUserLogged()) return DrawerScreen();
  }*/

  void initPrefs() async {
   
  }

  @override
  void initState() {
    //initPrefs();

    /* if (isUserLogged()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }*/

    // TODO: implement initState
    super.initState();

  }


  @override
  void dispose() {

    passwordStreamcontroller.close();
  }



  


  // Future<void> _handleSignOut() => _googleSignIn.disconnect();

  //facebook
  void initiateFacebookLogin() async {
    print("started");
    FacebookLogin facebookLogin = FacebookLogin();

    var facebookLoginResult =
        await facebookLogin.logIn(['email']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        print("???");
        //print(Fac;ebookLoginStatus.error.)
        setState(() {
          isLoadingfb = false;
        });
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        setState(() {
          isLoadingfb = false;
        });
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        setState(() {
          isLoadingfb = true;
        });

        var graphResponse = await get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${facebookLoginResult.accessToken.token}');

        var profile = json.decode(graphResponse.body);
        print(profile.toString());
        Navigator.push(
        context, MaterialPageRoute(builder: (context) => ConvertScreen()));
        // set value

        //00FF00

       
        break;
    }
  }
  BoxDecoration myBoxDecorationButton(String colorhex){
  return BoxDecoration(
  color: Hexcolor(colorhex),
  borderRadius: BorderRadius.all(
        Radius.circular(5.0) //         <--- border radius here
    ),
   
  );
}



  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width * 0.04 / 14.5;
    screenHeight = MediaQuery.of(context).size.height * 0.02 / 14;
    return Scaffold(
      
      appBar: AppBar(
            backgroundColor: Hexcolor("#fed797"),
            elevation: 0.0,
            centerTitle: true,
    
            title: Text(
              "log in to your app",
             textAlign: TextAlign.center,
              style: TextStyle(
                              color: Colors.black),
                        ),
             
           
           
          ),
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(screenWidth * 16, screenWidth * 40,
            screenWidth * 16, screenWidth * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          
       
           
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                     
                        style: TextStyle(
                            color: Color(0xff231F20),
                            fontFamily: 'SourceSansPro',
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth * 21),
                            
                     
                        decoration: InputDecoration(
                            hintText:  'UserName or Email',
                            hintStyle: TextStyle(
                                color: ColorConstant.lightGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 21)),
                      ),
                   
                      SizedBox(
              height: screenHeight * 60,
            ),
           
            
            TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: passwordController,
                        obscureText: true,


                     
                        style: TextStyle(
                            color: Color(0xff231F20),
                            fontFamily: 'SourceSansPro',
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth * 21),
                     
                        decoration: InputDecoration(
                            hintText:  'Password',
                            hintStyle: TextStyle(
                                color: ColorConstant.lightGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 21)),
                      ),
                   
              
             
           
               SizedBox(
              height: screenHeight * 50,
            ),
      
              MyButton(
                title: /*'$logintitle'*/ 'LOG IN',
                height: screenWidth * 64.0,
                fontWeight: FontWeight.w600,
                titleSize: screenWidth * 18,
                titleColor: Colors.white,
                miniWidth: MediaQuery.of(context).size.width,
                btnBgColor: Hexcolor("#fed797"),
                
                onPressed: () {
                  Navigator.push(
        context, MaterialPageRoute(builder: (context) => ConvertScreen()));
                 
                
                
                  //disableLoadbar();
                },

                /*_select_user_mail(
                  emailController.text.trim(), passwordController.text.trim()),*/
              ),
              
            SizedBox(
              height: screenHeight * 40,
            ),

                Row(
              mainAxisAlignment: MainAxisAlignment.center, 
            mainAxisSize: MainAxisSize.max,
              
              
              children: [
                Container(
                  height: screenHeight * 1,
                  width: screenWidth * 150,
                  color: ColorConstant.darkGray
                ),
                 SizedBox(
              width: screenHeight * 4,
            ),
                Text(
              "OR",
             textAlign: TextAlign.center,
              style: TextStyle(
                              color: Colors.black),
                        ),
                         SizedBox(
              width: screenHeight * 4,
            ),
                        Container(
                  height: screenHeight * 1,
                  width: screenWidth * 150,
                  color: ColorConstant.darkGray,
                ),




            ],),
             
             
           

            SizedBox(
              height: screenHeight * 65,
            ),
            Container(
          // width: 289,
           height: 60*screenHeight,
           //padding: EdgeInsets.only(top:41),
           alignment: Alignment.center,
           decoration: myBoxDecorationButton("#3c4858"),
           child: Row(children: <Widget>[
             Padding(
                padding: EdgeInsets.only(left: 15),

           child:new Image.asset('assets/images/facebook.png', alignment: Alignment.centerLeft,
           width: 40,height: 40,),
           ),
            SizedBox(
              width: screenHeight * 50,
            ),
           

           Text("Login with Facebook",style: TextStyle(fontSize: 18.0, color: Colors.white)),
   
           ])

),
SizedBox(
              height: screenHeight * 20,
            ),
           
      Container(
          // width: 289,
           height: 60*screenHeight,
           //padding: EdgeInsets.only(top:41),
           alignment: Alignment.center,
           decoration: myBoxDecorationButton("#8492a6"),
           child: Row(children: <Widget>[
             Padding(
                padding: EdgeInsets.only(left: 15),

           child:new Image.asset('assets/images/twitter.png', alignment: Alignment.centerLeft,
           width: 40,height: 40,),
           ),
            SizedBox(
              width: screenHeight * 50,
            ),
           

           Text("Login with Twitter",style: TextStyle(fontSize: 18.0, color: Colors.white)),
   
           ])

),

          
        
           
          ],
        ),
      ),
    ));
  }

  void _google() {}

  void _facebook() {}

  void _createaccount() {
   // Navigator.push(
        //context, MaterialPageRoute(builder: (context) => RegisterScreen()));
  }

  

  
  
 

}

//this is last change

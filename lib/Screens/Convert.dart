import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:Mintin_techTest/Config/Config.dart';
import 'package:Mintin_techTest/components/button.dart';
import 'package:Mintin_techTest/constants/colorConstant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';


class ConvertScreen extends StatefulWidget {
  @override
  _ConvertScreenState createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen> {
      TextEditingController valueRcontroller = new TextEditingController();
      TextEditingController newvaluecontroller = new TextEditingController();


  
  //login
    var screenWidth, screenHeight;
      bool isLoadingfb = false;
        List<String> namelist = ['USD', 'TRY', 'BGD', 'HKD', 'NZD', ];
          String namedata;
          String $newvalue;










 
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

  }



  


  // Future<void> _handleSignOut() => _googleSignIn.disconnect();

  //facebook

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
              "Currency conversion",
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
                  Text(
                          "CURRENCY TYPE",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: ColorConstant.darkGray),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Container(
                          height: 60,
                          //width: 154,

                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                items: namelist
                                    .map((
                                      value,
                                    ) =>
                                        DropdownMenuItem(
                                          child: Text(value,
                                              style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      ColorConstant.textColor)),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (newVal) {
                                  setState(() {
                                    namedata = newVal;
                                  });
                                },
                                isExpanded: true,
                                value: namedata,
                                hint: Text('USD',
                                    style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 21,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                              ),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                       
                        ),
                         SizedBox(
                          height: 8,
                        ),
                          TextFormField(
                            controller: valueRcontroller,
                        keyboardType: TextInputType.emailAddress,
                     
                        style: TextStyle(
                            color: Color(0xff231F20),
                            fontFamily: 'SourceSansPro',
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth * 18),
                            
                     
                        decoration: InputDecoration(
                            hintText:  "value R ",
                            hintStyle: TextStyle(
                                color: ColorConstant.lightGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 18)),
                      ),
                        SizedBox(
                          height: 60*screenWidth,
                        ),
                         Text(
                          "Desired Currency",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: ColorConstant.darkGray),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Container(
                          height: 60,
                          //width: 154,

                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                items: namelist
                                    .map((
                                      value,
                                    ) =>
                                        DropdownMenuItem(
                                          child: Text(value,
                                              style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      ColorConstant.textColor)),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (newVal) {
                                  setState(() {
                                    namedata = newVal;
                                  });
                                },
                                isExpanded: true,
                                value: namedata,
                                hint: Text('EUR',
                                    style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 21,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                              ),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                       
                        ),
                         SizedBox(
                          height: 8,
                        ),
                          TextFormField(
                            controller: newvaluecontroller,
                        keyboardType: TextInputType.emailAddress,
                        
                        
                     
                        style: TextStyle(
                            color: Color(0xff231F20),
                            fontFamily: 'SourceSansPro',
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth * 18),
                            
                     
                        decoration: InputDecoration(
                            hintText:  "New value ",
                            hintStyle: TextStyle(
                                color: ColorConstant.lightGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 18)),
                      ),
                        SizedBox(
                          height: 60*screenWidth,
                        ),
          
       
           Padding
           (padding: EdgeInsets.only(right:screenWidth *60,left:screenWidth *60),
           child:
                   
              MyButton(
                title: /*'$logintitle'*/ 'Convert',
                height: screenWidth * 50.0,
                
                fontWeight: FontWeight.w600,
                titleSize: screenWidth * 18,
                titleColor: Colors.white,
                miniWidth: MediaQuery.of(context).size.width,
                btnBgColor: Hexcolor("#fed797"),
                
                onPressed: () {
                  _convertStatic();

                 
                  //disableLoadbar();
                },

                /*_select_user_mail(
                  emailController.text.trim(), passwordController.text.trim()),*/
              ),),
              
            SizedBox(
              height: screenHeight * 40,
            ),

              
             
             
           

        
           

   



          
        
           
          ],
        ),
      ),
    ));
  }



  void _convert(String from, String to,String amount) async {
    var queryParametersSelectUser = {
      'from': from,
      'password': to,
      'amount':amount,
    };
    var convertUrl =
        Uri.https(Config.APi_URL, '/convert', queryParametersSelectUser);

    var response = await get(convertUrl);
    Map data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("cool");

    } else {
      print("problem is"+data["message"].toString());
   
    }
   


    }
     void _convertStatic(){
       try{
      newvaluecontroller.text = (int.parse(valueRcontroller.text.toString())*1.5).toString();
      }
      catch(_e){


      }

  
  }
  

  
  
 

}

//this is last change

import 'dart:async';
import 'package:Mintin_techTest/Services/Api_Services.dart';
import 'package:Mintin_techTest/Services/RecordsBloc.dart';
import 'package:Mintin_techTest/Services/SQL_database.dart';
import 'package:Mintin_techTest/components/button.dart';
import 'package:Mintin_techTest/constants/colorConstant/color_constant.dart';
import 'package:Mintin_techTest/models/ConversionRate.dart';
import 'package:Mintin_techTest/models/Conversition_record.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ConvertScreen extends StatefulWidget {
  @override
  _ConvertScreenState createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen> {
  String namedata1 = 'Euro';
  String namedata2 = 'American Dollar';
  TextEditingController valueRcontroller = new TextEditingController();
  TextEditingController newvaluecontroller = new TextEditingController();
  Future<ConversionRate> futureConversionRate;
  ApiService apiService = new ApiService();
  ConversionRate conversionRate;
  var screenWidth, screenHeight;
  bool isLoadingfb = false;
  final bloc = RecordsBloc();

  List<String> namelist = [
    'American Dollar',
    'Turkish Lira',
    'Euro',
    'Hong kong Dollar',
    'new zealand dollar'
  ];

  String $newvalue;

  void initPrefs() async {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    valueRcontroller.dispose();
    newvaluecontroller.dispose();
    bloc.dispose();
    super.dispose();



  }

  BoxDecoration myBoxDecorationButton(String colorhex) {
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
            style: TextStyle(color: Colors.black),
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
                                          color: ColorConstant.textColor)),
                                  value: value,
                                ))
                            .toList(),
                        onChanged: (newVal) {
                          setState(() {
                            namedata1 = newVal;
                          });
                        },
                        isExpanded: true,
                        value: namedata1,
                        hint: Text(namedata1,
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
                      hintText: "Amount here",
                      hintStyle: TextStyle(
                          color: ColorConstant.lightGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * 18)),
                ),
                SizedBox(
                  height: 60 * screenWidth,
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
                                          color: ColorConstant.textColor)),
                                  value: value,
                                ))
                            .toList(),
                        onChanged: (newVal) {
                          setState(() {
                            namedata2 = newVal;
                          });
                        },
                        isExpanded: true,
                        value: namedata2,
                        hint: Text(namedata2,
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
                      hintText: "New value ",
                      hintStyle: TextStyle(
                          color: ColorConstant.lightGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * 18)),
                ),
                SizedBox(
                  height: 60 * screenWidth,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: screenWidth * 60, left: screenWidth * 60),
                  child: MyButton(
                    title: /*'$logintitle'*/ 'Convert',
                    height: screenWidth * 50.0,
                    fontWeight: FontWeight.w600,
                    titleSize: screenWidth * 18,
                    titleColor: Colors.white,
                    miniWidth: MediaQuery.of(context).size.width,
                    btnBgColor: Hexcolor("#fed797"),
                    onPressed: () {
                      _convert(
                          _getCur_Code(namedata1), _getCur_Code(namedata2));
                    },
                  ),
                ),
                SizedBox(
                  height: screenHeight * 40,
                ),
              ],
            ),
          ),
        ));
  }

  void _convert(String from, String to) async {
    futureConversionRate = apiService.fetchConversionRate(from, to);
    futureConversionRate.then((value) =>
        //print("plz"+value.base+value.date+value.rates.symbollsValue.toString());
        conversionRate = value).whenComplete(() {
         print("base2"+conversionRate.base);
    double currto = conversionRate.rates.symbollsValue;
    double result = double.parse(valueRcontroller.text.toString()) * currto;
    _setConvertedValue(result);
    //!(futureConversionRate == null) ??
        bloc.add(new ConversionRecord.withoutid(
            conversionRate.base,
            currto.toString(),
            valueRcontroller.text,
            result.toString(),
            new DateTime.now().toString()));
        }
        );
       
  }


   

  void _setConvertedValue(double result) {
    try {
      newvaluecontroller.text = (result).toString();
    } catch (_e) {}
  }

  String _getCur_Code(String listitem) {
    switch (listitem) {
      case 'American Dollar':
        return "USD";
        break;
      case 'Turkish Lira':
        return "TRY";

        break;
      case 'Euro':
        return "EUR";

        break;
      case 'Hong kong Dollar':
        return "HKD";

        break;
      case 'new zealand dollar':
        return "NZD";

        break;
    }

  }
  
}

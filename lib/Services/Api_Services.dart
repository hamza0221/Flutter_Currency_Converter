
import 'dart:async';
import 'dart:convert';
import 'package:Mintin_techTest/Config/Config.dart';
import 'package:Mintin_techTest/models/ConversionRate.dart';
import 'package:http/http.dart';

class ApiService {



  /*Future<List<Reminder>> getReminders() async {
    Response response = await http.get('https://ws.interface-crm.com:444/get_translated_notifcations?id_user=2a38a4a9316c49e5a833517c45d31070&id_language=a5771bce93e200c36f7cd9dfd0e5deaa');
    if (response.statusCode == 200) {

      final decoded = jsonDecode(response.body) as Map;
      for (final type in decoded.keys) {
        final value = decoded[type];
        final content= decoded[type]['content'];
        print('type='+ '$type' +'contenu='+'$content' );
        for(final notif in content){
          print('active');// prints entries like "AED,3.672940"
        }
      }
      //return parseReminders(response.body);
    } else {
      throw Exception('Unable to fetch reminders from the REST API');
    }
  }*/

 Future<ConversionRate> fetchConversionRate(String from,String to) async {


 var queryParametersConvert = {
      'base': from,
      'symbols': to,
    };
    var convertUrl =
        Uri.https(Config.APi_URL, '/latest', queryParametersConvert);
        print("uri is"+convertUrl.toString());

    final response = await get(convertUrl);
    Map data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("cool");
      print(data["rates"][to]);
      return ConversionRate.fromJson(jsonDecode(response.body),to);


    } else {
      print("problem is"+data["message"].toString());
   
    }




 }}
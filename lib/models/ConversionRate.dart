
class ConversionRate {

  final String base;
  final String date;
  final Rates rates;
  ConversionRate({
    this.base,
    this.date,
    this.rates
});

factory ConversionRate.fromJson(Map<String, dynamic> jsonO,String symbollentrie) {
    return ConversionRate(
      base: jsonO['base'],
      date: jsonO['date'],
      rates:Rates.fromJson(jsonO['rates'], symbollentrie),
    );
  }


}
class Rates{
  double symbollsValue;
    Rates({
    this.symbollsValue,
 
});
factory Rates.fromJson(Map<String, dynamic> jsonO,String symbollentrie) {
    return Rates(
      symbollsValue: jsonO[symbollentrie],
    );
  }



}
  

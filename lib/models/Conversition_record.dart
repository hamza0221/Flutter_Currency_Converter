
class ConversionRecord {
  int id;
  String from;
  String to;
  String amount;
  String result;
  String date;
  ConversionRecord(
      {this.id, this.from, this.to, this.amount, this.result, this.date});

  ConversionRecord.all(
      this.id, this.from, this.to, this.amount, this.result, this.date);

  ConversionRecord.withoutid(
      this.from, this.to, this.amount, this.result, this.date);

  factory ConversionRecord.fromMap(Map<String, dynamic> json) =>
      new ConversionRecord(
        id: json["id"],
        from: json["from"],
        to: json["to"],
        amount: json["amount"],
        result: json["result"],
        date: json["date"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "from": from,
        "to": to,
        "amount": amount,
        "result": result,
        "date": date,
      };


        @override
  String toString() {
    return "Conversion record [id=${this.id},from=${this.from},to=${this.to},amount=${this.amount},result=${this.result},date=${this.date}]";
  }
}

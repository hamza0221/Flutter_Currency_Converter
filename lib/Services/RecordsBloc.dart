import 'dart:async';

import 'package:Mintin_techTest/Services/SQL_database.dart';
import 'package:Mintin_techTest/models/Conversition_record.dart';

class RecordsBloc {
  RecordsBloc() {
    getRecords();
  }
  final _recordsController =
      StreamController<List<ConversionRecord>>.broadcast();
  get clients => _recordsController.stream;

  dispose() {
    _recordsController.close();
  }

  getRecords() async {
    print("async get");
    _recordsController.sink.add(await DBProvider.db.getAllConversionRecord());
  }
  

delete(int id) {
  DBProvider.db.deleteConversionRecord(id);
      getRecords();

}

add(ConversionRecord record) {
  DBProvider.db.newConversionRecord(record);
      getRecords();
}




}

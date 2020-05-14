import 'dart:async';

import 'package:qrscanner/src/providers/db_provider.dart';



class ScansBloc{

  static final ScansBloc _singleton = new ScansBloc._internal();

  factory ScansBloc(){
    return _singleton;
  }

  ScansBloc._internal(){

    //Obtener Scans de la base de datos
    obtenerScans();
    borrarScans();

  } 


  final _scansController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>>  get scansStream => _scansController.stream;


  dispose(){

    _scansController.close();
  }

  obtenerScans() async {

    _scansController.sink.add( await DBProvider.db.getTodosScan());


  }

  borrarScans(int id) async {

    await DBProvider.db.deleteScan(id);
    obtenerScans();
  }

  




  


}
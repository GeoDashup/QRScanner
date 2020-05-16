import 'package:flutter/material.dart';

import 'package:qrscanner/src/models/scan_model.dart';
import 'package:qrscanner/src/bloc/scans_bloc.dart';

import 'package:qrscanner/src/utils/utils.dart' as utils;



class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<List<ScanModel>>(

      stream: ScansBloc().scansStream ,
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {

        if( !snapshot.hasData ){
          return Center(
            child: CircularProgressIndicator(),
            
          );

          }

        final scans = snapshot.data;

        if(scans.length == 0){

        return Center(
              child: Text("No hay información"),
            );

          
        }

        return ListView.builder(

            itemCount: scans.length,
            itemBuilder: (context, i) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (direccion) => ScansBloc().borrarScans(scans[i].id),
              child: ListTile(
                leading: Icon(Icons.cloud_queue, color: Theme.of(context).primaryColor),
                title: Text(scans[i].valor),
                subtitle: Text("ID: ${ scans[i].id }"),
                trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).primaryColor),
                onTap: () => utils.abrirScan(scans[i])


                
                
              ),
            ),
          );


      
      },
    
    );
  }
}
import 'package:flutter/material.dart';
import 'package:qrscanner/src/pages/home_page.dart';
import 'package:qrscanner/src/pages/mapa_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Scanner',
      initialRoute: "home",
      routes: {
        "home": (BuildContext context) => HomePage(),
        "mapa": (BuildContext context) => MapaPage()
      },
      theme: ThemeData(
        primaryColor: Colors.black,
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.black)
      ),
        
      
    );
  }
}


    // return TileLayerOptions(
    //         urlTemplate: 'https://api.tiles.mapbox.com/v4/'
    //             '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
    //         additionalOptions: {
    //         'accessToken':'pk.eyJ1Ijoiam9yZ2VncmVnb3J5IiwiYSI6ImNrODk5aXE5cjA0c2wzZ3BjcTA0NGs3YjcifQ.H9LcQyP_-G9sxhaT5YbVow',
    //         'id': 'mapbox.streets'
    //         }
    // );
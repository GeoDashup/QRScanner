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
      initialRoute: "mapa",
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


    
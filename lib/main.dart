//******IMPORT******//
//*****DART_LIB*****//
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//******MY_LIB******//
import 'screens/homePage.dart';
import 'data/sensorData.dart';
//******************//

void main() => runApp(SensorListApp());

class SensorListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SensorList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Sensor Configurator",
        home: HomePage(),
      ),
    );
  }
}

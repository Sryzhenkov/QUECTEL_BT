//******IMPORT******//
//*****DART_LIB*****//
import 'package:flutter/material.dart';
//******MY_LIB******//
import 'package:quectel_bt/screens/SensorListPage.dart';
import 'package:quectel_bt/screens/NewSensorPage.dart';
//******************//

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexBottomTab = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Sensor List"),
          leading: Icon(Icons.account_tree),
        ),
        body: SensorListPage(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewSensorPage()));
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.adb_sharp),
                // ignore: deprecated_member_use
                title: Text("Bluetooth")),
            BottomNavigationBarItem(
                icon: Icon(Icons.miscellaneous_services_outlined),
                // ignore: deprecated_member_use
                title: Text("Sensors")),
          ],
          currentIndex: indexBottomTab,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}

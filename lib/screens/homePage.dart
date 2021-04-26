//******IMPORT******//
//*****DART_LIB*****//
import 'package:flutter/material.dart';
//******MY_LIB******//
import 'package:quectel_bt/screens/SensorListPage.dart';
import 'package:quectel_bt/screens/NewSensorPage.dart';
import 'package:quectel_bt/screens/BluetoothPage.dart';
//******************//

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexBottomTab = 0;
  int bluetoothState = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: indexBottomTab == 0
            ? AppBar(
                backgroundColor: Colors.blue,
                title: Text("Bluetooth Settings"),
                leading: Icon(Icons.account_tree),
                actions: [
                  IconButton(
                    icon: bluetoothState == 0
                        ? Icon(Icons.bluetooth)
                        : Icon(Icons.bluetooth_disabled),
                    tooltip: 'Bluetooth on/off',
                    onPressed: () {
                      setState(() => bluetoothState ^= 1);
                    },
                  ),
                ],
              )
            : AppBar(
                backgroundColor: Colors.blue,
                title: Text("Sensor List"),
                leading: Icon(Icons.account_tree),
              ),
        body: indexBottomTab == 0 ? BluetoothPage() : SensorListPage(),
        floatingActionButton: indexBottomTab == 0
            ? null
            : FloatingActionButton(
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
          onTap: (int index) {
            setState(() => indexBottomTab = index);
          },
        ),
      ),
    );
  }
}

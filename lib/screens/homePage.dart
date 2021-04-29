//******IMPORT******//
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
//*****DART_LIB*****//
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
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

  BluetoothState bluetoothState = BluetoothState.UNKNOWN;
  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;
  List<BluetoothDevice> devicesList = [
    BluetoothDevice(name: 'adas', address: '50:46:5D:6E:8C:20')
  ];

  Future<void> enableBluetooth() async {
    bluetoothState = await FlutterBluetoothSerial.instance.state;

    if (bluetoothState == BluetoothState.STATE_OFF) {
      await FlutterBluetoothSerial.instance.requestEnable();
      await getPairedDevices();
      return true;
    } else {
      await getPairedDevices();
    }
    return false;
  }

  Future<void> getPairedDevices() async {
    List<BluetoothDevice> devices = [];

    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {
      print("Error");
    }

    if (!mounted) {
      return;
    }

    setState(() {
      devicesList = devices;
    });
  }

  @override
  void initState() {
    super.initState();

    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        bluetoothState = state;
      });
    });

    enableBluetooth();

    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        bluetoothState = state;
        getPairedDevices();
      });
    });
  }

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
                    padding: EdgeInsets.only(right: 20.0),
                    icon: bluetoothState == BluetoothState.STATE_OFF
                        ? Icon(Icons.bluetooth_disabled)
                        : Icon(Icons.bluetooth),
                    tooltip: 'Bluetooth on/off',
                    onPressed: () {
                      future() async {
                        if (bluetoothState == BluetoothState.STATE_OFF) {
                          await FlutterBluetoothSerial.instance.requestEnable();
                        } else {
                          await FlutterBluetoothSerial.instance
                              .requestDisable();
                        }
                        bluetoothState == BluetoothState.STATE_OFF
                            ? bluetoothState = BluetoothState.STATE_ON
                            : bluetoothState = BluetoothState.STATE_OFF;
                      }

                      future().then((_) {
                        setState(() {});
                      });
                    },
                  ),
                ],
              )
            : AppBar(
                backgroundColor: Colors.blue,
                title: Text("Sensor List"),
                leading: Icon(Icons.account_tree),
              ),
        body: indexBottomTab == 0
            ? BluetoothPage(device: devicesList)
            : SensorListPage(),
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

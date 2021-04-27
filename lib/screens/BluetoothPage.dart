import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothPage extends StatelessWidget {
  BluetoothPage({this.device});
  List<BluetoothDevice> device = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount: device.length,
          itemBuilder: (contex, i) {
            return Card(
              elevation: 2.0,
              child: Container(
                color: Colors.grey[200],
                child: ListTile(
                  title: Text(device[i].name),
                  subtitle: Text(device[i].address),
                  trailing: Icon(Icons.bluetooth_connected),
                ),
              ),
            );
          }),
    );
  }
}

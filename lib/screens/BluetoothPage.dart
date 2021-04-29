import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothPage extends StatefulWidget {
  BluetoothPage({this.device});
  List<BluetoothDevice> device = [];
  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  BluetoothConnection connection;
  List<bool> connectColor = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount: widget.device.length,
          itemBuilder: (contex, i) {
            connectColor.add(false);
            return Card(
              elevation: 2.0,
              child: Container(
                color:
                    connectColor[i] == false ? Colors.grey[200] : Colors.grey,
                child: ListTile(
                  title: Text(widget.device[i].name),
                  subtitle: Text(widget.device[i].address),
                  trailing: ElevatedButton(
                    child: Icon(Icons.bluetooth_connected),
                    onPressed: () {
                      connect(widget.device[i], i);
                    },
                  ),
                ),
              ),
            );
          }),
    );
  }

  void connect(BluetoothDevice dev, int i) async {
    await BluetoothConnection.toAddress(dev.address).then((_connection) {
      print('Connected to the device');

      connection = _connection;
      setState(() {});

      connection.input.listen(null).onDone(() {
        // if (isDisconnecting) {
        //   print('Disconnecting locally!');
        // } else {
        //   print('Disconnected remotely!');
        // }
        if (this.mounted) {
          setState(() {});
        }
      });
    }).catchError((error) {
      print('Cannot connect, exception occurred');
      print(error);
    });
    connectColor[i] ^= true;
  }
}

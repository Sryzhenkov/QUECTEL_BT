import 'package:flutter/material.dart';
import 'package:quectel_bt/data/sensorData.dart';
import 'package:quectel_bt/screens/sensorInfoPage.dart';
import 'package:provider/provider.dart';

class SensorListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount:
              Provider.of<SensorList>(context, listen: false).sensors.length,
          itemBuilder: (contex, i) {
            return Card(
              elevation: 2.0,
              child: Container(
                color: Colors.grey[200],
                child: ListTile(
                  title: Text(Provider.of<SensorList>(context, listen: true)
                      .sensors[i]
                      .name),
                  leading: Text(Provider.of<SensorList>(context, listen: true)
                      .sensors[i]
                      .sensorID
                      .toString()),
                  trailing: ElevatedButton(
                    child: Icon(Icons.arrow_right_alt_sharp),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SensorInfoPage(i)),
                      );
                    },
                  ),
                  // subtitle: Text(
                  //   Provider.of<SensorList>(context, listen: false)
                  //       .sensors[i]
                  //       .ipsName,
                  //   style: TextStyle(fontWeight: FontWeight.w300),
                  // ),
                ),
              ),
            );
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quectel_bt/data/sensorData.dart';
import 'package:quectel_bt/screens/sensorInfoPage.dart';
import 'package:provider/provider.dart';

class NewSensorPage extends StatefulWidget {
  @override
  _NewSensorPageState createState() => _NewSensorPageState();
}

class _NewSensorPageState extends State<NewSensorPage> {
  bool editState = true;

  @override
  Widget build(BuildContext context) {
    var sData = Provider.of<SensorList>(context, listen: true);

    int globalID = 0000;
    int sensorID = 0;
    String viewFunction = 'u32';
    int size = 9;
    String transFunction = 'usd64';
    String sensorFunction = 'sensor';
    String modeFunction = 'monitoring';
    String name = 'sensor';
    String ipsName = 'sensor';
    int value = 0;
    int upperLimit = 9;
    int lowerLimit = 1;
    return Scaffold(
      appBar: AppBar(
        title: Text("New Sensor Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'Add',
            onPressed: () {
              setState(() {
                sData.newSensor(
                    globalID,
                    sensorID,
                    viewFunction,
                    size,
                    transFunction,
                    sensorFunction,
                    modeFunction,
                    name,
                    ipsName,
                    value,
                    upperLimit,
                    lowerLimit);
                Navigator.pop(context);
              });
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        children: [
          PropertiesCard(
            nameProperties: 'Global ID',
            propInfo: globalID.toString(),
            editState: editState,
            onChanged: (value) => globalID = int.parse(value),
          ),
          PropertiesCard(
            nameProperties: 'Sensor ID',
            propInfo: sensorID.toString(),
            editState: editState,
            onChanged: (value) => sensorID = int.parse(value),
          ),
          PropertiesCardDDB(
            nameProperties: 'View Function',
            propInfo: viewFunction.toString(),
            editState: editState,
            items: listViewFunction.map(
              (val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              },
            ).toList(),
            onChanged: (val) {
              viewFunction = val;
            },
          ),
          PropertiesCard(
            nameProperties: 'Size',
            propInfo: size.toString(),
            editState: editState,
            onChanged: (value) => size = int.parse(value),
          ),
          PropertiesCardDDB(
            nameProperties: 'Trans. Function',
            propInfo: transFunction.toString(),
            editState: editState,
            items: listTransFunction.map(
              (val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              },
            ).toList(),
            onChanged: (val) {
              transFunction = val;
            },
          ),
/*          PropertiesCardDDB(
            nameProperties: 'Sensor Function',
            propInfo: sensorFunction.toString(),
            editState: editState,
            items: .map(
              (val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              },
            ).toList(),
            onChanged: (val) {},
          ),*/
          PropertiesCardDDB(
            nameProperties: 'Mode Function',
            propInfo: modeFunction.toString(),
            editState: editState,
            items: listModeFunction.map(
              (val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              },
            ).toList(),
            onChanged: (val) {
              listModeFunction = val;
            },
          ),
          PropertiesCard(
            nameProperties: 'Name',
            propInfo: name.toString(),
            editState: editState,
            onChanged: (value) => name = value,
          ),
          PropertiesCard(
            nameProperties: 'IPS Name',
            propInfo: ipsName.toString(),
            editState: editState,
            onChanged: (value) => ipsName = value,
          ),
          PropertiesCard(
            nameProperties: 'Value',
            propInfo: value.toString(),
            editState: editState,
            onChanged: (value1) => value = int.parse(value1),
          ),
          PropertiesCard(
            nameProperties: 'Upper Limit',
            propInfo: upperLimit.toString(),
            editState: editState,
            onChanged: (value) => upperLimit = int.parse(value),
          ),
          PropertiesCard(
            nameProperties: 'Lower Limit',
            propInfo: lowerLimit.toString(),
            editState: editState,
            onChanged: (value) => lowerLimit = int.parse(value),
          ),
        ],
      ),
    );
  }
}

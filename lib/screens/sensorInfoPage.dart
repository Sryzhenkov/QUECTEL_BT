import 'package:flutter/material.dart';
import 'package:quectel_bt/data/sensorData.dart';
import 'package:provider/provider.dart';

class SensorInfoPage extends StatefulWidget {
  SensorInfoPage(this.iterator);
  final int iterator;

  @override
  _SensorInfoPageState createState() => _SensorInfoPageState(iterator);
}

class _SensorInfoPageState extends State<SensorInfoPage> {
  _SensorInfoPageState(this.iterator);
  final int iterator;
  bool editState = false;

  @override
  Widget build(BuildContext context) {
    var sData = Provider.of<SensorList>(context, listen: true);

    int globalID = sData.sensors[iterator].globalID;
    int sensorID = sData.sensors[iterator].sensorID;
    String viewFunction = sData.sensors[iterator].viewFunction;
    int size = sData.sensors[iterator].size;
    String transFunction = sData.sensors[iterator].transFunction;
    String sensorFunction = sData.sensors[iterator].sensorFunction;
    String modeFunction = sData.sensors[iterator].modeFunction;
    String name = sData.sensors[iterator].name;
    String ipsName = sData.sensors[iterator].ipsName;
    int value = sData.sensors[iterator].value;
    int upperLimit = sData.sensors[iterator].upperLimit;
    int lowerLimit = sData.sensors[iterator].lowerLimit;

    print(
        '${sData.sensors[iterator].globalID},${sData.sensors[iterator].sensorID}, ${sData.sensors[iterator].viewFunction}, ${sData.sensors[iterator].size},${sData.sensors[iterator].transFunction},${sData.sensors[iterator].sensorFunction},${sData.sensors[iterator].modeFunction},${sData.sensors[iterator].name},${sData.sensors[iterator].ipsName},${sData.sensors[iterator].value},${sData.sensors[iterator].upperLimit},${sData.sensors[iterator].lowerLimit}');
    return Scaffold(
      appBar: AppBar(
        title: Text("Sensor Info Page"),
        actions: [
          IconButton(
            icon: editState == false
                ? Icon(Icons.edit_outlined)
                : Icon(Icons.save),
            tooltip: 'Edit all',
            onPressed: () {
              setState(() {
                editState ^= true;
                if (editState == false) {
                  sData.setParam(
                      iterator,
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
                }
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
            propInfo: sData.sensors[iterator].globalID.toString(),
            editState: editState,
            onChanged: (value) => globalID = int.parse(value),
          ),
          PropertiesCard(
            nameProperties: 'Sensor ID',
            propInfo: sData.sensors[iterator].sensorID.toString(),
            editState: editState,
            onChanged: (value) => sensorID = int.parse(value),
          ),
          PropertiesCardDDB(
            nameProperties: 'View Function',
            propInfo: sData.sensors[iterator].viewFunction.toString(),
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
            propInfo: sData.sensors[iterator].size.toString(),
            editState: editState,
            onChanged: (value) => size = int.parse(value),
          ),
          PropertiesCardDDB(
            nameProperties: 'Trans. Function',
            propInfo: sData.sensors[iterator].transFunction.toString(),
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
            propInfo: sData.sensors[iterator].sensorFunction.toString(),
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
            propInfo: sData.sensors[iterator].modeFunction.toString(),
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
            propInfo: sData.sensors[iterator].name.toString(),
            editState: editState,
            onChanged: (value) => name = value,
          ),
          PropertiesCard(
            nameProperties: 'IPS Name',
            propInfo: sData.sensors[iterator].ipsName.toString(),
            editState: editState,
            onChanged: (value) => ipsName = value,
          ),
          PropertiesCard(
            nameProperties: 'Value',
            propInfo: sData.sensors[iterator].value.toString(),
            editState: editState,
            onChanged: (value1) => value = int.parse(value1),
          ),
          PropertiesCard(
            nameProperties: 'Upper Limit',
            propInfo: sData.sensors[iterator].upperLimit.toString(),
            editState: editState,
            onChanged: (value) => upperLimit = int.parse(value),
          ),
          PropertiesCard(
            nameProperties: 'Lower Limit',
            propInfo: sData.sensors[iterator].lowerLimit.toString(),
            editState: editState,
            onChanged: (value) => lowerLimit = int.parse(value),
          ),
        ],
      ),
    );
  }
}

class PropertiesCard extends StatelessWidget {
  PropertiesCard(
      {@required this.nameProperties,
      this.propInfo,
      this.editState,
      this.onChanged});

  final String nameProperties;
  final String propInfo;
  final bool editState;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6),
      elevation: 1.0,
      child: Container(
        color: Colors.grey[200],
        child: ListTile(
          title: Row(children: [
            Expanded(flex: 1, child: Text('$nameProperties')),
            Expanded(
              flex: 2,
              child: Container(
                  padding: EdgeInsets.only(left: 20.0, right: 10.0),
                  decoration: BoxDecoration(
                      color: editState == true ? Colors.white : null,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    initialValue: '$propInfo',
                    readOnly: editState == true ? false : true,
                    onChanged: onChanged,
                    // onChanged: (value) =>
                    //     globalID = int.parse(value),
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}

class PropertiesCardDDB extends StatelessWidget {
  PropertiesCardDDB(
      {@required this.nameProperties,
      this.propInfo,
      this.editState,
      this.items,
      this.onChanged});

  final String nameProperties;
  final String propInfo;
  final bool editState;
  final List<DropdownMenuItem<String>> items;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6),
      elevation: 1.0,
      child: Container(
        color: Colors.grey[200],
        child: ListTile(
          title: Row(children: [
            Expanded(flex: 1, child: Text('$nameProperties')),
            Expanded(
              flex: 2,
              child: Container(
                  padding: EdgeInsets.only(left: 20.0, right: 10.0),
                  decoration: BoxDecoration(
                      color: editState == true ? Colors.white : null,
                      borderRadius: BorderRadius.circular(20)),
                  child: editState == true
                      ? DropdownButtonFormField(
                          decoration: InputDecoration(border: InputBorder.none),
                          isExpanded: true,
                          hint: Text(
                            propInfo,
                            style:
                                TextStyle(color: Colors.blue, fontSize: 16.0),
                          ),
                          style: TextStyle(color: Colors.blue),
                          items: items,
                          onChanged: onChanged)
                      : TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          initialValue: '$propInfo',
                          readOnly: true,
                        )),
            ),
          ]),
        ),
      ),
    );
  }
}

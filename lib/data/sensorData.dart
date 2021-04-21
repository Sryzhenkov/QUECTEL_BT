import 'package:flutter/material.dart';

// int globalID;
// int sensorID;
// String viewFunction;
// int size;
// String transFunction;
// String sensorFunction;
// String modeFunction;
// String name;
// String ipsName;
// int value;
// int upperLimit;
// int lowerLimit;

var sensorProperties = [
  'globalID',
  'sensorID',
  'viewFunction',
  'size',
  'transFunction',
  'sensorFunction',
  'modeFunction',
  'name',
  'ipsName',
  'value',
  'upperLimit',
  'loverLimit',
];

var listViewFunction = <String>[
  'u8',
  's8',
  'u16',
  's16',
  'f16',
  'f16_div100',
  'f16_div1000',
  'u32',
  's32',
  'f32',
  'f32_div100',
  'f32_div1000',
  'u64',
  's64',
  'd64',
  'String',
  'Default'
];

var listTransFunction = <String>[
  'us8',
  'us16',
  'usf32',
  'usd64',
  'Default',
];

var listModeFunction = <String>[
  'input in range',
  'out of range',
  'input or output of range',
  'monitoring',
];

class Sensor {
  int globalID;
  int sensorID;
  String viewFunction;
  int size;
  String transFunction;
  String sensorFunction;
  String modeFunction;
  String name;
  String ipsName;
  int value;
  int upperLimit;
  int lowerLimit;

  Sensor(
      {this.globalID,
      this.sensorID,
      this.viewFunction,
      this.size,
      this.transFunction,
      this.sensorFunction,
      this.modeFunction,
      this.name,
      this.ipsName,
      this.value,
      this.upperLimit,
      this.lowerLimit});
}

class SensorList with ChangeNotifier {
  List<Sensor> sensors = [
    Sensor(
        globalID: 5000,
        sensorID: 0,
        viewFunction: 'u32',
        size: 1,
        transFunction: 'us8',
        sensorFunction: 'reboot',
        modeFunction: 'monitoring',
        name: 'Reboot counter',
        ipsName: 'reboot',
        value: 4,
        upperLimit: 0,
        lowerLimit: 0),
    Sensor(
        globalID: 5001,
        sensorID: 1,
        viewFunction: 'u16',
        size: 2,
        transFunction: 'us16',
        sensorFunction: 'vcc',
        modeFunction: 'monitoring',
        name: 'Power supply voltage',
        ipsName: 'VBAT',
        value: 4212,
        upperLimit: 0,
        lowerLimit: 0),
    Sensor(
        globalID: 5002,
        sensorID: 2,
        viewFunction: 'u8',
        size: 2,
        transFunction: 'us8',
        sensorFunction: 'Point_cs',
        modeFunction: 'monitoring',
        name: 'Point creation source',
        ipsName: 'Event',
        value: 0,
        upperLimit: 0,
        lowerLimit: 0)
  ];

  setParam(
      int i,
      int globalID,
      int sensorID,
      String viewFunction,
      int size,
      String transFunction,
      String sensorFunction,
      String modeFunction,
      String name,
      String ipsName,
      int value,
      int upperLimit,
      int lowerLimit) {
    sensors[i].globalID = globalID;
    sensors[i].sensorID = sensorID;
    sensors[i].viewFunction = viewFunction;
    sensors[i].size = size;
    sensors[i].transFunction = transFunction;
    sensors[i].sensorFunction = sensorFunction;
    sensors[i].modeFunction = modeFunction;
    sensors[i].name = name;
    sensors[i].ipsName = ipsName;
    sensors[i].value = value;
    sensors[i].upperLimit = upperLimit;
    sensors[i].lowerLimit = lowerLimit;

    notifyListeners();
  }

  newSensor(
      int globalID,
      int sensorID,
      String viewFunction,
      int size,
      String transFunction,
      String sensorFunction,
      String modeFunction,
      String name,
      String ipsName,
      int value,
      int upperLimit,
      int lowerLimit) {
    sensors.add(Sensor(
        globalID: globalID,
        sensorID: sensorID,
        viewFunction: viewFunction,
        size: size,
        transFunction: transFunction,
        sensorFunction: sensorFunction,
        modeFunction: modeFunction,
        name: name,
        ipsName: ipsName,
        value: value,
        upperLimit: upperLimit,
        lowerLimit: lowerLimit));

    notifyListeners();
  }

//getParam(int i, int num1) => sensors[i];
}

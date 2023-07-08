import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:rxdart/rxdart.dart';

class BluetoothService with ChangeNotifier {
  final FlutterBlue flutterBlue = FlutterBlue.instance;

  late String connectionText;

  Future<bool> get bluetoothState => enabled();

  Future<bool> enabled() async {
    return await flutterBlue.isOn;
  }

  late StreamSubscription scanSubscription;
  String targetDeviceName = 'BLE-Server';
  late BluetoothCharacteristic? targetWriteCharacteristic;
  late BluetoothCharacteristic? targetReadCharacteristic;
  late BluetoothDevice _targetDevice;
  BluetoothDevice get targetDevice => _targetDevice;
  bool isDone = false;
  Stream streamScreen =
      ValueConnectableStream(FlutterBlue.instance.state).autoConnect();

  startScan() {
    connectionText = "Start Scanning";
    print(connectionText);

    scanSubscription =
        flutterBlue.scan(timeout: Duration(seconds: 4)).listen((scanResult) {
      // print(scanResult);
      if (scanResult.device.name == targetDeviceName) {
        stopScan();
        connectionText = "Found Target Device";
        print(connectionText);
        _targetDevice = scanResult.device;
        notifyListeners();
        connectToDevice();
      }
    }, onDone: () {
      isDone = false;
      print('is done $isDone');
      stopScan();
      notifyListeners();
    });
    notifyListeners();
  }

  stopScan() {
    scanSubscription.cancel();
    flutterBlue.stopScan();
    print("stopped");
  }

  connectToDevice() async {
    connectionText = "Device Connecting";
    print(connectionText);

    await _targetDevice.connect();
    isDone = true;
    connectionText = "Device Connected";
    print(connectionText);
    discoverServices();
  }

  String uuid = "00000180-0000-1000-8000-00805f9b34fb";
  String writeUuid = "0000dead-0000-1000-8000-00805f9b34fb";
  String readUuid = "0000fef4-0000-1000-8000-00805f9b34fb";

  discoverServices() async {
    var services = await _targetDevice.discoverServices();
    for (int i = 0; i < services.length; i++) {
      List<BluetoothCharacteristic> bluetoothCharacteristic =
          services[i].characteristics;
      // for (int j = 0; j < bluetoothCharacteristic.length; j++) {
      //   print(bluetoothCharacteristic[j].uuid);
      //   print(bluetoothCharacteristic[j].properties);
      // }
    }
    services.forEach(
      (service) {
        if (service.uuid.toString() == uuid) {
          service.characteristics.forEach((characteristic) async {
            if (characteristic.uuid.toString() == writeUuid) {
              targetWriteCharacteristic = characteristic;
            } else if (characteristic.uuid.toString() == readUuid) {
              targetReadCharacteristic = characteristic;
              // await targetReadCharacteristic!.setNotifyValue(true);
              targetReadCharacteristic!.value.listen(null).onData((data) {
                String msg1 = utf8.decode(data);
                readData(msg1);
              });
              // await targetReadCharacteristic!.setNotifyValue(true);
              // targetReadCharacteristic!.value.listen((value) {
              //   print("value came");
              //   print(utf8.decode(value));
              // });
            }
          });
        }
      },
    );
  }

  bool streamFinished = false;
  String? intTempValue;
  String? extTempValue;
  String? feedbackValue;
  List<int> intTempGraph = [];
  List<int> extTempGraph = [];
  List<int> pwmValueGraph = [];
  List<int> feedbackValueGraph = [];
  Color defaultColor = Colors.blueAccent;

  readData(String datas) {
    print("reading data");
    print(datas);
    if (datas.length == 13) {
      print("receive data");
      List<String> splitData = datas.split(" ");
      for (String data in splitData) {
        if (data[0] == "e") {
          intTempValue = data.substring(1);
          notifyListeners();
        } else if (data[0] == "i") {
          extTempValue = data.substring(1);
          notifyListeners();
        } else if (data[0] == "s") {
          feedbackValue = data.substring(1);
          notifyListeners();
        }
      }
    } else if (datas.length == 1) {
      //end of stream
      //saved them to device or upload to firebase
      streamFinished = true;
      notifyListeners();
    } else {
      if (datas.length > 0) {
        int dataLength = datas.length;
        int count = 0;
        List<int> splitData = [];
        while (count < dataLength) {
          String value = datas[count] + datas[count + 1];
          splitData.insert(splitData.length, int.parse(value));
          count = count + 2;
        }
        intTempGraph.insertAll(intTempGraph.length, splitData);
        print(intTempGraph);
        streamFinished = true;
      }
      // extTempGraph.insert(
      //     intTempGraph.length, int.parse(splitData[2].toString()));
      // pwmValueGraph.insert(
      //     intTempGraph.length, int.parse(splitData[3].toString()));
      // feedbackValueGraph.insert(
      //     intTempGraph.length, int.parse(splitData[4].toString()));
      notifyListeners();
    }
    notifyListeners();
  }

  disconnectFromDevice({required BluetoothDevice device}) async {
    await device.disconnect();

    connectionText = "Device Disconnected";
    print(connectionText);
    notifyListeners();
  }

  clearData() {
    intTempGraph.clear();
    extTempGraph.clear();
    pwmValueGraph.clear();
    feedbackValueGraph.clear();
    notifyListeners();
  }

  writeData(String data) async {
    if (targetWriteCharacteristic == null) return;
    List<int> bytes = utf8.encode(data);
    await targetWriteCharacteristic!.write(bytes, withoutResponse: false);
  }
}

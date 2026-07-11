import 'package:flutter/material.dart';

import '../models/device_info.dart';

class DeviceProvider extends ChangeNotifier {

  final DeviceInfo _device = DeviceInfo();

  DeviceInfo get device => _device;

  void updateDevice({
    bool? connected,
    String? deviceId,
    String? firmware,
    String? comPort,
    String? wifi,
    String? mqtt,
  }) {
    if (connected != null) _device.connected = connected;
    if (deviceId != null) _device.deviceId = deviceId;
    if (firmware != null) _device.firmware = firmware;
    if (comPort != null) _device.comPort = comPort;
    if (wifi != null) _device.wifi = wifi;
    if (mqtt != null) _device.mqtt = mqtt;

    notifyListeners();
  }

  void disconnect() {
    _device.connected = false;
    _device.deviceId = "-";
    _device.firmware = "-";
    _device.comPort = "-";
    _device.wifi = "-";
    _device.mqtt = "Disconnected";

    notifyListeners();
  }
}
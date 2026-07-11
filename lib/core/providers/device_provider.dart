import 'package:flutter/material.dart';

import '../models/device_info.dart';
import '../models/device_model.dart';
import '../services/device_dummy_service.dart';

class DeviceProvider extends ChangeNotifier {
  //-------------------------------------------------------
  // Dashboard Device Info
  //-------------------------------------------------------

  DeviceInfo _device = DeviceInfo(
    connected: false,
    deviceId: "-",
    firmware: "-",
    comPort: "-",
    wifi: "-",
    mqtt: "Disconnected",
  );

  DeviceInfo get device => _device;

  //-------------------------------------------------------
  // Device Discovery
  //-------------------------------------------------------

  final List<DeviceModel> _devices = [];

  List<DeviceModel> get devices => List.unmodifiable(_devices);

  DeviceModel? _selectedDevice;

  DeviceModel? get selectedDevice => _selectedDevice;

  //-------------------------------------------------------
  // Dashboard Function
  //-------------------------------------------------------

  void updateDevice({
    required bool connected,
    required String deviceId,
    required String firmware,
    required String comPort,
    required String wifi,
    required String mqtt,
  }) {
    _device = DeviceInfo(
      connected: connected,
      deviceId: deviceId,
      firmware: firmware,
      comPort: comPort,
      wifi: wifi,
      mqtt: mqtt,
    );

    notifyListeners();
  }

  void disconnect() {
    _device = DeviceInfo(
      connected: false,
      deviceId: "-",
      firmware: "-",
      comPort: "-",
      wifi: "-",
      mqtt: "Disconnected",
    );

    notifyListeners();
  }

  //-------------------------------------------------------
  // Discovery Function
  //-------------------------------------------------------

  void loadDummyDevices() {
    _devices
      ..clear()
      ..addAll(DeviceDummyService.getDevices());

    notifyListeners();
  }

  void refreshDevices() {
    loadDummyDevices();
  }

  void selectDevice(DeviceModel device) {
    _selectedDevice = device;

    notifyListeners();
  }

  void clearSelection() {
    _selectedDevice = null;

    notifyListeners();
  }

  //-------------------------------------------------------
  // Future Communication Layer
  //-------------------------------------------------------

  Future<void> scanSerial() async {
    // Sprint 3
  }

  Future<void> scanUDP() async {
    // Sprint 3
  }

  Future<void> scanHttp() async {
    // Sprint 3
  }

  Future<void> connectDevice(DeviceModel device) async {
    updateDevice(
      connected: true,
      deviceId: device.id,
      firmware: device.firmware,
      comPort: "COM5",
      wifi: "Office",
      mqtt: "Connected",
    );

    notifyListeners();
  }

  Future<void> disconnectDevice() async {
    disconnect();
  }

  Future<void> restartDevice() async {
    // Sprint 3
  }

  Future<void> factoryReset() async {
    // Sprint 4
  }
}
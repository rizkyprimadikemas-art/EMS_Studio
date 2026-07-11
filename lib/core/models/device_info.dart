class DeviceInfo {
  bool connected;
  String deviceId;
  String firmware;
  String comPort;
  String wifi;
  String mqtt;

  DeviceInfo({
    this.connected = false,
    this.deviceId = "-",
    this.firmware = "-",
    this.comPort = "-",
    this.wifi = "-",
    this.mqtt = "Disconnected",
  });
}
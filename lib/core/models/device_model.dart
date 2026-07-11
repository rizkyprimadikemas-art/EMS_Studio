class DeviceModel {
  final String id;
  final String ip;
  final String mac;
  final String firmware;
  final bool online;

  const DeviceModel({
    required this.id,
    required this.ip,
    required this.mac,
    required this.firmware,
    required this.online,
  });

  DeviceModel copyWith({
    String? id,
    String? ip,
    String? mac,
    String? firmware,
    bool? online,
  }) {
    return DeviceModel(
      id: id ?? this.id,
      ip: ip ?? this.ip,
      mac: mac ?? this.mac,
      firmware: firmware ?? this.firmware,
      online: online ?? this.online,
    );
  }
}
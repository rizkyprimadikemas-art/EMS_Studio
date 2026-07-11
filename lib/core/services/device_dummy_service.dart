import '../models/device_model.dart';

class DeviceDummyService {
  DeviceDummyService._();

  static List<DeviceModel> getDevices() {
    return const [
      DeviceModel(
        id: 'EMS001',
        ip: '192.168.4.1',
        mac: '24:6F:28:AA:11:01',
        firmware: '1.0.0',
        online: true,
      ),
      DeviceModel(
        id: 'EMS002',
        ip: '192.168.4.2',
        mac: '24:6F:28:AA:11:02',
        firmware: '1.0.0',
        online: false,
      ),
      DeviceModel(
        id: 'EMS003',
        ip: '192.168.4.3',
        mac: '24:6F:28:AA:11:03',
        firmware: '1.0.1',
        online: true,
      ),
      DeviceModel(
        id: 'EMS004',
        ip: '192.168.4.4',
        mac: '24:6F:28:AA:11:04',
        firmware: '1.0.2',
        online: true,
      ),
    ];
  }
}
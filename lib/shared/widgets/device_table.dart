import 'package:flutter/material.dart';

import '../../../core/models/device_model.dart';
import 'device_status_chip.dart';

class DeviceTable extends StatelessWidget {
  final List<DeviceModel> devices;

  final DeviceModel? selectedDevice;

  final ValueChanged<DeviceModel> onSelect;

  final ValueChanged<DeviceModel> onConnect;

  const DeviceTable({
    super.key,
    required this.devices,
    required this.selectedDevice,
    required this.onSelect,
    required this.onConnect,
  });

  @override
  Widget build(BuildContext context) {
    if (devices.isEmpty) {
      return Card(
        child: SizedBox(
          height: 300,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.search_off,
                  size: 60,
                  color: Colors.grey,
                ),
                SizedBox(height: 12),
                Text(
                  "No Device Found",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text("Press Scan to search device"),
              ],
            ),
          ),
        ),
      );
    }

    return Card(
      elevation: 2,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowHeight: 54,
          dataRowMinHeight: 60,
          dataRowMaxHeight: 64,
          columnSpacing: 32,
          columns: const [
            DataColumn(label: Text("No")),
            DataColumn(label: Text("Device ID")),
            DataColumn(label: Text("IP Address")),
            DataColumn(label: Text("Firmware")),
            DataColumn(label: Text("Status")),
            DataColumn(label: Text("Action")),
          ],
          rows: List.generate(
            devices.length,
            (index) {
              final device = devices[index];

              final selected =
                  selectedDevice?.id == device.id;

              return DataRow(
                selected: selected,
                onSelectChanged: (_) {
                  onSelect(device);
                },
                cells: [
                  DataCell(
                    Text("${index + 1}"),
                  ),
                  DataCell(
                    Text(
                      device.id,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(device.ip),
                  ),
                  DataCell(
                    Text(device.firmware),
                  ),
                  DataCell(
                    DeviceStatusChip(
                      online: device.online,
                    ),
                  ),
                  DataCell(
                    FilledButton.icon(
                      onPressed: device.online
                          ? () => onConnect(device)
                          : null,
                      icon: const Icon(Icons.link),
                      label: const Text("Connect"),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
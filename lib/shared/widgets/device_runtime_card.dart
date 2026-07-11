import 'package:flutter/material.dart';

import '../../../core/models/device_model.dart';

class DeviceRuntimeCard extends StatelessWidget {
  final DeviceModel? device;

  const DeviceRuntimeCard({
    super.key,
    required this.device,
  });

  Widget buildTile(
    BuildContext context,
    IconData icon,
    String title,
    String value,
    Color color,
  ) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: color.withOpacity(.12),
        child: Icon(
          icon,
          color: color,
          size: 18,
        ),
      ),
      title: Text(title),
      trailing: Text(
        value,
        style: Theme.of(context)
            .textTheme
            .titleMedium,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (device == null) {
      return Card(
        child: SizedBox(
          height: 320,
          child: Center(
            child: Text(
              "Runtime Information\nUnavailable",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium,
            ),
          ),
        ),
      );
    }

    // Dummy data (Sprint 3 akan berasal dari ESP32)
    const rssi = "-46 dBm";
    const heap = "248 KB";
    const flash = "4 MB";
    const cpu = "160 MHz";
    const uptime = "00:18:42";
    const temperature = "33 °C";

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            Text(
              "Runtime Information",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),

            const SizedBox(height: 20),

            buildTile(
              context,
              Icons.wifi,
              "RSSI",
              rssi,
              Colors.green,
            ),

            buildTile(
              context,
              Icons.memory,
              "Free Heap",
              heap,
              Colors.orange,
            ),

            buildTile(
              context,
              Icons.sd_storage,
              "Flash",
              flash,
              Colors.deepPurple,
            ),

            buildTile(
              context,
              Icons.speed,
              "CPU",
              cpu,
              Colors.blue,
            ),

            buildTile(
              context,
              Icons.thermostat,
              "Temperature",
              temperature,
              Colors.red,
            ),

            buildTile(
              context,
              Icons.timer,
              "Uptime",
              uptime,
              Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
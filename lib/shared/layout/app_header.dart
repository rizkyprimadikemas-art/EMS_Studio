import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/device_provider.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final device = context.watch<DeviceProvider>().device;

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE5E7EB),
          ),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.memory,
            color: Colors.blue,
          ),

          const SizedBox(width: 10),

          const Text(
            "EMS Configurator",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Spacer(),

          Icon(
            Icons.circle,
            size: 12,
            color: device.connected
                ? Colors.green
                : Colors.red,
          ),

          const SizedBox(width: 8),

          Text(
            device.connected
                ? device.deviceId
                : "Disconnected",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
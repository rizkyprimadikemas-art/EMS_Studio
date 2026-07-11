import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/device_provider.dart';

class AppStatusBar extends StatelessWidget {
  const AppStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    final device = context.watch<DeviceProvider>().device;

    return Container(
      height: 30,
      color: const Color(0xFF263238),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            "COM : ${device.comPort}",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),

          const SizedBox(width: 20),

          Text(
            "Firmware : ${device.firmware}",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),

          const Spacer(),

          Text(
            device.connected
                ? "Connected"
                : "Disconnected",
            style: TextStyle(
              color: device.connected
                  ? Colors.greenAccent
                  : Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
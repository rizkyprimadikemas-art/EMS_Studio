import 'package:flutter/material.dart';

import '../../shared/layout/app_layout.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {

    return AppLayout(

      title: "Dashboard",

      child: Padding(
  padding: const EdgeInsets.all(24),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Text(
        "Selamat Datang 👋",
        style: Theme.of(context).textTheme.headlineMedium,
      ),

      const SizedBox(height: 8),

      Text(
        "EMS Configurator Desktop",
        style: Theme.of(context).textTheme.titleMedium,
      ),

      const SizedBox(height: 30),

      Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 2.4,
          children: const [

            StatusCard(
              title: "Device",
              value: "Disconnected",
              icon: Icons.usb,
              color: Colors.red,
            ),

            StatusCard(
              title: "COM Port",
              value: "-",
              icon: Icons.cable,
              color: Colors.blue,
            ),

            StatusCard(
              title: "MQTT",
              value: "Disconnected",
              icon: Icons.cloud,
              color: Colors.orange,
            ),

            StatusCard(
              title: "WiFi",
              value: "Not Connected",
              icon: Icons.wifi,
              color: Colors.green,
            ),

          ],
        ),
      ),

    ],
  ),
),
    );
  }
}
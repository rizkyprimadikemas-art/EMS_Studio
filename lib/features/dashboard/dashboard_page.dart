import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/device_provider.dart';
import '../../shared/widgets/status_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DeviceProvider>();
    final device = provider.device;

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool desktop = constraints.maxWidth >= 1000;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //----------------------------------
              // Title
              //----------------------------------

              Text(
                "Dashboard",
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: 6),

              Text(
                "EMS Ecosystem Configurator",
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 25),

              //----------------------------------
              // Toolbar
              //----------------------------------

              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [

                  FilledButton.icon(
                    icon: const Icon(Icons.usb),
                    label: const Text("Simulasi Connect"),
                    onPressed: () {
                      provider.updateDevice(
                        connected: true,
                        deviceId: "EMS001",
                        firmware: "1.0.0",
                        comPort: "COM5",
                        wifi: "Office",
                        mqtt: "Connected",
                      );
                    },
                  ),

                  OutlinedButton.icon(
                    icon: const Icon(Icons.link_off),
                    label: const Text("Disconnect"),
                    onPressed: () {
                      provider.disconnect();
                    },
                  ),

                ],
              ),

              const SizedBox(height: 30),

              //----------------------------------
              // Status Cards
              //----------------------------------

              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [

                  SizedBox(
                    width: desktop ? 260 : double.infinity,
                    height: 140,
                    child: StatusCard(
                      icon: Icons.usb,
                      title: "Device",
                      value: device.connected
                          ? device.deviceId
                          : "Disconnected",
                      color: device.connected
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),

                  SizedBox(
                    width: desktop ? 260 : double.infinity,
                    height: 140,
                    child: StatusCard(
                      icon: Icons.settings_input_component,
                      title: "COM Port",
                      value: device.comPort,
                      color: Colors.blue,
                    ),
                  ),

                  SizedBox(
                    width: desktop ? 260 : double.infinity,
                    height: 140,
                    child: StatusCard(
                      icon: Icons.memory,
                      title: "Firmware",
                      value: device.firmware,
                      color: Colors.orange,
                    ),
                  ),

                  SizedBox(
                    width: desktop ? 260 : double.infinity,
                    height: 140,
                    child: StatusCard(
                      icon: Icons.cloud_done,
                      title: "MQTT",
                      value: device.mqtt,
                      color: device.mqtt == "Connected"
                          ? Colors.green
                          : Colors.orange,
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 30),

              //----------------------------------
              // Recent Activity Card
              //----------------------------------

              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [

                      Row(
                        children: [

                          const Icon(Icons.history),

                          const SizedBox(width: 10),

                          Text(
                            "Recent Activity",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge,
                          ),

                        ],
                      ),

                      const SizedBox(height: 15),

                      const Divider(),

                      const SizedBox(height: 10),

                      SizedBox(
                        height: 250,

                        child: ListView(
                          children: [
                                                        ListTile(
                              leading: Icon(
                                device.connected
                                    ? Icons.check_circle
                                    : Icons.info,
                                color: device.connected
                                    ? Colors.green
                                    : Colors.blue,
                              ),
                              title: const Text("Device Status"),
                              subtitle: Text(
                                device.connected
                                    ? "Device ${device.deviceId} Connected"
                                    : "Waiting for ESP32 Device...",
                              ),
                            ),

                            const Divider(height: 1),

                            ListTile(
                              leading: const Icon(
                                Icons.usb,
                                color: Colors.blue,
                              ),
                              title: const Text("Serial Port"),
                              subtitle: Text(
                                device.comPort == "-"
                                    ? "No COM Port"
                                    : device.comPort,
                              ),
                            ),

                            const Divider(height: 1),

                            ListTile(
                              leading: Icon(
                                device.mqtt == "Connected"
                                    ? Icons.cloud_done
                                    : Icons.cloud_off,
                                color: device.mqtt == "Connected"
                                    ? Colors.green
                                    : Colors.orange,
                              ),
                              title: const Text("MQTT"),
                              subtitle: Text(device.mqtt),
                            ),

                            const Divider(height: 1),

                            ListTile(
                              leading: const Icon(
                                Icons.memory,
                                color: Colors.deepPurple,
                              ),
                              title: const Text("Firmware"),
                              subtitle: Text(device.firmware),
                            ),

                            const Divider(height: 1),

                            ListTile(
                              leading: const Icon(
                                Icons.wifi,
                                color: Colors.teal,
                              ),
                              title: const Text("WiFi"),
                              subtitle: Text(device.wifi),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/device_provider.dart';

class ConnectedTab extends StatelessWidget {

  const ConnectedTab({super.key});

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<DeviceProvider>();

    final device = provider.device;

    return SingleChildScrollView(

      padding: const EdgeInsets.all(24),

      child: Card(

        child: Padding(

          padding: const EdgeInsets.all(24),

          child: Column(

            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Text(

                "Connected Device",

                style: Theme.of(context)
                    .textTheme
                    .headlineSmall,

              ),

              const SizedBox(height: 30),

              ListTile(

                leading:
                    const Icon(Icons.memory),

                title:
                    const Text("Device ID"),

                subtitle:
                    Text(device.deviceId),

              ),

              const Divider(),

              ListTile(

                leading:
                    const Icon(Icons.usb),

                title:
                    const Text("COM Port"),

                subtitle:
                    Text(device.comPort),

              ),

              const Divider(),

              ListTile(

                leading:
                    const Icon(Icons.code),

                title:
                    const Text("Firmware"),

                subtitle:
                    Text(device.firmware),

              ),

              const Divider(),

              ListTile(

                leading:
                    const Icon(Icons.wifi),

                title:
                    const Text("WiFi"),

                subtitle:
                    Text(device.wifi),

              ),

              const Divider(),

              ListTile(

                leading:
                    const Icon(Icons.cloud),

                title:
                    const Text("MQTT"),

                subtitle:
                    Text(device.mqtt),

              ),

              const SizedBox(height: 25),

              FilledButton.icon(

                onPressed: () {

                  provider.disconnectDevice();

                },

                icon: const Icon(Icons.link_off),

                label: const Text(
                    "Disconnect"),

              ),

            ],

          ),

        ),

      ),

    );

  }

}
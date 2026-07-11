import 'package:flutter/material.dart';

import '../../../core/models/device_model.dart';

class DeviceActionCard extends StatelessWidget {
  final DeviceModel? device;

  final VoidCallback? onConnect;
  final VoidCallback? onDisconnect;
  final VoidCallback? onRestart;
  final VoidCallback? onFactoryReset;
  final VoidCallback? onConsole;

  const DeviceActionCard({
    super.key,
    required this.device,
    this.onConnect,
    this.onDisconnect,
    this.onRestart,
    this.onFactoryReset,
    this.onConsole,
  });

  @override
  Widget build(BuildContext context) {
    final hasDevice = device != null;
    final connected = device?.online ?? false;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Device Action",
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height:20),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: hasDevice
                    ? (connected
                        ? onDisconnect
                        : onConnect)
                    : null,
                icon: Icon(
                  connected
                      ? Icons.link_off
                      : Icons.link,
                ),
                label: Text(
                  connected
                      ? "Disconnect"
                      : "Connect",
                ),
              ),
            ),

            const SizedBox(height:12),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed:
                    hasDevice ? onRestart : null,
                icon: const Icon(Icons.restart_alt),
                label: const Text("Restart Device"),
              ),
            ),

            const SizedBox(height:12),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: hasDevice
                    ? onFactoryReset
                    : null,
                icon: const Icon(
                    Icons.settings_backup_restore),
                label:
                    const Text("Factory Reset"),
              ),
            ),

            const SizedBox(height:12),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed:
                    hasDevice ? onConsole : null,
                icon:
                    const Icon(Icons.terminal),
                label:
                    const Text("Open Console"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
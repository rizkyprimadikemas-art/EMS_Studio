import 'package:flutter/material.dart';

import '../../../core/models/device_model.dart';

class DeviceStatusCard extends StatelessWidget {
  final DeviceModel? device;

  const DeviceStatusCard({
    super.key,
    required this.device,
  });

  @override
  Widget build(BuildContext context) {
    final bool online = device?.online ?? false;

    final Color color = online
        ? Colors.green
        : Colors.red;

    final IconData icon = online
        ? Icons.check_circle
        : Icons.cancel;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [

            CircleAvatar(
              radius: 28,
              backgroundColor: color.withOpacity(.12),
              child: Icon(
                icon,
                color: color,
                size: 32,
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  Text(
                    online
                        ? "ONLINE"
                        : "OFFLINE",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(
                          color: color,
                          fontWeight:
                              FontWeight.bold,
                        ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    online
                        ? "Device Connected"
                        : "No Device Connected",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium,
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
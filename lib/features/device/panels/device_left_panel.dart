import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/device_provider.dart';
import '../widgets/device_table.dart';
import '../widgets/device_toolbar.dart';

class DeviceLeftPanel extends StatefulWidget {
  const DeviceLeftPanel({super.key});

  @override
  State<DeviceLeftPanel> createState() =>
      _DeviceLeftPanelState();
}

class _DeviceLeftPanelState
    extends State<DeviceLeftPanel> {

  final TextEditingController controller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<DeviceProvider>();

    return Card(

      child: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Text(

              "Device Discovery",

              style: Theme.of(context)
                  .textTheme
                  .headlineSmall,

            ),

            const SizedBox(height: 20),

            DeviceToolbar(

              searchController: controller,

              onScan: () {

                provider.refreshDevices();

              },

              onRefresh: () {

                provider.refreshDevices();

              },

            ),

            const SizedBox(height: 20),

            Expanded(

              child: DeviceTable(

                devices: provider.devices,

                selectedDevice:
                    provider.selectedDevice,

                onSelect:
                    provider.selectDevice,

                onConnect: (device) {

                  provider.connectDevice(device);

                },

              ),

            ),

          ],

        ),

      ),

    );

  }

}
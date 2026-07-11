import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/device_provider.dart';
import 'widgets/device_information_card.dart';
import 'widgets/device_table.dart';
import 'widgets/device_toolbar.dart';

class DiscoveryTab extends StatefulWidget {
  const DiscoveryTab({super.key});

  @override
  State<DiscoveryTab> createState() => _DiscoveryTabState();
}

class _DiscoveryTabState extends State<DiscoveryTab> {

  final TextEditingController searchController =
      TextEditingController();

  bool loaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!loaded) {
      loaded = true;

      Future.microtask(() {
        context
            .read<DeviceProvider>()
            .loadDummyDevices();
      });
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<DeviceProvider>();

    return SingleChildScrollView(

      padding: const EdgeInsets.all(24),

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

          const SizedBox(height: 25),

          DeviceToolbar(

            searchController:
                searchController,

            onScan: () {

              provider.refreshDevices();

              ScaffoldMessenger.of(context)
                  .showSnackBar(

                const SnackBar(

                  content: Text(
                    "Dummy Scan Finished",
                  ),

                ),

              );

            },

            onRefresh: () {

              provider.refreshDevices();

            },

          ),

          const SizedBox(height: 25),

          DeviceTable(

            devices: provider.devices,

            selectedDevice:
                provider.selectedDevice,

            onSelect: provider.selectDevice,

            onConnect: (device) {

              provider.connectDevice(device);

              ScaffoldMessenger.of(context)
                  .showSnackBar(

                SnackBar(

                  content: Text(
                    "${device.id} Connected",
                  ),

                ),

              );

            },

          ),

          const SizedBox(height: 30),

          DeviceInformationCard(

            device:
                provider.selectedDevice,

          ),

        ],

      ),

    );

  }

}
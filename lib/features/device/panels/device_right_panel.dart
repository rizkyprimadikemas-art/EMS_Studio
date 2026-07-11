import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/device_provider.dart';

import '../widgets/device_action_card.dart';
import '../widgets/device_information_card.dart';
import '../widgets/device_runtime_card.dart';
import '../widgets/device_status_card.dart';

class DeviceRightPanel extends StatelessWidget {
  const DeviceRightPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DeviceProvider>();

    final selected = provider.selectedDevice;

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.stretch,
              children: [

                //-------------------------------------------------
                // STATUS
                //-------------------------------------------------

                DeviceStatusCard(
                  device: selected,
                ),

                const SizedBox(height: 16),

                //-------------------------------------------------
                // DEVICE INFORMATION
                //-------------------------------------------------

                DeviceInformationCard(
                  device: selected,
                ),

                const SizedBox(height: 16),

                //-------------------------------------------------
                // RUNTIME
                //-------------------------------------------------

                DeviceRuntimeCard(
                  device: selected,
                ),

                const SizedBox(height: 16),

                //-------------------------------------------------
                // ACTION
                //-------------------------------------------------

                DeviceActionCard(

                  device: selected,

                  onConnect: () {

                    if(selected!=null){

                      provider.connectDevice(selected);

                    }

                  },

                  onDisconnect: () {

                    provider.disconnectDevice();

                  },

                  onRestart: () {

                    ScaffoldMessenger.of(context)
                        .showSnackBar(

                      const SnackBar(

                        content: Text(
                          "Restart Device (Coming Soon)",
                        ),

                      ),

                    );

                  },

                  onFactoryReset: () {

                    ScaffoldMessenger.of(context)
                        .showSnackBar(

                      const SnackBar(

                        content: Text(
                          "Factory Reset (Coming Soon)",
                        ),

                      ),

                    );

                  },

                  onConsole: () {

                    ScaffoldMessenger.of(context)
                        .showSnackBar(

                      const SnackBar(

                        content: Text(
                          "Console (Sprint 4)",
                        ),

                      ),

                    );

                  },

                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
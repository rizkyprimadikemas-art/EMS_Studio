import 'package:flutter/material.dart';

import 'panels/device_left_panel.dart';
import 'panels/device_right_panel.dart';

class DevicePage extends StatelessWidget {
  const DevicePage({super.key});

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(

      builder: (context,constraints){

        //--------------------------------------------------
        // Desktop
        //--------------------------------------------------

        if(constraints.maxWidth>=1200){

          return Padding(

            padding: const EdgeInsets.all(24),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(
                  "Device Manager",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium,
                ),

                const SizedBox(height:6),

                Text(
                  "Manage EMS Device Connection",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium,
                ),

                const SizedBox(height:25),

                Expanded(

                  child: Row(

                    children: [

                      const Expanded(
                        flex:3,
                        child: DeviceLeftPanel(),
                      ),

                      const SizedBox(width:20),

                      const Expanded(
                        flex:2,
                        child: DeviceRightPanel(),
                      ),

                    ],

                  ),

                )

              ],

            ),

          );

        }

        //--------------------------------------------------
        // Tablet
        //--------------------------------------------------

        if(constraints.maxWidth>=700){

          return Padding(

            padding: const EdgeInsets.all(20),

            child: Column(

              children: [

                Text(
                  "Device Manager",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall,
                ),

                const SizedBox(height:20),

                const Expanded(
                  flex:3,
                  child: DeviceLeftPanel(),
                ),

                const SizedBox(height:20),

                const Expanded(
                  flex:2,
                  child: DeviceRightPanel(),
                ),

              ],

            ),

          );

        }

        //--------------------------------------------------
        // Small Screen
        //--------------------------------------------------

        return SingleChildScrollView(

          padding: const EdgeInsets.all(16),

          child: Column(

            children: [

              Text(
                "Device Manager",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall,
              ),

              const SizedBox(height:20),

              SizedBox(
                height:600,
                child: DeviceLeftPanel(),
              ),

              const SizedBox(height:20),

              SizedBox(
                height:500,
                child: DeviceRightPanel(),
              ),

            ],

          ),

        );

      },

    );

  }
}
import 'package:flutter/material.dart';

import '../../../core/models/device_model.dart';

class DeviceInformationCard extends StatelessWidget {
  final DeviceModel? device;

  const DeviceInformationCard({
    super.key,
    required this.device,
  });

  Widget item(
    BuildContext context,
    IconData icon,
    String title,
    String value,
  ) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 18,
        backgroundColor:
            Colors.blue.shade50,
        child: Icon(
          icon,
          color: Colors.blue,
          size: 18,
        ),
      ),
      title: Text(title),
      trailing: Text(
        value,
        style: Theme.of(context)
            .textTheme
            .titleMedium,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    if(device==null){

      return Card(

        child: SizedBox(

          height:280,

          child: Center(

            child: Text(

              "No Device Selected",

              style: Theme.of(context)
                  .textTheme
                  .titleLarge,

            ),

          ),

        ),

      );

    }

    return Card(

      child: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Text(

              "Device Information",

              style: Theme.of(context)
                  .textTheme
                  .titleLarge,

            ),

            const SizedBox(height:20),

            item(
              context,
              Icons.memory,
              "Device ID",
              device!.id,
            ),

            item(
              context,
              Icons.router,
              "IP Address",
              device!.ip,
            ),

            item(
              context,
              Icons.perm_device_information,
              "MAC Address",
              device!.mac,
            ),

            item(
              context,
              Icons.developer_board,
              "Firmware",
              device!.firmware,
            ),

            item(
              context,
              Icons.check_circle,
              "Status",
              device!.online
                  ? "Online"
                  : "Offline",
            ),

          ],

        ),

      ),

    );

  }
}
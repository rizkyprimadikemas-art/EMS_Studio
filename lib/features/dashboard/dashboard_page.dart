import 'package:flutter/material.dart';

import '../../shared/layout/app_layout.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {

    return AppLayout(

      title: "Dashboard",

      child: Center(

        child: Card(

          child: SizedBox(

            width: 700,

            height: 420,

            child: Padding(

              padding: const EdgeInsets.all(30),

              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    "Selamat Datang",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium,
                  ),

                  const SizedBox(height: 20),

                  const Divider(),

                  const SizedBox(height: 20),

                  const Text(
                    "EMS Configurator Desktop",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Software konfigurasi perangkat EMS Ecosystem.",
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
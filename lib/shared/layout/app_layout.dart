import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final Widget child;
  final String title;

  const AppLayout({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [

          // Sidebar sementara
          Container(
            width: 230,
            color: const Color(0xff1E293B),

            child: Column(
              children: [

                const SizedBox(height: 30),

                const Icon(
                  Icons.memory,
                  color: Colors.white,
                  size: 60,
                ),

                const SizedBox(height: 15),

                const Text(
                  "EMS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Text(
                  "Configurator",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 40),

              ],
            ),
          ),

          Expanded(
            child: Column(
              children: [

                Container(
                  height: 65,
                  color: Colors.white,

                  alignment: Alignment.centerLeft,

                  padding:
                      const EdgeInsets.symmetric(horizontal: 25),

                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Expanded(child: child),

                Container(
                  height: 30,
                  color: Colors.blueGrey.shade900,

                  alignment: Alignment.centerLeft,

                  padding:
                      const EdgeInsets.symmetric(horizontal: 15),

                  child: const Text(
                    "Status : Ready",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'app_header.dart';
import 'app_sidebar.dart';
import 'app_statusbar.dart';

class AppLayout extends StatelessWidget {
  final Widget child;

  const AppLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppHeader(),

          Expanded(
            child: Row(
              children: [
                const AppSidebar(),

                Expanded(
                  child: Container(
                    color: const Color(0xffF5F7FA),
                    padding: const EdgeInsets.all(24),
                    child: child,
                  ),
                ),
              ],
            ),
          ),

          const AppStatusBar(),
        ],
      ),
    );
  }
}
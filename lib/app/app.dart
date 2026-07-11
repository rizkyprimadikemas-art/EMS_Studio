import 'package:flutter/material.dart';

import 'router.dart';
import 'theme.dart';

class EMSConfiguratorApp extends StatelessWidget {
  const EMSConfiguratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'EMS Configurator',
      theme: AppTheme.light(),
      routerConfig: appRouter,
    );
  }
}
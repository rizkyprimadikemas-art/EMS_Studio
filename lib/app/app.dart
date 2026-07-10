import 'package:flutter/material.dart';

import 'router.dart';
import 'theme.dart';

class EMSConfiguratorApp extends StatelessWidget {
  const EMSConfiguratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
    routerConfig: appRouter,
    debugShowCheckedModeBanner: false,
    theme: AppTheme.light(),
);
  }
}
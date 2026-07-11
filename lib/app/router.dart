import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../core/providers/device_provider.dart';

import '../features/dashboard/dashboard_page.dart';
import '../features/device/device_page.dart';
import '../features/wifi/wifi_page.dart';
import '../features/mqtt/mqtt_page.dart';
import '../features/relay/relay_page.dart';
import '../features/pzem/pzem_page.dart';
import '../features/serial/serial_page.dart';
import '../features/settings/settings_page.dart';

import '../shared/layout/app_layout.dart';

final appRouter = GoRouter(
  initialLocation: "/",

  routes: [

    ShellRoute(

      builder: (context, state, child) {

        return AppLayout(
          child: child,
        );

      },

      routes: [

        GoRoute(
          path: "/",
          builder: (context, state) => const DashboardPage(),
        ),

        GoRoute(
          path: "/device",
          builder: (context, state) => const DevicePage(),
        ),

        GoRoute(
          path: "/wifi",
          builder: (context, state) => const WifiPage(),
        ),

        GoRoute(
          path: "/mqtt",
          builder: (context, state) => const MQTTPage(),
        ),

        GoRoute(
          path: "/relay",
          builder: (context, state) => const RelayPage(),
        ),

        GoRoute(
          path: "/pzem",
          builder: (context, state) => const PZEMPage(),
        ),

        GoRoute(
          path: "/serial",
          builder: (context, state) => const SerialPage(),
        ),

        GoRoute(
          path: "/settings",
          builder: (context, state) => const SettingsPage(),
        ),

      ],

    ),

  ],

);
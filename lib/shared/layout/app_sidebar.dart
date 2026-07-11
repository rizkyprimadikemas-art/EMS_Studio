import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'navigation_item.dart';

class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  static const List<NavigationItem> _items = [
    NavigationItem(
      title: 'Dashboard',
      route: '/',
      icon: Icons.dashboard_outlined,
    ),
    NavigationItem(
      title: 'Device',
      route: '/device',
      icon: Icons.memory_outlined,
    ),
    NavigationItem(
      title: 'WiFi',
      route: '/wifi',
      icon: Icons.wifi,
    ),
    NavigationItem(
      title: 'MQTT',
      route: '/mqtt',
      icon: Icons.cloud_outlined,
    ),
    NavigationItem(
      title: 'Relay',
      route: '/relay',
      icon: Icons.toggle_on_outlined,
    ),
    NavigationItem(
      title: 'PZEM',
      route: '/pzem',
      icon: Icons.bolt_outlined,
    ),
    NavigationItem(
      title: 'Serial',
      route: '/serial',
      icon: Icons.terminal,
    ),
    NavigationItem(
      title: 'Settings',
      route: '/settings',
      icon: Icons.settings_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;

    int selectedIndex = _items.indexWhere(
      (item) => item.route == location,
    );

    if (selectedIndex < 0) {
      selectedIndex = 0;
    }

    return NavigationRail(
      extended: true,
      minExtendedWidth: 220,
      backgroundColor: Colors.white,
      selectedIndex: selectedIndex,
      labelType: NavigationRailLabelType.none,
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: const [
            Icon(
              Icons.memory,
              size: 42,
              color: Colors.blue,
            ),
            SizedBox(height: 10),
            Text(
              'EMS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              'Configurator',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      destinations: _items
          .map(
            (item) => NavigationRailDestination(
              icon: Icon(item.icon),
              selectedIcon: Icon(item.icon),
              label: Text(item.title),
            ),
          )
          .toList(),
      onDestinationSelected: (index) {
        context.go(_items[index].route);
      },
    );
  }
}
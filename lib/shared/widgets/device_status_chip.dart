import 'package:flutter/material.dart';

class DeviceStatusChip extends StatelessWidget {
  final bool online;

  const DeviceStatusChip({
    super.key,
    required this.online,
  });

  @override
  Widget build(BuildContext context) {
    final color = online ? Colors.green : Colors.red;

    return Chip(
      avatar: Icon(
        Icons.circle,
        color: color,
        size: 12,
      ),
      label: Text(
        online ? "Online" : "Offline",
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: color.withOpacity(.12),
      side: BorderSide.none,
      visualDensity: VisualDensity.compact,
    );
  }
}
import 'package:flutter/material.dart';

class DeviceToolbar extends StatelessWidget {
  final TextEditingController searchController;

  final VoidCallback onScan;
  final VoidCallback onRefresh;

  const DeviceToolbar({
    super.key,
    required this.searchController,
    required this.onScan,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        SizedBox(
          width: 320,
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Search Device",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        FilledButton.icon(
          onPressed: onScan,
          icon: const Icon(Icons.radar),
          label: const Text("Scan"),
        ),
        OutlinedButton.icon(
          onPressed: onRefresh,
          icon: const Icon(Icons.refresh),
          label: const Text("Refresh"),
        ),
      ],
    );
  }
}
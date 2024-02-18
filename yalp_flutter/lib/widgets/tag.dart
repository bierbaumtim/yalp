import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String value;
  final Color color;

  const Tag({
    // ignore: unused_element
    super.key,
    required this.value,
    this.color = Colors.blueAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        value,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

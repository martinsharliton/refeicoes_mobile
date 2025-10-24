import 'package:flutter/material.dart';

class RefreshDataPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  const RefreshDataPage({super.key, required this.onPressed, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: GestureDetector(
            onTap: onPressed,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 22.5,
                  backgroundColor: Colors.blueGrey.withValues(alpha: .6),
                  child: IconButton(
                    icon: Icon(Icons.refresh, color: Colors.white, size: 22.5),
                    onPressed: onPressed,
                  ),
                ),
                SizedBox(height: 7.5),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.blueGrey.shade900,
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.blueGrey.shade800, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

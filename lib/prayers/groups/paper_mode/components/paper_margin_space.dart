import 'package:flutter/material.dart';

/// A widget that provides consistent margin spacing with an optional icon
/// 
/// This creates a visual line on the left with an optional icon, commonly
/// used throughout the paper mode UI for consistent styling.
class PaperMarginSpace extends StatelessWidget {
  const PaperMarginSpace({super.key, this.icon, required this.paperLine});

  final Widget? icon;
  final Widget paperLine;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            children: [
              Expanded(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    border: Border(right: BorderSide(color: Colors.grey)),
                  ),
                  child: Align(
                    child: icon ?? const SizedBox(width: 16),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 4),
          paperLine,
        ],
      ),
    );
  }
}

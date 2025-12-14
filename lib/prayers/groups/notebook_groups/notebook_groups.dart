/// Notebook Groups Library
///
/// A modular interface for displaying and managing prayer notebooks (groups).
///
/// This library provides:
/// - Grid view of notebooks with search functionality
/// - Permission-based access control
/// - Notebook card UI with spiral binding design
/// - Navigation to paper mode for viewing/editing prayers
///
/// ## Quick Start
///
/// ```dart
/// import 'package:prayer_ml/prayers/groups/notebook_groups/notebook_groups.dart';
///
/// // Display the notebooks grid
/// Groups()
/// ```
///
/// ## Public API
///
/// The only exported widget is `Groups`, which serves as the entry point.
/// All internal components are kept private to maintain encapsulation.
///
/// ## Structure
///
/// - `models/` - Data models and state management
/// - `components/` - UI components (internal)
///
/// See README.md for detailed documentation.

library notebook_groups;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'components/group_consumer.dart';

/// Main entry point for the Notebook Groups feature.
///
/// Displays a grid of prayer notebooks with search and navigation.
/// Handles async data loading and error states internally.
///
/// Usage:
/// ```dart
/// Groups()
/// ```
class Groups extends ConsumerWidget {
  const Groups({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const GroupConsumer();
  }
}

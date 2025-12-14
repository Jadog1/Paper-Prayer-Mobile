import 'package:flutter/material.dart';
import '../models/search_state.dart';

/// Animated search bar widget with focus effects.
///
/// Features:
/// - Focus-based animation with shadow effects
/// - Real-time filtering through SearchState
/// - Themed colors matching notebook aesthetic
class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key, required this.searchState});

  final SearchState searchState;

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: (focused) => setState(() => _isFocused = focused),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: _isFocused
              ? [
                  BoxShadow(
                    color: const Color(0xFF8B7355).withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  )
                ],
        ),
        child: TextField(
          onChanged: (text) => widget.searchState.filter(text),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: _isFocused ? const Color(0xFF8B7355) : Colors.grey[600],
            ),
            hintText: 'Search Notebooks...',
            hintStyle: TextStyle(color: Colors.grey[500]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
    );
  }
}

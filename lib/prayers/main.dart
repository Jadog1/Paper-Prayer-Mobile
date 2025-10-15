import 'package:flutter/material.dart';
// import 'package:prayer_ml/prayers/home/home.dart';
import 'package:prayer_ml/prayers/home/new_home.dart';
import 'package:prayer_ml/prayers/web/web_view.dart';
import 'package:prayer_ml/prayers/chat/chat.dart';
import './groups/groups.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/batch_paper_mode.dart';

class PrayersPage extends StatefulWidget {
  const PrayersPage({
    super.key,
    this.sharedText,
    this.onSharedTextHandled,
  });

  final String? sharedText;
  final VoidCallback? onSharedTextHandled;

  @override
  State<PrayersPage> createState() => _PrayersPageState();
}

class _PrayersPageState extends State<PrayersPage> {
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    // Handle shared text after the first frame
    if (widget.sharedText != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _handleSharedText();
      });
    }
  }

  @override
  void didUpdateWidget(PrayersPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Handle new shared text
    if (widget.sharedText != null && widget.sharedText != oldWidget.sharedText) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _handleSharedText();
      });
    }
  }

  void _handleSharedText() {
    if (widget.sharedText == null || !mounted) return;
    // Navigate to BatchPaperMode with the shared text
    Navigator.of(context).push(
      MaterialPageRoute( 
        builder: (context) => BatchPaperMode(
          config: BatchPaperModeConfig.requiresGroupSelection(
            prefillContent: widget.sharedText,
          ),
        ),
      ),
    ).then((_) {
      // Clear the shared text after handling
      widget.onSharedTextHandled?.call();
    });
  }

  @override
  Widget build(BuildContext context) {


    return PopScope(
      canPop: false,
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: const <Widget> [
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.book_outlined),
              selectedIcon: Icon(Icons.book),
              label: 'Notebooks',
            ),
            NavigationDestination(
              icon: Icon(Icons.web_outlined),
              selectedIcon: Icon(Icons.web),
              label: 'Studies',
            ),
            NavigationDestination(
              icon: Icon(Icons.chat_outlined),
              selectedIcon: Icon(Icons.chat),
              label: 'AI Chat',
            ),
          ],
          selectedIndex: pageIndex,
          onDestinationSelected: (value) => setState(() => pageIndex = value),
        ),
        body: const <Widget> [
          NewHomePage(),
          Groups(),
          WebViewPage(),
          ChatPage(),
        ][pageIndex],
      ),
    );
  }
}
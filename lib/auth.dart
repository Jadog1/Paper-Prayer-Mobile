import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as developer;

const Color _kParchmentLight = Color(0xFFFFFAF1);
const Color _kParchmentDeep = Color(0xFFF3E5C6);
const Color _kInk = Color(0xFF3B2F26);

class AuthGate extends StatelessWidget {
  final Widget child;

  const AuthGate({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData) {
          return const SignInPage();
        } else {
          return child;
        }
      },
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isProcessing = false;
  _AuthIntent? _activeIntent;
  String? _errorText;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _registerWithEmail() async {
    await _runWithLoading(_AuthIntent.register, () async {
      try {
        await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case 'weak-password':
            _setError('The password provided is too weak.');
            break;
          case 'email-already-in-use':
            _setError('An account already exists for that email.');
            break;
          default:
            _setError(e.message ?? 'An error occurred');
        }
      } catch (e, stackTrace) {
        _handleUnexpected(e, stackTrace, 'SignInPage._registerWithEmail');
      }
    });
  }

  Future<void> _signInWithEmail() async {
    await _runWithLoading(_AuthIntent.signIn, () async {
      try {
        await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case 'user-not-found':
            _setError('No user found for that email.');
            break;
          case 'wrong-password':
            _setError('Wrong password provided for that user.');
            break;
          default:
            _setError(e.message ?? 'An error occurred');
        }
      } catch (e, stackTrace) {
        _handleUnexpected(e, stackTrace, 'SignInPage._signInWithEmail');
      }
    });
  }

  Future<void> _runWithLoading(
    _AuthIntent intent,
    Future<void> Function() action,
  ) async {
    if (mounted) {
      setState(() {
        _isProcessing = true;
        _activeIntent = intent;
        _errorText = null;
      });
    }

    try {
      await action();
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
          _activeIntent = null;
        });
      }
    }
  }

  void _setError(String message) {
    if (!mounted) return;
    setState(() {
      _errorText = message;
    });
  }

  void _handleUnexpected(Object error, StackTrace stackTrace, String label) {
    developer.log(label, error: error, stackTrace: stackTrace);
    _setError('An unexpected error occurred. Please try again.');
  }

  void _showSupportNotice(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      const SnackBar(
        content: Text(
            'Need a hand? Email team@paperprayer.app and we will set you up.'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final horizontalPadding = size.width < 420 ? 16.0 : 32.0;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8F1E6), Color(0xFFFBF8F3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -60,
              right: -40,
              child: _AccentCircle(
                diameter: 180,
                color: Colors.white.withOpacity(0.35),
              ),
            ),
            Positioned(
              bottom: -30,
              left: -20,
              child: _AccentCircle(
                diameter: 140,
                color: _kParchmentDeep.withOpacity(0.5),
              ),
            ),
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: 32,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 520),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const _PaperHero(),
                        const SizedBox(height: 32),
                        _buildAuthCard(context, textTheme),
                        const SizedBox(height: 40),
                        const _FeatureHighlightsSection(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthCard(BuildContext context, TextTheme textTheme) {
    InputDecoration decoration(String label, IconData icon) {
      return InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: _kInk.withOpacity(0.6)),
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(color: _kInk.withOpacity(0.4)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: _kParchmentDeep.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: _kInk.withOpacity(0.7), width: 1.6),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: _kParchmentDeep.withOpacity(0.6)),
        ),
      );
    }

    return ClipPath(
      clipper: _TornPaperClipper(),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(28, 40, 28, 36),
        decoration: BoxDecoration(
          color: _kParchmentLight,
          borderRadius: BorderRadius.circular(32),
          boxShadow: const [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 40,
              offset: Offset(0, 25),
              spreadRadius: -15,
            ),
          ],
        ),
        child: AutofillGroup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome back to your desk',
                style: textTheme.titleLarge?.copyWith(
                  color: _kInk,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Paper Prayer watches your requests, finds the patterns, and surfaces what needs prayer next.',
                style: textTheme.bodyMedium?.copyWith(
                  color: _kInk.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _emailController,
                autofillHints: const [AutofillHints.email],
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: decoration('Email address', Icons.mail_outline),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                autofillHints: const [AutofillHints.password],
                obscureText: true,
                onSubmitted: (_) {
                  if (!_isProcessing) {
                    _signInWithEmail();
                  }
                },
                decoration: decoration('Password', Icons.lock_outline),
              ),
              const SizedBox(height: 20),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: _errorText == null
                    ? const SizedBox.shrink()
                    : Text(
                        _errorText!,
                        key: ValueKey(_errorText),
                        style: TextStyle(
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
              if (_errorText != null) const SizedBox(height: 4),
              FilledButton(
                onPressed: _isProcessing ? null : _signInWithEmail,
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF374955),
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: _buildButtonChild('Sign In', _AuthIntent.signIn),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: _isProcessing ? null : _registerWithEmail,
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(54),
                  foregroundColor: _kInk,
                  side: BorderSide(color: _kInk.withOpacity(0.25)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  backgroundColor: Colors.white.withOpacity(0.9),
                ),
                child: _buildButtonChild(
                  'Create a new journal',
                  _AuthIntent.register,
                  color: _kInk,
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 8,
                children: const [
                  _TagChip(
                      icon: Icons.dashboard_customize_outlined,
                      label: 'Home dashboard'),
                  _TagChip(
                      icon: Icons.auto_awesome, label: 'Daily curation AI'),
                  _TagChip(
                      icon: Icons.import_contacts_outlined,
                      label: 'Batch import help'),
                ],
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed:
                    _isProcessing ? null : () => _showSupportNotice(context),
                child: const Text('Need an invite or help?'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonChild(String label, _AuthIntent intent, {Color? color}) {
    final resolvedColor = color ?? Colors.white;
    if (_activeIntent == intent && _isProcessing) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(resolvedColor),
              backgroundColor: resolvedColor.withOpacity(0.2),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Just a moment...',
            style: TextStyle(color: resolvedColor),
          ),
        ],
      );
    }

    return Text(label);
  }
}

enum _AuthIntent { signIn, register }

class _AccentCircle extends StatelessWidget {
  final double diameter;
  final Color color;

  const _AccentCircle({required this.diameter, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _PaperHero extends StatelessWidget {
  const _PaperHero();

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFF4B3B2B);
    final muted = accent.withOpacity(0.72);

    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeOutQuint,
      tween: Tween<double>(begin: 0.92, end: 1),
      builder: (context, value, child) => Transform.scale(
        scale: value,
        child: child,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 200,
            child: _PaperStackVisual(),
          ),
          const SizedBox(height: 24),
          Text(
            'Pray with clarity, not chaos',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: accent,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 12),
          Text(
            'Automatic dashboards, collections, and follow-ups keep every prayer request within reach.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: muted,
                  height: 1.4,
                ),
          ),
        ],
      ),
    );
  }
}

class _FeatureHighlightsSection extends StatelessWidget {
  const _FeatureHighlightsSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What Paper Prayer helps with',
          style: theme.textTheme.titleMedium?.copyWith(
            color: _kInk,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'A few of the assistive superpowers waiting once you sign in.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: _kInk.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 24),
        LayoutBuilder(
          builder: (context, constraints) {
            final isNarrow = constraints.maxWidth < 540;
            final availableWidth = constraints.maxWidth.isFinite
                ? constraints.maxWidth
                : MediaQuery.of(context).size.width;
            final tileWidth =
                isNarrow ? availableWidth : (availableWidth - 16) / 2;
            return Wrap(
              spacing: 16,
              runSpacing: 16,
              children: _kFeatureHighlights
                  .map(
                    (info) => SizedBox(
                      width: tileWidth,
                      child: _FeatureHighlightCard(info: info),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}

class _FeatureHighlightCard extends StatelessWidget {
  final _FeatureInfo info;

  const _FeatureHighlightCard({required this.info});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: _kParchmentDeep.withOpacity(0.8)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x15000000),
            blurRadius: 22,
            offset: Offset(0, 18),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _kParchmentDeep.withOpacity(0.6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(info.icon, color: _kInk, size: 24),
          ),
          const SizedBox(height: 14),
          Text(
            info.title,
            style: textTheme.titleSmall?.copyWith(
              color: _kInk,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            info.description,
            style: textTheme.bodyMedium?.copyWith(
              color: _kInk.withOpacity(0.75),
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureInfo {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureInfo({
    required this.icon,
    required this.title,
    required this.description,
  });
}

const List<_FeatureInfo> _kFeatureHighlights = [
  _FeatureInfo(
    icon: Icons.dashboard_customize_outlined,
    title: 'Intelligent Home Dashboard',
    description:
        'See upcoming events and prioritized requests the moment you open the app so you always know where to start.',
  ),
  _FeatureInfo(
    icon: Icons.auto_awesome_motion,
    title: 'Auto-Organized Collections',
    description:
        'Paper Prayer groups related requests automatically, revealing patterns and themes happening in your community.',
  ),
  _FeatureInfo(
    icon: Icons.calendar_month_outlined,
    title: 'Smart Calendar Integration',
    description:
        'Dates are detected instantly and mapped onto a living calendar, keeping context around every event and prayer.',
  ),
  _FeatureInfo(
    icon: Icons.sunny_snowing,
    title: 'Daily Prayer Curation',
    description:
        'AI selects a fair mix of urgent, overdue, and fresh requests so every person receives consistent prayer.',
  ),
  _FeatureInfo(
    icon: Icons.draw_outlined,
    title: 'Real-Time Smart Writing',
    description:
        'As you type, Paper Prayer summarizes and links people automatically for quick catch-ups and follow-ups.',
  ),
];

class _PaperStackVisual extends StatelessWidget {
  const _PaperStackVisual();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: const [
        _PaperSheet(
          angle: -0.18,
          offset: Offset(-30, 28),
          width: 230,
          height: 140,
          color: Color(0xFFE9DCC5),
        ),
        _PaperSheet(
          angle: 0.14,
          offset: Offset(26, 12),
          width: 230,
          height: 140,
          color: Color(0xFFF3E6CF),
        ),
        _TopPaperSheet(),
      ],
    );
  }
}

class _PaperSheet extends StatelessWidget {
  final double angle;
  final Offset offset;
  final double width;
  final double height;
  final Color color;

  const _PaperSheet({
    required this.angle,
    required this.offset,
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(24),
            border:
                Border.all(color: Colors.white.withOpacity(0.7), width: 1.2),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1F000000),
                blurRadius: 20,
                offset: Offset(0, 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopPaperSheet extends StatelessWidget {
  const _TopPaperSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFE3D6BC), width: 1.2),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 30,
            offset: Offset(0, 18),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 6,
              decoration: BoxDecoration(
                color: const Color(0xFFDFC09C),
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            const SizedBox(height: 18),
            ...List.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8DCC6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              );
            }),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 72,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: const Color(0xFF8D6E63)),
                ),
                child: const Center(
                  child: Text(
                    'Amen',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF8D6E63),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _TagChip({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    const color = _kInk;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFFE0D1BC)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color.withOpacity(0.7)),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: color.withOpacity(0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _TornPaperClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double jaggedHeight = 18;
    final path = Path()..lineTo(0, size.height - jaggedHeight);

    final segmentWidth = size.width / 6;
    for (var i = 0; i < 6; i++) {
      final controlPoint = Offset(
        segmentWidth * (i + 0.5),
        size.height - jaggedHeight + (i.isEven ? 6 : -6),
      );
      final endPoint = Offset(
        segmentWidth * (i + 1),
        size.height - jaggedHeight,
      );
      path.quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    }

    path
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

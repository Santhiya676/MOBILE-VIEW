import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/auth_layout.dart';
import '../../widgets/stackly_logo.dart';

/// Mobile-only first screen. Desktop continues to use the existing login page.
class MobileIntroPage extends StatefulWidget {
  const MobileIntroPage({super.key});

  @override
  State<MobileIntroPage> createState() => _MobileIntroPageState();
}

class _MobileIntroPageState extends State<MobileIntroPage>
    with SingleTickerProviderStateMixin {
  late bool _darkMode;
  late String _language;
  late final AnimationController _animation = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 4600),
  )..repeat();

  @override
  void initState() {
    super.initState();
    _darkMode = AuthPreferences.darkMode ?? true;
    _language = AuthPreferences.language;
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final compact = size.height < 700;
    final foreground = _darkMode ? Colors.white : const Color(0xFF10182E);
    final muted = _darkMode ? Colors.white.withValues(alpha: .58) : const Color(0xFF5D6980);
    String tr(String english, String tamil) => _language == 'TA' ? tamil : english;
    return Scaffold(
      backgroundColor: _darkMode ? const Color(0xFF05060B) : const Color(0xFFF5F7FC),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.black,
                      padding: const EdgeInsets.fromLTRB(18, 14, 12, 14),
                      child: Row(children: [
                        const StacklyLogo(iconSize: 25),
                        const Spacer(),
                        IconButton(
                          tooltip: _darkMode ? 'Light mode' : 'Dark mode',
                          visualDensity: VisualDensity.compact,
                          onPressed: () => setState(() {
                            _darkMode = !_darkMode;
                            AuthPreferences.darkMode = _darkMode;
                          }),
                          icon: Icon(_darkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                              color: Colors.white, size: 19),
                        ),
                        PopupMenuButton<String>(
                          tooltip: 'Language',
                          initialValue: _language,
                          onSelected: (value) => setState(() {
                            _language = value;
                            AuthPreferences.language = value;
                          }),
                          itemBuilder: (context) => const [
                            PopupMenuItem(value: 'EN', child: Text('English')),
                            PopupMenuItem(value: 'TA', child: Text('தமிழ்')),
                          ],
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            const Icon(Icons.language, size: 18, color: Colors.white),
                            const SizedBox(width: 4),
                            Text(_language == 'TA' ? 'தமிழ்⌄' : 'EN⌄',
                                style: const TextStyle(color: Colors.white, fontSize: 10)),
                          ]),
                        ),
                      ]),
                    ),
                    SizedBox(height: compact ? 22 : 48),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                      tr('CLOUD PLATFORM  ·  HRMS  ·  CRM  ·  ERP\nFINANCE  ·  AI', 'கிளவுட் தளம்  ·  HRMS  ·  CRM  ·  ERP\nநிதி  ·  AI'),
                      style: TextStyle(
                        color: muted,
                        fontSize: 8,
                        letterSpacing: 1.65,
                        height: 1.7,
                        fontFamily: 'monospace',
                      ),
                    )),
                    SizedBox(height: compact ? 14 : 22),
                    SizedBox(
                      height: compact ? 275 : 330,
                      width: double.infinity,
                      child: AnimatedBuilder(
                        animation: _animation,
                        builder: (context, _) => _SplashOrbit(
                          progress: _animation.value,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Text.rich(
                      TextSpan(children: [
                        TextSpan(text: '${tr('One identity.', 'ஒரே அடையாளம்.')}\n'),
                        TextSpan(
                          text: '${tr('Infinite', 'எல்லையற்ற')} ',
                          style: const TextStyle(color: Color(0xFF367BFF)),
                        ),
                        TextSpan(text: tr('Potential.', 'ஆற்றல்.')),
                      ]),
                      style: TextStyle(
                        color: foreground,
                        fontSize: 29,
                        height: 1.08,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -.9,
                      ),
                    )),
                    SizedBox(height: compact ? 24 : 36),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () => context.go('/login'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF173DEB),
                          foregroundColor: Colors.white,
                          elevation: 8,
                          shadowColor: const Color(0xFF174BFF).withValues(alpha: .4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'SIGN IN',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            letterSpacing: .7,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: compact ? 20 : 54),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: ['Secure', 'Scalable', 'Future-Ready']
                          .map((label) => Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Text(label,
                                    style: TextStyle(
                                      color: muted,
                                      fontSize: 9,
                                    )),
                              ))
                          .toList(),
                    ),
                  ],
                ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _SplashOrbit extends StatelessWidget {
  final double progress;
  const _SplashOrbit({required this.progress});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;
          final center = Offset(width / 2, height / 2);
          final ring = math.min(width - 56, height - 34);
          final cardWidth = math.min(112.0, (width - 50) / 2);
          const cardHeight = 66.0;
          return Stack(children: [
            Positioned.fill(
              child: CustomPaint(
                painter: _SplashOrbitPainter(progress: progress, diameter: ring),
              ),
            ),
            Positioned(
              left: center.dx - 24,
              top: center.dy - 24,
              child: Container(
                width: 48,
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF7CB5FF), Color(0xFF0751E8), Color(0xFF071326)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF2684FF).withValues(alpha: .5 + .25 * math.sin(progress * math.pi * 2)),
                      blurRadius: 23,
                    ),
                  ],
                ),
                child: const Text('1E', style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w700)),
              ),
            ),
            _card(left: 7, top: center.dy - ring * .37 - cardHeight / 2, width: cardWidth, title: 'People', subtitle: 'Manage users & teams', icon: Icons.people_alt_outlined),
            _card(left: width - cardWidth - 7, top: center.dy - ring * .37 - cardHeight / 2, width: cardWidth, title: 'Applications', subtitle: 'Integrate & manage', icon: Icons.layers_outlined),
            _card(left: 7, top: center.dy + ring * .37 - cardHeight / 2, width: cardWidth, title: 'Security', subtitle: 'Protect every access', icon: Icons.shield_outlined),
            _card(left: width - cardWidth - 7, top: center.dy + ring * .37 - cardHeight / 2, width: cardWidth, title: 'Analytics', subtitle: 'Turn data into insights', icon: Icons.bar_chart_rounded),
          ]);
        },
      );

  Widget _card({required double left, required double top, required double width, required String title, required String subtitle, required IconData icon}) =>
      Positioned(
        left: left,
        top: top,
        width: width,
        height: 66,
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 8, 7, 6),
          decoration: BoxDecoration(
            color: const Color(0xFF0C1122).withValues(alpha: .97),
            borderRadius: BorderRadius.circular(11),
            border: Border.all(color: const Color(0xFF234B9A).withValues(alpha: .8)),
            boxShadow: [BoxShadow(color: const Color(0xFF0B57FF).withValues(alpha: .14), blurRadius: 18)],
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(icon, size: 16, color: const Color(0xFF3992FF)),
            const Spacer(),
            Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 10)),
            const SizedBox(height: 2),
            Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white.withValues(alpha: .55), fontSize: 7)),
          ]),
        ),
      );
}

class _SplashOrbitPainter extends CustomPainter {
  final double progress;
  final double diameter;
  const _SplashOrbitPainter({required this.progress, required this.diameter});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCenter(center: center, width: diameter, height: diameter * .82);
    final pulse = .7 + .3 * math.sin(progress * math.pi * 2);
    canvas.drawOval(rect, Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7
      ..color = const Color(0xFF147DFF).withValues(alpha: .19 * pulse)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 14));
    canvas.drawOval(rect, Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.7
      ..shader = const SweepGradient(colors: [Color(0xFF092E84), Color(0xFF52B9FF), Color(0xFF1462FF), Color(0xFF092E84)]).createShader(rect));
    final angle = progress * math.pi * 2;
    final dot = Offset(center.dx + rect.width / 2 * math.cos(angle), center.dy + rect.height / 2 * math.sin(angle));
    canvas.drawCircle(dot, 4, Paint()..color = const Color(0xFFB7E6FF)..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6));
    final connector = Paint()..color = const Color(0xFF6E89BF).withValues(alpha: .58)..strokeWidth = 1;
    for (final x in [-1.0, 1.0]) {
      for (final y in [-1.0, 1.0]) {
        canvas.drawLine(center, Offset(center.dx + x * diameter * .31, center.dy + y * diameter * .31), connector);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _SplashOrbitPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.diameter != diameter;
}

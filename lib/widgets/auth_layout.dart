import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'stackly_logo.dart';

/// Shared appearance choices for the pre-dashboard authentication screens.
class AuthPreferences {
  static bool? darkMode;
  static String language = 'EN';
}

class AuthLayout extends StatefulWidget {
  final Widget child;
  final bool reverse;

  const AuthLayout({super.key, required this.child, this.reverse = false});

  @override
  State<AuthLayout> createState() => _AuthLayoutState();
}

class _AuthLayoutState extends State<AuthLayout> {
  late bool _darkMode;
  late String _language;

  @override
  void initState() {
    super.initState();
    _darkMode = AuthPreferences.darkMode ?? false;
    _language = AuthPreferences.language;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: _darkMode ? const Color(0xFF0D1029) : Colors.white,
        body: SafeArea(
          child: LayoutBuilder(builder: (context, box) {
            if (box.maxWidth < 760) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                const Expanded(flex: 25, child: _BrandPanel()),
                Expanded(
                  flex: 75,
                  child: ColoredBox(
                    color: _darkMode ? const Color(0xFF0D1029) : Colors.white,
                    child: SingleChildScrollView(
                        padding: EdgeInsets.fromLTRB(
                          10,
                          10,
                          10,
                          18 + MediaQuery.viewInsetsOf(context).bottom,
                        ),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 430),
                            child: _form(),
                          ),
                        ),
                      ),
                  ),
                ),
              ]);
            }

            final left = const Expanded(flex: 51, child: _BrandPanel());
            final right = Expanded(
              flex: 49,
              child: ColoredBox(
                color: _darkMode ? const Color(0xFF0D1029) : Colors.white,
                child: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 42,
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 300),
                        child: _form(),
                      ),
                    ),
                  ),
              ),
            );
            return Row(children: widget.reverse ? [right, left] : [left, right]);
          }),
        ),
      );

  Widget _form() => AuthVisualSettings(
        darkMode: _darkMode,
        language: _language,
        child: widget.child,
      );

}

class AuthVisualSettings extends InheritedWidget {
  final bool darkMode;
  final String language;

  const AuthVisualSettings({
    super.key,
    required this.darkMode,
    required this.language,
    required super.child,
  });

  static AuthVisualSettings? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AuthVisualSettings>();

  @override
  bool updateShouldNotify(AuthVisualSettings oldWidget) =>
      darkMode != oldWidget.darkMode || language != oldWidget.language;
}

class _BrandPanel extends StatefulWidget {
  const _BrandPanel();

  @override
  State<_BrandPanel> createState() => _BrandPanelState();
}

class _BrandPanelState extends State<_BrandPanel>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animation = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 5200),
  )..repeat();

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final compact = constraints.maxWidth < 760;
          final pad = constraints.maxWidth * .06;
          final tiny = constraints.maxWidth < 300;
          return Container(
            width: double.infinity,
            color: compact ? Colors.black : const Color(0xFF0D1028),
            padding: EdgeInsets.fromLTRB(
                pad, compact ? 13 : 24, pad, compact ? 9 : 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StacklyLogo(iconSize: compact ? 27 : 30),
                SizedBox(height: compact ? 7 : 12),
                Text(
                  compact
                      ? 'CLOUD PLATFORM  ·  HRMS  ·  CRM  ·  ERP\nFINANCE  ·  AI'
                      : 'CLOUD PLATFORM  ·  HRMS  ·  CRM  ·  ERP  ·  FINANCE  ·  AI',
                  maxLines: compact ? 2 : 1,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    color: const Color(0xFFB2B6C4),
                    fontSize: compact ? (tiny ? 4.6 : 5.2) : 7,
                    letterSpacing: compact ? .55 : 1.05,
                    height: 1.4,
                    fontFamily: 'monospace',
                  ),
                ),
                SizedBox(height: compact ? 8 : 12),
                _BrandHeadline(
                    fontSize: compact ? (tiny ? 17 : 24) : 32),
                const SizedBox(height: 2),
                if (!compact)
                  Expanded(
                      child: _OrbitScene(
                          compact: false, animation: _animation))
                else
                  const SizedBox(height: 4),
                if (!compact)
                Row(
                  children: [
                    _footerLabel('Secure', compact),
                    SizedBox(width: compact ? 14 : 20),
                    _footerLabel('Scalable', compact),
                    SizedBox(width: compact ? 14 : 20),
                    _footerLabel('Future-Ready', compact),
                    const Spacer(),
                    if (!compact)
                      const Text(
                        'BUILT FOR\nA BRIGHTER\nTOMORROW',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF747B9C),
                          fontSize: 7,
                          height: 1.25,
                          letterSpacing: 1,
                          fontFamily: 'monospace',
                        ),
                      ),
                  ],
                ),
              ],
            ),
          );
        },
      );

  Widget _footerLabel(String text, bool compact) => Text(
        text,
        style: TextStyle(
          color: const Color(0xFF747B9C),
          fontSize: compact ? 6 : 7,
          letterSpacing: compact ? .4 : .8,
          fontFamily: 'monospace',
        ),
      );
}

class _BrandHeadline extends StatelessWidget {
  final double fontSize;

  const _BrandHeadline({required this.fontSize});

  @override
  Widget build(BuildContext context) => Text.rich(
        TextSpan(
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            height: 1.03,
            fontWeight: FontWeight.w600,
            letterSpacing: -1,
          ),
          children: const [
            TextSpan(text: 'One identity.\n'),
            TextSpan(
                text: 'Infinite ', style: TextStyle(color: Color(0xFF1677FF))),
            TextSpan(text: 'Potential.'),
          ],
        ),
      );
}

class _OrbitScene extends StatelessWidget {
  final bool compact;
  final Animation<double> animation;

  const _OrbitScene({required this.compact, required this.animation});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final cardWidth = (constraints.maxWidth * .29)
              .clamp(compact ? 58.0 : 88.0, compact ? 100.0 : 108.0)
              .toDouble();
          final cardHeight = (constraints.maxHeight * (compact ? .32 : .23))
              .clamp(compact ? 56.0 : 72.0, compact ? 66.0 : 82.0)
              .toDouble();
          return Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Positioned.fill(
                child: CustomPaint(painter: _OrbitPainter(animation)),
              ),
              Positioned(
                left: constraints.maxWidth * (compact ? .04 : .14),
                top: constraints.maxHeight * .12,
                child: _OrbitCard(
                  width: cardWidth,
                  height: cardHeight,
                  icon: Icons.people_alt_outlined,
                  title: 'People',
                  subtitle: 'Manage users & teams',
                  compact: compact,
                ),
              ),
              Positioned(
                right: constraints.maxWidth * (compact ? .04 : .14),
                top: constraints.maxHeight * .12,
                child: _OrbitCard(
                  width: cardWidth,
                  height: cardHeight,
                  icon: Icons.apps_outlined,
                  title: 'Applications',
                  subtitle: 'Integrate & manage',
                  compact: compact,
                ),
              ),
              Positioned(
                left: constraints.maxWidth * (compact ? .04 : .14),
                bottom: constraints.maxHeight * .12,
                child: _OrbitCard(
                  width: cardWidth,
                  height: cardHeight,
                  icon: Icons.shield_outlined,
                  title: 'Security',
                  subtitle: 'Protect every access',
                  compact: compact,
                ),
              ),
              Positioned(
                right: constraints.maxWidth * (compact ? .04 : .14),
                bottom: constraints.maxHeight * .12,
                child: _OrbitCard(
                  width: cardWidth,
                  height: cardHeight,
                  icon: Icons.query_stats_outlined,
                  title: 'Analytics',
                  subtitle: 'Turn data into insights',
                  compact: compact,
                ),
              ),
              Center(
                child: AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) => Transform.scale(
                    scale: 1 + .035 * math.sin(animation.value * math.pi * 2),
                    child: child,
                  ),
                  child: Container(
                    width: compact && constraints.maxWidth < 300 ? 42 : 54,
                    height: compact && constraints.maxWidth < 300 ? 42 : 54,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFF064BE5),
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: const Color(0xFF43A4FF)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFF087BFF),
                          blurRadius: 30,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: Text(
                      '1E',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: compact && constraints.maxWidth < 300 ? 23 : 29,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -1.6,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
}

class _OrbitCard extends StatelessWidget {
  final double width;
  final double height;
  final IconData icon;
  final String title;
  final String subtitle;
  final bool compact;

  const _OrbitCard({
    required this.width,
    required this.height,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.compact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(compact ? 4 : 9),
      decoration: BoxDecoration(
        color: const Color(0xF2090D17),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xFF214B91), width: .8),
        boxShadow: const [
          BoxShadow(color: Color(0x550079FF), blurRadius: 17, spreadRadius: 1),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: compact ? 18 : 26,
            height: compact ? 18 : 26,
            decoration: BoxDecoration(
              color: const Color(0xFF071C34),
              border: Border.all(color: const Color(0xFF0D4D91), width: .7),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(icon,
                color: const Color(0xFF168EFF), size: compact ? 11 : 15),
          ),
          const Spacer(),
          Text(title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: compact ? 7 : 10,
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 2),
          Text(subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: const Color(0xFF9BA9BF), fontSize: compact ? 5.5 : 7)),
        ],
      ),
    );
  }
}

class _OrbitPainter extends CustomPainter {
  final Animation<double> animation;

  _OrbitPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final pulse = (math.sin(animation.value * math.pi * 2) + 1) / 2;
    final baseRingWidth = math.min(size.width * .80, size.height * 1.12);
    final baseRingHeight = math.min(size.height * .92, baseRingWidth * 1.12);
    final ringWidth = baseRingWidth * (1 + .012 * pulse);
    final ringHeight = baseRingHeight * (1 + .012 * pulse);
    final ring = Rect.fromCenter(
      center: center,
      width: ringWidth,
      height: ringHeight,
    );
    final arcs = [
      (start: math.pi * 1.17, sweep: math.pi * .66),
      (start: math.pi * .17, sweep: math.pi * .66),
    ];
    final glow = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFF3D8BFF).withValues(alpha: .34 + .12 * pulse),
          const Color(0xFF006CFF).withValues(alpha: .10 + .05 * pulse),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: center, radius: ringWidth * .75));
    canvas.drawRect(Offset.zero & size, glow);
    for (final layer in [
      (width: 17.0 + 3 * pulse, color: const Color(0xFF348BFF), blur: 20.0),
      (width: 7.0, color: const Color(0xFF29B8FF), blur: 9.0),
    ]) {
      final paint = Paint()
        ..color = layer.color.withValues(alpha: .62 + .22 * pulse)
        ..style = PaintingStyle.stroke
        ..strokeWidth = layer.width
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, layer.blur);
      for (final arc in arcs) {
        canvas.drawArc(ring, arc.start, arc.sweep, false, paint);
      }
    }
    final crispArc = Paint()
        ..color = const Color(0xFF078DFF)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.3;
    final innerArc = Paint()
        ..color = const Color(0xFF23CEFF)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5;
    final innerRing = ring.deflate(5);
    for (final arc in arcs) {
      canvas.drawArc(ring, arc.start, arc.sweep, false, crispArc);
      canvas.drawArc(innerRing, arc.start, arc.sweep, false, innerArc);
    }
    final glintProgress = (animation.value * 2) % 1;
    final glintOnLowerArc = (animation.value * 2).floor().isOdd;
    final glintStart = glintOnLowerArc ? arcs.last.start : arcs.first.start;
    final angle = glintStart + glintProgress * arcs.first.sweep;
    final glint = Offset(
      center.dx + ring.width / 2 * math.cos(angle),
      center.dy + ring.height / 2 * math.sin(angle),
    );
    canvas.drawCircle(
      glint,
      10 + pulse * 3,
      Paint()
        ..color = const Color(0xFF43B8FF).withValues(alpha: .8)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12),
    );
    canvas.drawCircle(
      glint,
      2.2,
      Paint()..color = const Color(0xFFE9FAFF),
    );
    final line = Paint()
      ..color = const Color(0xFF637894).withValues(alpha: .7)
      ..strokeWidth = 1;
    for (final point in [
      Offset(size.width * .27, size.height * .25),
      Offset(size.width * .73, size.height * .25),
      Offset(size.width * .27, size.height * .77),
      Offset(size.width * .73, size.height * .77),
    ]) {
      canvas.drawLine(center, point, line);
    }
  }

  @override
  bool shouldRepaint(covariant _OrbitPainter oldDelegate) =>
      oldDelegate.animation != animation;
}

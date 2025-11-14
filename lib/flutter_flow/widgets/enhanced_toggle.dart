import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EnhancedToggle extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Duration animationDuration;

  const EnhancedToggle({
    Key? key,
    required this.value,
    required this.onChanged,
    this.animationDuration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  State<EnhancedToggle> createState() => _EnhancedToggleState();
}

class _EnhancedToggleState extends State<EnhancedToggle>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _handleTap() async {
    // Scale animation
    await _scaleController.forward();
    await _scaleController.reverse();
    
    // Toggle value
    widget.onChanged(!widget.value);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.value;
    
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: 80,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: isDark
                      ? [
                          Color(0xFF1E293B),
                          Color(0xFF0F172A),
                        ]
                      : [
                          Color(0xFFC8AB6B),
                          Color(0xFFD4B776),
                        ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isDark
                        ? Colors.black.withOpacity(0.3)
                        : Color(0xFFC8AB6B).withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Icons
                  Row(
                    children: [
                      // Sun icon
                      Expanded(
                        child: AnimatedOpacity(
                          opacity: isDark ? 0.0 : 1.0,
                          duration: widget.animationDuration,
                          child: Icon(
                            Icons.sunny,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      
                      // Moon icon
                      Expanded(
                        child: AnimatedOpacity(
                          opacity: isDark ? 1.0 : 0.0,
                          duration: widget.animationDuration,
                          child: Icon(
                            Icons.nightlight_round,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  // Sliding indicator
                  AnimatedPositioned(
                    duration: widget.animationDuration,
                    curve: Curves.easeInOut,
                    left: isDark ? 40 : 4,
                    top: 4,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: AnimatedSwitcher(
                        duration: widget.animationDuration,
                        child: Icon(
                          isDark ? Icons.nightlight_round : Icons.sunny,
                          key: ValueKey(isDark),
                          color: isDark ? Color(0xFF1E293B) : Color(0xFFC8AB6B),
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

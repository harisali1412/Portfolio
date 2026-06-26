import 'package:flutter/material.dart';
import 'package:portfolio/constants/design_system.dart';

class AnimatedCard extends StatefulWidget {
  const AnimatedCard({
    super.key,
    required this.child,
    this.delay = 0,
    this.onTap,
    this.padding,
  });

  final Widget child;
  final int delay;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: DesignSystem.animationDuration,
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 20),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _isInitialized = true;
    
    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted && _isInitialized) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _isInitialized = false;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return widget.child;
    }
    
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            padding: widget.padding,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
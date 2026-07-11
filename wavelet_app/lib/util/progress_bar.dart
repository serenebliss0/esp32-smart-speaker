import 'package:flutter/material.dart';
import 'package:Wavelet/theme/colors.dart';

class TimedProgressBar extends StatefulWidget {
  final Duration duration;
  final VoidCallback onComplete;
  final double height;
  final double borderRadius;

  const TimedProgressBar({
    super.key,
    required this.duration,
    required this.onComplete,
    this.height = 6,
    this.borderRadius = 268,
  });

  @override
  State<TimedProgressBar> createState() => _TimedProgressBarState();
}

class _TimedProgressBarState extends State<TimedProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onComplete();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: LinearProgressIndicator(
            value: _controller.value,
            color: WaveletColors.primary(context),
            backgroundColor: WaveletColors.surfaceVariant(context),
            minHeight: widget.height,
          ),
        );
      },
    );
  }
}
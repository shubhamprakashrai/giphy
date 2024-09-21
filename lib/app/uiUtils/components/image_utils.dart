
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shimmer/shimmer.dart';

Widget avatarGlowLoader() {
  return const AvatarGlow(
    repeatPauseDuration: Duration(milliseconds: 300),
    glowColor: Colors.red,
    endRadius: 80,
    child: SizedBox(),
  );
}


class AvatarGlow extends StatefulWidget {
  final Widget child;
  final double endRadius;
  final BoxShape shape;
  final Duration duration;
  final bool repeat;
  final bool animate;
  final Duration repeatPauseDuration;
  final Curve curve;
  final bool showTwoGlows;
  final Color glowColor;
  final Duration? startDelay;

  const AvatarGlow({
    Key? key,
    required this.child,
    required this.endRadius,
    this.shape = BoxShape.circle,
    this.duration = const Duration(milliseconds: 2000),
    this.repeat = true,
    this.animate = true,
    this.repeatPauseDuration = const Duration(milliseconds: 100),
    this.curve = Curves.fastOutSlowIn,
    this.showTwoGlows = true,
    this.glowColor = Colors.white,
    this.startDelay,
  }) : super(key: key);

  @override
  State<AvatarGlow> createState() => _AvatarGlowState();
}

class _AvatarGlowState extends State<AvatarGlow>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  );
  late final _curve = CurvedAnimation(
    parent: controller,
    curve: widget.curve,
  );
  late final Animation<double> _smallDiscAnimation = Tween(
    begin: (widget.endRadius * 2) / 6,
    end: (widget.endRadius * 2) * (3 / 4),
  ).animate(_curve);
  late final Animation<double> _bigDiscAnimation = Tween(
    begin: 0.0,
    end: (widget.endRadius * 2),
  ).animate(_curve);
  late final Animation<double> _alphaAnimation = Tween(
    begin: 0.30,
    end: 0.0,
  ).animate(controller);

  // ignore: prefer_final_fields
  late void Function(AnimationStatus status) _statusListener = (_) async {
    if (controller.status == AnimationStatus.completed) {
      await Future.delayed(widget.repeatPauseDuration);
      if (mounted && widget.repeat && widget.animate) {
        controller.reset();
        controller.forward();
      }
    }
  };

  @override
  void initState() {
    super.initState();
    if (widget.animate) {
      _startAnimation();
    }
  }

  @override
  void didUpdateWidget(AvatarGlow oldWidget) {
    if (widget.animate != oldWidget.animate) {
      if (widget.animate) {
        _startAnimation();
      } else {
        _stopAnimation();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  void _startAnimation() async {
    controller.addStatusListener(_statusListener);
    if (widget.startDelay != null) {
      await Future.delayed(widget.startDelay!);
    }
    if (mounted) {
      controller.reset();
      controller.forward();
    }
  }

  void _stopAnimation() async {
    controller.removeStatusListener(_statusListener);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _alphaAnimation,
      child: widget.child,
      builder: (context, widgetChild) {
        final decoration = BoxDecoration(
          shape: widget.shape,
          // If the user picks a curve that goes below 0 or above 1
          // this opacity will have unexpected effects without clamping
          color: widget.glowColor.withOpacity(
            _alphaAnimation.value.clamp(
              0.0,
              1.0,
            ),
          ),
        );
        return SizedBox(
          height: widget.endRadius * 2,
          width: widget.endRadius * 2,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              widget.animate
                  ? AnimatedBuilder(
                animation: _bigDiscAnimation,
                builder: (context, widget) {
                  // If the user picks a curve that goes below 0,
                  // this will throw without clamping
                  final num size = _bigDiscAnimation.value.clamp(
                    0.0,
                    double.infinity,
                  );
                  return Container(
                    height: size as double?,
                    width: size as double?,
                    decoration: decoration,
                  );
                },
              )
                  : const SizedBox(height: 0.0, width: 0.0),
              widget.animate && widget.showTwoGlows
                  ? AnimatedBuilder(
                animation: _smallDiscAnimation,
                builder: (context, widget) {
                  final num size = _smallDiscAnimation.value.clamp(
                    0.0,
                    double.infinity,
                  );

                  return Container(
                    height: size as double?,
                    width: size as double?,
                    decoration: decoration,
                  );
                },
              )
                  : const SizedBox(height: 0.0, width: 0.0),
              widgetChild!,
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}


class ImageUtils{

  // Show cached network image
  static Widget showCachedImage({
        String? url,
        Widget? placeholder,
        Widget? errorWidget,
        double? width,
        double? height,
        BoxFit? fit,
        Color? color,
        bool showFullImage = false}) {
    return CachedNetworkImage(
      imageUrl: url??"",
      color: color,
      placeholder: (_, __) => placeholder ?? Center(child: progressIndicatorBuilder()),
      errorWidget: (_, __, ___) => errorWidget ?? const SizedBox(),
      fit: fit ?? BoxFit.fill,
      height: height,
      width: width,
    );
  }

  static Widget progressIndicatorBuilder({double? width, double? height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.3),
      highlightColor: Colors.grey.withOpacity(0.1),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Container(
          color: Colors.black,
        ),
      ),
    );
  }
}



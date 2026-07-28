import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../model/menu_item_model.dart';

class CustomBottomNavBar extends StatelessWidget {
  final List<MenuItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  final double barHeight;
  final double circleSize;
  final double circleGap;
  final Color barColor;

  const CustomBottomNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.barHeight = 65,
    this.circleSize = 60,
    this.circleGap = 8,
    this.barColor = const Color(0xFF7A2530),
  });

  @override
  Widget build(BuildContext context) {
    final totalHeight = barHeight + circleSize - circleGap;

    return SizedBox(
      height: totalHeight,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final itemWidth = constraints.maxWidth / items.length;

          return Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: barHeight,
                decoration: BoxDecoration(
                  color: barColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 12,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  children: List.generate(items.length, (index) {
                    final isSelected = index == currentIndex;
                    return Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => onTap(index),
                        child: SizedBox(
                          height: barHeight,
                          child: isSelected
                              ? const SizedBox.shrink()
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _NavLottieIcon(
                                      path: items[index].lottiePath,
                                      isSelected: false,
                                      size: 26,
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      items[index].label,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white.withOpacity(0.75),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutCubic,
                left: (itemWidth * currentIndex) + (itemWidth - circleSize) / 2,
                bottom: barHeight - circleGap - (circleSize * 0.35),
                child: GestureDetector(
                  onTap: () => onTap(currentIndex),
                  child: Container(
                    width: circleSize,
                    height: circleSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: barColor,
                      border: Border.all(color: Colors.white, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: _NavLottieIcon(
                      path: items[currentIndex].lottiePath,
                      isSelected: true,
                      size: circleSize * 0.4,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Plays the Lottie animation once whenever it becomes the selected item.
class _NavLottieIcon extends StatefulWidget {
  final String path;
  final bool isSelected;
  final double size;

  const _NavLottieIcon({
    required this.path,
    required this.isSelected,
    required this.size,
  });

  @override
  State<_NavLottieIcon> createState() => _NavLottieIconState();
}

class _NavLottieIconState extends State<_NavLottieIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void didUpdateWidget(_NavLottieIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected && !oldWidget.isSelected) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      widget.path,
      controller: _controller,
      width: widget.size,
      height: widget.size,
      fit: BoxFit.contain,
      decoder: LottieComposition.decodeZip,
      delegates: LottieDelegates(
        values: [
          ValueDelegate.color(const ['**'], value: Colors.white),
          ValueDelegate.strokeColor(const ['**'], value: Colors.white),
        ],
      ),
      onLoaded: (composition) {
        _controller.duration = composition.duration;
        if (widget.isSelected) {
          _controller.forward(from: 0);
        } else {
          _controller.value =
              1.0; // ← last frame pe set karo (icon fully visible)
        }
      },
    );
  }
}

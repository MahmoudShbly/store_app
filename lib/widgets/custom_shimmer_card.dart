import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerCard extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;

  const CustomShimmerCard({
    super.key,
    this.width = 100,
    this.height = 100,
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: SizedBox(
        width: width,
        height: height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: borderRadius,
          ),
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/rendering.dart';

class AdaptativeGridDelegate extends SliverGridDelegateWithFixedCrossAxisCount {
  AdaptativeGridDelegate({
    required this.minWidth,
    required super.crossAxisCount,
    super.mainAxisSpacing = 0.0,
    super.crossAxisSpacing = 0.0,
    super.childAspectRatio = 1.0,
    super.mainAxisExtent,
  });

  final double minWidth;

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    final double usableCrossAxisExtent = max(
      0.0,
      constraints.crossAxisExtent - crossAxisSpacing * (crossAxisCount - 1),
    );
    final bool willFitAtLeastTwoItems = (minWidth * 2) > usableCrossAxisExtent;
    final double childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount;
    final double childMainAxisExtent = childCrossAxisExtent / childAspectRatio;
    final double width = willFitAtLeastTwoItems
        ? usableCrossAxisExtent
        : childMainAxisExtent;
    return SliverGridRegularTileLayout(
      crossAxisCount: crossAxisCount,
      mainAxisStride: childMainAxisExtent + mainAxisSpacing,
      crossAxisStride: childCrossAxisExtent + crossAxisSpacing,
      childMainAxisExtent: (width / 16) * 9,
      childCrossAxisExtent: width,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }
}

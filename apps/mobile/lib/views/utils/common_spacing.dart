import 'dart:ui';

import 'package:flutter/material.dart';

class CommonSpacing extends ThemeExtension<CommonSpacing> {
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;

  CommonSpacing({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
  });

  @override
  ThemeExtension<CommonSpacing> copyWith({
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
  }) {
    return CommonSpacing(
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
    );
  }

  @override
  ThemeExtension<CommonSpacing> lerp(
    ThemeExtension<CommonSpacing>? other,
    double t,
  ) {
    if (other is! CommonSpacing) return this;
    return CommonSpacing(
      xs: lerpDouble(xs, other.xs, t)!,
      sm: lerpDouble(sm, other.sm, t)!,
      md: lerpDouble(md, other.md, t)!,
      lg: lerpDouble(lg, other.lg, t)!,
      xl: lerpDouble(xl, other.xl, t)!,
    );
  }
}

class CommonRadius extends ThemeExtension<CommonRadius> {
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double full;

  CommonRadius({
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.full,
  });

  @override
  ThemeExtension<CommonRadius> copyWith({
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? full,
  }) {
    return CommonRadius(
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      full: full ?? this.full,
    );
  }

  @override
  ThemeExtension<CommonRadius> lerp(
    ThemeExtension<CommonRadius>? other,
    double t,
  ) {
    if (other is! CommonRadius) return this;
    return CommonRadius(
      sm: lerpDouble(sm, other.sm, t)!,
      md: lerpDouble(md, other.md, t)!,
      lg: lerpDouble(lg, other.lg, t)!,
      xl: lerpDouble(xl, other.xl, t)!,
      full: lerpDouble(full, other.full, t)!,
    );
  }
}

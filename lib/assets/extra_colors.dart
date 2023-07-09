import 'package:flutter/material.dart';

@immutable
class ExtraColors extends ThemeExtension<ExtraColors> {
  const ExtraColors({
    this.onBackgroundVariant,
  });

  final Color? onBackgroundVariant;

  @override
  ExtraColors copyWith({
    Color? onBackgroundVariant,
  }) {
    return ExtraColors(
      onBackgroundVariant: onBackgroundVariant ?? this.onBackgroundVariant,
    );
  }

  @override
  ExtraColors lerp(ExtraColors? other, double t) {
    if (other is! ExtraColors) {
      return this;
    }
    return ExtraColors(
      onBackgroundVariant: Color.lerp(
        onBackgroundVariant,
        other.onBackgroundVariant,
        t,
      ),
    );
  }
}

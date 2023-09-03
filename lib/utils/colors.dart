import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

class ColorPolyfill {
  static Color seedColor = const Color(0xFF006494);

  static Color getSurface(Brightness brightness) {
    CorePalette p = CorePalette.of(seedColor.value);
    return Color(p.neutral.get(brightness == Brightness.dark ? 6 : 98));
  }

  static Color getSurfaceDim(Brightness brightness) {
    CorePalette p = CorePalette.of(seedColor.value);
    return Color(p.neutral.get(brightness == Brightness.dark ? 6 : 87));
  }

  static Color getSurfaceBright(Brightness brightness) {
    CorePalette p = CorePalette.of(seedColor.value);
    return Color(p.neutral.get(brightness == Brightness.dark ? 24 : 98));
  }

  static Color getSurfaceContainerLowest(Brightness brightness) {
    CorePalette p = CorePalette.of(seedColor.value);
    return Color(p.neutral.get(brightness == Brightness.dark ? 4 : 100));
  }

  static Color getSurfaceContainerLow(Brightness brightness) {
    CorePalette p = CorePalette.of(seedColor.value);
    return Color(p.neutral.get(brightness == Brightness.dark ? 10 : 96));
  }

  static Color getSurfaceContainer(Brightness brightness) {
    CorePalette p = CorePalette.of(seedColor.value);
    return Color(p.neutral.get(brightness == Brightness.dark ? 12 : 94));
  }

  static Color getSurfaceContainerHigh(Brightness brightness) {
    CorePalette p = CorePalette.of(seedColor.value);
    return Color(p.neutral.get(brightness == Brightness.dark ? 17 : 92));
  }

  static Color getSurfaceContainerHighest(Brightness brightness) {
    CorePalette p = CorePalette.of(seedColor.value);
    return Color(p.neutral.get(brightness == Brightness.dark ? 22 : 90));
  }
}

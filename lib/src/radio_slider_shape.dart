import 'package:flutter/material.dart';

class RadioSliderThumbShape extends SliderComponentShape {
  bool outerCircle;
  Color? activeColor;

  RadioSliderThumbShape({this.outerCircle = true, this.activeColor});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(10);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    var outerValueStyle = Paint()
      ..color = (this.activeColor ?? sliderTheme.activeTickMarkColor)!
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;
    var innerValueStyle = Paint()
      ..color = (this.activeColor ?? sliderTheme.activeTickMarkColor)!
      ..style = PaintingStyle.fill;

    // paint the optional outer circle
    if (outerCircle == true) {
      context.canvas.drawCircle(center, 15, outerValueStyle);
    }

    // paint the inner circle
    context.canvas.drawCircle(center, 10, innerValueStyle);
  }
}

class RadioSliderTickMarkShape extends SliderTickMarkShape {
  RadioSliderTickMarkShape();

  @override
  Size getPreferredSize(
      {required SliderThemeData sliderTheme, required bool isEnabled}) {
    return Size.fromRadius(0);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required Animation<double> enableAnimation,
      required Offset thumbCenter,
      required bool isEnabled,
      required TextDirection textDirection}) {
    var innerStyle = Paint()
      ..color = sliderTheme.inactiveTickMarkColor!
      ..style = PaintingStyle.fill;

    var outerStyle = Paint()
      ..color = sliderTheme.inactiveTrackColor!
      ..style = PaintingStyle.fill;

    // outer circle
    context.canvas.drawCircle(center, 15, outerStyle);

    // inner circle
    context.canvas.drawCircle(center, 8, innerStyle);
  }
}

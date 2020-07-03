import 'package:flutter/material.dart';

class RadioSliderThumbShape extends SliderComponentShape {
  bool outerCircle;
  Color activeColor;

  RadioSliderThumbShape({this.outerCircle = true, this.activeColor});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(10);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {Animation<double> activationAnimation,
      Animation<double> enableAnimation,
      bool isDiscrete,
      TextPainter labelPainter,
      RenderBox parentBox,
      SliderThemeData sliderTheme,
      TextDirection textDirection,
      double value,
      double textScaleFactor,
      Size sizeWithOverflow}) {
    var outerValueStyle = Paint()
      ..color = this.activeColor ?? sliderTheme.activeTickMarkColor
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;
    var innerValueStyle = Paint()
      ..color = this.activeColor ?? sliderTheme.activeTickMarkColor
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
  Size getPreferredSize({SliderThemeData sliderTheme, bool isEnabled}) {
    return Size.fromRadius(0);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {RenderBox parentBox,
      SliderThemeData sliderTheme,
      Animation<double> enableAnimation,
      Offset thumbCenter,
      bool isEnabled,
      TextDirection textDirection}) {
    var innerStyle = Paint()
      ..color = sliderTheme.inactiveTickMarkColor
      ..style = PaintingStyle.fill;

    var outerStyle = Paint()
      ..color = sliderTheme.inactiveTrackColor
      ..style = PaintingStyle.fill;

    // outer circle
    context.canvas.drawCircle(center, 15, outerStyle);

    // inner circle
    context.canvas.drawCircle(center, 8, innerStyle);
  }
}

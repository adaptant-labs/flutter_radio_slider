import 'package:flutter/material.dart';
import 'radio_slider_orientation.dart';
import 'radio_slider_shape.dart';

class RadioSlider extends StatefulWidget {
  final int divisions;
  final bool outerCircle;
  final int value;
  final RadioSliderOrientation orientation;
  final ValueChanged<int> onChanged;
  final Color activeColor;

  const RadioSlider({
    Key key,
    this.divisions = 1,
    this.outerCircle = true,
    this.value = 0,
    this.orientation = RadioSliderOrientation.Horizontal,
    @required this.onChanged,
    this.activeColor,
  }) : assert(divisions >= 1),
       assert(value >= 0 && value <= divisions),
       super(key: key);

  @override
  _RadioSliderState createState() => _RadioSliderState();
}

class _RadioSliderState extends State<RadioSlider> {
  num _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  Widget _buildRadioSlider(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        tickMarkShape: RadioSliderTickMarkShape(),
        thumbShape: RadioSliderThumbShape(
          activeColor: widget.activeColor,
          outerCircle: widget.outerCircle,
        ),
      ),
      child: Slider(
        min: 0,
        max: widget.divisions.toDouble(),
        value: _value.toDouble(),
        divisions: widget.divisions,
        onChanged: (value) {
          if (_value != value) {
            setState(() {
              _value = value;
            });

            widget.onChanged(value.toInt());
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.orientation == RadioSliderOrientation.Vertical) {
      return RotatedBox(quarterTurns: 1, child: _buildRadioSlider(context));
    } else {
      return _buildRadioSlider(context);
    }
  }
}

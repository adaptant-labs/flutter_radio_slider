import 'package:flutter/material.dart';
import 'package:flutter_radio_slider/flutter_radio_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = SliderTheme.of(context).copyWith(
        trackHeight: 10,
        overlayColor: Colors.lightGreen.withAlpha(32),
        activeTickMarkColor: Colors.lightGreen,
        activeTrackColor: Colors.grey[300],
        inactiveTrackColor: Colors.grey[300],
        inactiveTickMarkColor: Colors.grey[500]);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RadioSlider Example'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Horizontal with Divisions - Inner circle only"),
            SliderTheme(
              data: themeData,
              child: RadioSlider(
                onChanged: (value) {
                  // Do something
                },
                value: 3,
                divisions: 5,
                outerCircle: false,
              ),
            ),
            Divider(),
            Text("Default"),
            RadioSlider(
              activeColor: Colors.blue,
              onChanged: (value) {/* no-op */},
            ),
            Divider(),
            Text("Vertical Orientation"),
            SliderTheme(
              data: themeData,
              child: RadioSlider(
                orientation: RadioSliderOrientation.Vertical,
                onChanged: (value) {
                  print("Value changed: ${value.toString()}");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

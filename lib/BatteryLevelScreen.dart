import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryLevelScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BatteryLevelScreenState();
  }
  }
class BatteryLevelScreenState extends State<BatteryLevelScreen>{
  var platform =  MethodChannel('samples.flutter.dev/battery');
  String _batteryLevel = 'Unknown battery level.';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(child: Text(""),);
  }
  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../presentation/controllers/switch_button_controller.dart';

class SwitchButton extends StatefulWidget {
  final bool initStatus;
  final Function(bool value) onChange;

  const SwitchButton(
      {super.key, required this.initStatus, required this.onChange});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  final SwitchButtonController controller = Get.put(SwitchButtonController());
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3.5.w,
      child: FlutterSwitch(
        width: 160.0,
        height: 3.5.w,
        valueFontSize: 25.0,
        toggleSize: 45.0,
        value: widget.initStatus,
        borderRadius: 30.0,
        padding: 8.0,
        inactiveText: "غير فعال",
        activeText: "فعال",
        showOnOff: true,
        onToggle: (val) {
          widget.onChange(val);
        },
      ),
    );
  }
}

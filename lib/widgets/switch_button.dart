import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/switch_button_controller.dart';

class SwitchButton extends StatelessWidget {
  final SwitchButtonController controller = Get.put(SwitchButtonController());

   SwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => InkWell(
        onTap: () {
          controller.toggleSwitch(!controller.switchValue.value);
        },
        child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            color: controller.switchValue.value ? Colors.lightBlue : Colors.grey,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                controller.switchValue.value ? 'فعال' : 'غير فعال',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                left: controller.switchValue.value ? 50 : 0,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
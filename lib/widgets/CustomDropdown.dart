import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdown extends GetxController {
  final String name;
  final List<String> choices;
  RxString selectedChoice = RxString('');

  CustomDropdown({required this.name, required this.choices});

  void setSelectedChoice(String? choice) {
    selectedChoice.value = choice ?? "  ";
    printSelectedChoice();
  }

  void printSelectedChoice() {
    if (kDebugMode) {
      print(selectedChoice.value);
    }
  }
}

class CustomDropdownWidget extends StatefulWidget {
  final CustomDropdown dropdown;

  const CustomDropdownWidget({super.key, required this.dropdown});

  @override
  State<CustomDropdownWidget> createState() => _CustomDropdownWidgetState();
}

class _CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  bool isExpanded = false;
  int hoveredIndex = -1;
  String selectedChoice = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.dropdown.name,
                    style: TextStyle(
                      color: isExpanded ? Colors.amber : Colors.white,
                    ),
                  ),
                ),
                Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: isExpanded ? Colors.amber : Colors.white,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF55579B), // Set the background color for choices list
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: const BoxConstraints(maxHeight: 200),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.dropdown.choices.length,
              itemBuilder: (context, index) {
                final choice = widget.dropdown.choices[index];
                final isHovered = index == hoveredIndex;

                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) {
                    setState(() {
                      hoveredIndex = index;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      hoveredIndex = -1;
                    });
                  },
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = false;
                        selectedChoice = choice;
                        hoveredIndex = -1;
                      });
                      printSelectedChoice();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isHovered
                            ? const Color(0xFFA2A3D0)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        choice,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  void printSelectedChoice() {
    if (kDebugMode) {
      print(selectedChoice);
    }
  }
}
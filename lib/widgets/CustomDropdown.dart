import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String name;
  final List<String> choices;

  const CustomDropdown({Key? key, required this.name, required this.choices})
      : super(key: key);

  @override
  CustomDropdownState createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
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
                Text(
                  widget.name,
                  style: TextStyle(
                    color: isExpanded ? Colors.amber : Colors.white,
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
              color: Color(0xFF55579B), // Set the background color for choices list
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.choices.length,
              itemBuilder: (context, index) {
                final choice = widget.choices[index];
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
                        color: isHovered ? Color(0xFFA2A3D0) : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        choice,
                        style: TextStyle(
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
    print(selectedChoice);
  }
}
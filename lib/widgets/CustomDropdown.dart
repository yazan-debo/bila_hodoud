import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String name;
  final List<String> choices;

  const CustomDropdown({required this.name, required this.choices});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedChoice;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2, // Adjust the width as needed
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: widget.name,
          border: OutlineInputBorder(),
        ),
        value: selectedChoice,
        onChanged: (newValue) {
          setState(() {
            selectedChoice = newValue;
          });
        },
        items: widget.choices.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
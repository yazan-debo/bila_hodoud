import 'package:flutter/material.dart';

class CustomSidebar extends StatelessWidget {
  final String loggedInUser;
  final List<String> dropdownTitles;

  const CustomSidebar({required this.dropdownTitles, required this.loggedInUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2, // Adjust the width as needed
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'بلا حدود',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          Column(
            children: dropdownTitles.map((title) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomDropdown(name: title, choices: ['Choice 1', 'Choice 2', 'Choice 3']),
              );
            }).toList(),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Logged in as: $loggedInUser',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
    return DropdownButtonFormField<String>(
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
    );
  }
}
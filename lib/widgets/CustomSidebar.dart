import 'package:flutter/material.dart';
import 'CustomDropdown.dart';
class CustomSidebar extends StatelessWidget {
  final String loggedInUser;
  final List<CustomDropdown> dropdowns;

  const CustomSidebar({
    Key? key,
    required this.dropdowns,
    required this.loggedInUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // Set the text direction to RTL
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxWidth: 300),
        color: const Color.fromRGBO(48, 55, 123, 1),
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
            Expanded(
              child: ListView.builder(
                itemCount: dropdowns.length,
                itemBuilder: (context, index) {
                  return CustomDropdownWidget(dropdown: dropdowns[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'تسجيل الدخول كـ: $loggedInUser',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
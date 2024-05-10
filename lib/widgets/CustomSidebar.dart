import 'package:flutter/material.dart';
import 'CustomDropdown.dart';

class CustomSidebar extends StatelessWidget {
  final String loggedInUser;
  final List<CustomDropdown> dropdowns;

  const CustomSidebar({
    Key? key,
    required this.dropdowns,
    required this.loggedInUser,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // Set the text direction to RTL
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 300),
        color: const Color.fromRGBO(48, 55, 123, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Container(
              color: Colors.white,

              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(48, 55, 123, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),

                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'بلا حدود',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: dropdowns.length,
                itemBuilder: (context, index) {
                  if (index < dropdowns.length - 1) {
                    return Column(
                      children: [
                        CustomDropdownWidget(dropdown: dropdowns[index]),
                        const SizedBox(height: 10),
                      ],
                    );
                  } else {
                    return CustomDropdownWidget(dropdown: dropdowns[index]);
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'تسجيل الدخول كـ: $loggedInUser',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
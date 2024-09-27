import 'package:flutter/material.dart';

class BloodGroupDropdown extends StatelessWidget {
  final String? selectedBloodGroup;
  final ValueChanged<String?> onChanged;

  const BloodGroupDropdown({
    Key? key,
    required this.selectedBloodGroup,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of blood groups
    const List<String> bloodGroups = [
      'A+',
      'A-',
      'B+',
      'B-',
      'AB+',
      'AB-',
      'O+',
      'O-',
    ];

    return DropdownButtonFormField<String>(
      value: selectedBloodGroup,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: 'Blood Group',
        border: OutlineInputBorder(),
      ),
      items: bloodGroups.map((String bloodGroup) {
        return DropdownMenuItem<String>(
          value: bloodGroup,
          child: Text(bloodGroup),
        );
      }).toList(),
    );
  }
}

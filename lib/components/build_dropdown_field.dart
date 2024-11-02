
  import 'package:flutter/material.dart';

import '../constant.dart';

Widget buildDropdownField({
    required String? value,
    required String labelText,
    required List<String> items,
    required IconData icon,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(labelStyle: TextStyle(color: text1Color),
          labelText: labelText,
          prefixIcon: Icon(icon, color: secondaryColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
        onChanged: onChanged,
      ),
    );
  }

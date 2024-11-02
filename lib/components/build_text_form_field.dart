


  import 'package:flutter/material.dart';

import '../constant.dart';

Widget buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    TextInputType? keyboardType,
    bool obscureText = false,
    bool readOnly=false,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        readOnly: readOnly,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon, color:secondaryColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

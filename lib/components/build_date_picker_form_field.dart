  import 'package:flutter/material.dart';

import '../constant.dart';

Widget buildDatePickerFormField(BuildContext context, {required TextEditingController controller, required String labelText, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon, color: secondaryColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onTap: () async {
          FocusScope.of(context).requestFocus(FocusNode()); // Hide keyboard on tap
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (pickedDate != null) {
            controller.text = pickedDate.toString().split(' ')[0]; // Format the date
          }
        },
      ),
    );
  }

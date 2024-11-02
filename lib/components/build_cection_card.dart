

  import 'package:flutter/material.dart';

import '../constant.dart';

Widget buildSectionCard(BuildContext context, {required String title, required IconData icon, required List<Widget> children ,double width=400}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(width: width,height: 525,
        child: Card(color: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, color:secondaryColor),
                    SizedBox(width: 8),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                ...children,
              ],
            ),
          ),
        ),
      ),
    );
 
  }
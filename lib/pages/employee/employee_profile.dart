import 'package:flutter/material.dart';
import 'package:school_app_desktop/components/app_bar.dart';

import '../../constant.dart';




class EmployeeProfilePage extends StatefulWidget {
  const EmployeeProfilePage({super.key});

  @override
  _EmployeeProfilePageState createState() => _EmployeeProfilePageState();
}

class _EmployeeProfilePageState extends State<EmployeeProfilePage> {
  bool isEditing = false; // State to track editing mode

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appBar(title: "بيانات الموظف"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile Header Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    children: [
                      CircleAvatar(
                        radius: 40.0,
                        backgroundColor: primaryColor,
                        child: Icon(
                          Icons.person,
                          size: 60.0,
                          color: text1Color,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        "أمير علي حمزة",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        "GB39BARC20040184996218",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        "2024, Month 1",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // Employee Information Cards Section (Using Wrap)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  buildInfoCard("الراتب الاسمي", "1000.000 IQD"),
                  buildInfoCard("مجموعة الاستقطاعات", "100.000 IQD"),
                  buildInfoCard("مجموعة المخصصات", "500.000 IQD"),
                  buildInfoCard("صافي الراتب", "1000.000 IQD"),
                  buildInfoCard("العنوان الوظيفي", "مدير"),
                  buildInfoCard("الشهادة", "بكالوريوس"),
                  buildInfoCard("مخصصات النقل", "50.000 IQD"),
                  buildInfoCard("مخصصات الزوجية", "50.000 IQD"),
                  buildInfoCard("مجموعة الاجازات", "8 أيام"),
                  buildInfoCard("مجموعة الغيابات", "1 يوم"),
                  buildInfoCard("استقطاعات الغيابات", "25.000 IQD"),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            // Edit Button with Animation
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height:  60.0,
              width: 200.0,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: 
                   ElevatedButton(
                      onPressed: () {
                       
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor:secondaryColor,
                      ),
                      child: const Text(
                        "تعديل البيانات",
                        style: TextStyle(fontSize: 18.0,color: primaryColor),
                      ),
                    ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  // Widget for building individual info cards
  Widget buildInfoCard(String title, String value) {
    return SizedBox(
      width: 205,
      height: 130,
      child: Card(
        color: primaryColor,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: text1Color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

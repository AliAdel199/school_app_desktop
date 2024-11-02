import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_app_desktop/components/app_bar.dart';

import '../../constant.dart';

class StudentDataScreen extends StatefulWidget {
  @override
  _StudentDataScreenState createState() => _StudentDataScreenState();
}

class _StudentDataScreenState extends State<StudentDataScreen> {
  final List<Map<String, dynamic>> _students = [
    {
      "name": "أمير علي حمزة",
      "phone": "0780XXXXXXX",
      "totalInstallment": "1000.000 IQD",
      "remainingInstallment": "500.000 IQD",
    },
    {
      "name": "علي عادل مصبح",
      "phone": "0780XXXXXXX",
      "totalInstallment": "1000.000 IQD",
      "remainingInstallment": "650.000 IQD",
    },
    {
      "name": "سجاد احمد محمد",
      "phone": "0780XXXXXXX",
      "totalInstallment": "1000.000 IQD",
      "remainingInstallment": "250.000 IQD",
    },
    {
      "name": "كرار حيدر صباح",
      "phone": "0780XXXXXXX",
      "totalInstallment": "1000.000 IQD",
      "remainingInstallment": "000.000 IQD",
    },
    {
      "name": "مصطفى حيدر علي",
      "phone": "0780XXXXXXX",
      "totalInstallment": "1000.000 IQD",
      "remainingInstallment": "750.000 IQD",
    },
    {
      "name": "حسين حيدر علي",
      "phone": "0780XXXXXXX",
      "totalInstallment": "1000.000 IQD",
      "remainingInstallment": "1000.000 IQD",
    },
    {
      "name": "أمير علي حمزة",
      "phone": "0780XXXXXXX",
      "totalInstallment": "1000.000 IQD",
      "remainingInstallment": "500.000 IQD",
    },
    {
      "name": "علي عادل مصبح",
      "phone": "0780XXXXXXX",
      "totalInstallment": "1000.000 IQD",
      "remainingInstallment": "650.000 IQD",
    },
    {
      "name": "سجاد احمد محمد",
      "phone": "0780XXXXXXX",
      "totalInstallment": "1000.000 IQD",
      "remainingInstallment": "250.000 IQD",
    },
    {
      "name": "كرار حيدر صباح",
      "phone": "0780XXXXXXX",
      "totalInstallment": "1000.000 IQD",
      "remainingInstallment": "000.000 IQD",
    },
    {
      "name": "مصطفى حيدر علي",
      "phone": "0780XXXXXXX",
      "totalInstallment": "1000.000 IQD",
      "remainingInstallment": "750.000 IQD",
    },
    {
      "name": "حسين حيدر علي",
      "phone": "0780XXXXXXX",
      "totalInstallment": "1000.000 IQD",
      "remainingInstallment": "1000.000 IQD",
    },
  ];

  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'بيانات الطلاب'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          // شريط البحث
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 115.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 500,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _searchText = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'البحث',
                        prefixIcon: Icon(
                          Icons.search,
                          color: secondaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: SingleChildScrollView(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: DataTable(
                      sortColumnIndex: 1,
                    sortAscending: true,
                    columnSpacing: 150,
                    dataRowMaxHeight: 75,
                    headingRowColor:
                        MaterialStateProperty.resolveWith((states) {
                      // If the button is pressed, return green, otherwise blue
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.green;
                      }
                      return secondaryColor;
                    }),
                  
                    columns: const [
                      DataColumn(label: Text('الاسم')),
                      DataColumn(label: Text('رقم الموبايل')),
                      DataColumn(label: Text('القسط الكلي')),
                      DataColumn(label: Text('القسط المتبقي')),
                      DataColumn(label: Text('')),
                    ],
                    rows: _students
                        .where((student) =>
                            student["name"]
                                .toLowerCase()
                                .contains(_searchText.toLowerCase()) ||
                            student["phone"]
                                .toLowerCase()
                                .contains(_searchText.toLowerCase()))
                        .map(
                          (student) => DataRow(
                            cells: [
                            DataCell(
                              Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: secondaryColor,
                                  child:
                                      Icon(Icons.person, color: Colors.white),
                                ),
                                SizedBox(width: 8),
                                Text(student["name"]),
                              ],
                            )),
                            DataCell(Text(student["phone"])),
                            DataCell(Text(student["totalInstallment"])),
                            DataCell(Text(student["remainingInstallment"])),
                            DataCell(ElevatedButton(
                              style: ButtonStyle(backgroundColor:
                                  MaterialStateProperty.resolveWith((states) {
                                // If the button is pressed, return green, otherwise blue
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.green;
                                }
                                return secondaryColor;
                              })),
                              onPressed: () {
                                // تنفيذ عرض التفاصيل
                              },
                              child: Text(
                                'عرض التفاصيل',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                          ]),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../components/app_bar.dart';
import '../../components/build_cection_card.dart';
import '../../components/build_date_picker_form_field.dart';
import '../../components/build_dropdown_field.dart';
import '../../components/build_text_form_field.dart';

class AddStudentScreen extends StatefulWidget {
  @override
  _AddStudentScreenState createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for the TextFormFields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController studentTokenController = TextEditingController();
  final TextEditingController schoolNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController studentClassController = TextEditingController();
  final TextEditingController totalInstallmentsController = TextEditingController();
  final TextEditingController remainingInstallmentController = TextEditingController();
  final TextEditingController phoneNumber1Controller = TextEditingController();
  final TextEditingController phoneNumber2Controller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController educationalLevelController = TextEditingController();
  final TextEditingController dateJoinedController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  String? selectedGender;
  String? selectedStage;
  String? selectedStatus;
  bool isSaving = false; // Indicator for saving state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'إضافة بيانات الطالب'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(spacing: 20,crossAxisAlignment: WrapCrossAlignment.center,
                     // نسبة العرض إلى الارتفاع للبطاقات
                      children: [
                        buildSectionCard(
                          context,
                          title: 'معلومات الطالب',
                          icon: Icons.person,
                          children: [
                            buildTextFormField(
                              controller: nameController,
                              labelText: 'اسم الطالب',
                              icon: Icons.person,
                            ),
                            buildDatePickerFormField(
                              context,
                              controller: birthdateController,
                              labelText: 'تاريخ الميلاد',
                              icon: Icons.calendar_today,
                            ),
                            buildDropdownField(
                              value: selectedGender,
                              labelText: 'الجنس',
                              items: ['ذكر', 'أنثى'],
                              icon: Icons.wc,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value;
                                });
                              },
                            ),
                              buildTextFormField(
                              controller: locationController,
                              labelText: 'العنوان',
                              icon: Icons.location_on,
                            ),
                            buildTextFormField(
                              controller: phoneNumber1Controller,
                              labelText: 'رقم الهاتف 1',
                              icon: Icons.phone,
                              keyboardType: TextInputType.phone,
                            ),
                            buildTextFormField(
                              controller: phoneNumber2Controller,
                              labelText: 'رقم الهاتف 2',
                              icon: Icons.phone,
                              keyboardType: TextInputType.phone,
                            ),
                          ],
                        ),
                        buildSectionCard(
                          context,
                          title: ' معلومات المدرسة والبيانات المالية',
                          icon: Icons.school,
                          children: [
                            buildTextFormField(
                              controller: schoolNameController,
                              labelText: 'اسم المدرسة',
                              icon: Icons.school,
                            ),
                          
                            buildDropdownField(
                              value: selectedStage,
                              labelText: 'المرحلة الدراسية',
                              items: ['الإبتدائية', 'الإعدادية', 'الثانوية'],
                              icon: Icons.grade,
                              onChanged: (value) {
                                setState(() {
                                  selectedStage = value;
                                });
                              },
                            ),
                            buildTextFormField(
                              controller: studentClassController,
                              labelText: 'الصف الدراسي',
                              icon: Icons.class_,
                            ),
                                    buildTextFormField(
                              controller: totalInstallmentsController,
                              labelText: 'إجمالي الأقساط',
                              icon: Icons.attach_money,
                              keyboardType: TextInputType.number,
                            ),
                     
                            buildTextFormField(
                              controller: discountController,
                              labelText: 'نسبة الخصم',
                              icon: Icons.percent,
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                   
                      
                        buildSectionCard(
                          context,
                          title: 'معلومات إضافية',
                          icon: Icons.info,
                          children: [
                            buildTextFormField(
                              controller: educationalLevelController,
                              labelText: 'المستوى التعليمي',
                              icon: Icons.school,
                            ),
                            buildDatePickerFormField(
                              context,
                              controller: dateJoinedController,
                              labelText: 'تاريخ الانضمام',
                              icon: Icons.calendar_today,
                            ),
                            buildDropdownField(
                              value: selectedStatus,
                              labelText: 'الحالة',
                              items: ['نشط', 'غير نشط'],
                              icon: Icons.toggle_on,
                              onChanged: (value) {
                                setState(() {
                                  selectedStatus = value;
                                });
                              },
                            ),
                               
                            buildTextFormField(
                              controller: emailController,
                              labelText: 'البريد الإلكتروني',
                              icon: Icons.email,
                              keyboardType: TextInputType.emailAddress,
                            ),
                          
                            buildTextFormField(
                              controller: notesController,
                              labelText: 'ملاحظات',
                              icon: Icons.notes,
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10), // إضافة مسافة بين النموذج والأزرار
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // زر حفظ البيانات
                    ElevatedButton(
                      onPressed: isSaving ? null : _saveData,
                      child: isSaving
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text('حفظ البيانات'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                SizedBox(width: 50), // إضافة مسافة بين النموذج والأزرار

                    // زر الرجوع
                    ElevatedButton(
                      onPressed: isSaving
                          ? null
                          : () {
                              Navigator.pop(context); // الرجوع إلى الصفحة السابقة
                            },
                      child: Text('الرجوع'),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  void _saveData() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isSaving = true;
      });

      // Simulate a save process
      await Future.delayed(Duration(seconds: 2));

      setState(() {
        isSaving = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تم حفظ البيانات بنجاح!')),
      );
    }
  }



}

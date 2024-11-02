import 'package:flutter/material.dart';

import '../../components/app_bar.dart';
import '../../components/build_cection_card.dart';
import '../../components/build_date_picker_form_field.dart';
import '../../components/build_dropdown_field.dart';
import '../../components/build_text_form_field.dart';

class EditEmployeeScreen extends StatefulWidget {
  @override
  _EditEmployeeScreenState createState() => _EditEmployeeScreenState();
}

class _EditEmployeeScreenState extends State<EditEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for the TextFormFields
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController employeeTokenController = TextEditingController();
  final TextEditingController jobLocationController = TextEditingController();

  final TextEditingController phoneNumber1Controller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateJoinedController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  String? selectedGender;
  String? selectedMared;
  String? selectedCertificates;

  
  bool isSaving = false; // Indicator for saving state


  TextEditingController empName = TextEditingController();
  TextEditingController empjobTitle = TextEditingController();
  TextEditingController serviceYearsAllowance = TextEditingController();
  TextEditingController transportAllowance = TextEditingController();
  TextEditingController educationAllowance = TextEditingController();
  TextEditingController autherAllowance = TextEditingController();

  TextEditingController baseSalary = TextEditingController();
  TextEditingController ibanController = TextEditingController();
  TextEditingController bankSwift = TextEditingController();
  TextEditingController marriageAllowance = TextEditingController();
  TextEditingController childrenAllowance = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController empPhoneNumber = TextEditingController();



//الضمان
  TextEditingController socialSecurity = TextEditingController();
  TextEditingController taqaud = TextEditingController();
  TextEditingController selfa = TextEditingController();
  TextEditingController autherDeduction = TextEditingController();



  TextEditingController netSalary = TextEditingController();

  int serviceYearsAllowanceMoney = 0;
  int transportAllowanceMoney = 0;
  int educationAllowanceMoney = 0;
  int empBonusesMoney = 0;
  int baseSalaryMoney = 0;
  int socialSecurityMoney = 0;
  int marriageAllowanceMoney = 0;

  int netSalaryMoney = 0;

  List<String> certificates = [
    "دكتوراه",
    "ماجستير",
    "بكالوريوس",
    "دبلوم",
    "اعدادية",
    "ابتدائية",
    "بدون مؤهل"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'إضافة بيانات الموظف'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(flex: 9,
                  child: SingleChildScrollView(
                    child: Wrap(spacing: 20,crossAxisAlignment: WrapCrossAlignment.center,
                     // نسبة العرض إلى الارتفاع للبطاقات
                      children: [
                        buildSectionCard(width: 500,
                          context,
                          title: 'معلومات الموظف',
                          icon: Icons.person,
                          children: [
                            buildTextFormField(
                              controller: empName,
                              labelText: 'اسم الموظف',
                              icon: Icons.person,
                            ),
                             buildTextFormField(
                              controller: empjobTitle,
                              labelText: 'العنوان الوظيفي',
                              icon: Icons.title,
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
                              buildDropdownField(
                              value: selectedMared,
                              labelText: 'الحالة الزوجية',
                              items: [ 'اعزب','متزوج'],
                              icon: Icons.handshake_outlined,
                              onChanged: (value) {
                                setState(() {
                                  selectedMared = value;
                                });
                              },
                            ),
                              buildDropdownField(
                              value:selectedCertificates ,
                              labelText: 'التحصيل الدراسي',
                              items: certificates,
                              icon: Icons.school_outlined,
                              onChanged: (value) {
                                setState(() {
                                  selectedCertificates = value;
                                });
                              },
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: buildDatePickerFormField(context,
                                    controller: birthdateController,
                                    labelText: 'تاريخ التولد',
                                    icon: Icons.date_range,
                                    // keyboardType: TextInputType.text,
                                  ),
                                ),SizedBox(width: 10,),
                                  Expanded(
                                    child: buildDatePickerFormField(context,
                                    controller: dateJoinedController,
                                    labelText: 'تاريخ المباشرة',
                                    icon: Icons.date_range,
                                    // keyboardType: TextInputType.text,
                                                                    ),
                                  ),
                              ],
                            ),
                           
                          ],
                        ),
                        buildSectionCard(width: 500,
                          context,
                          title: 'المخصصات',
                          icon: Icons.attach_money_sharp,
                          children: [
                            buildTextFormField(
                              controller: baseSalary,
                              labelText: 'الراتب الاسمي',
                              icon: Icons.attach_money,
                            ),
                          
                            // buildDropdownField(
                            //   value: selectedStage,
                            //   labelText: 'المرحلة الدراسية',
                            //   items: ['الإبتدائية', 'الإعدادية', 'الثانوية'],
                            //   icon: Icons.grade,
                            //   onChanged: (value) {
                            //     setState(() {
                            //       selectedStage = value;
                            //     });
                            //   },
                            // ),
                            buildTextFormField(
                              controller: educationAllowance,
                              labelText: 'مخصصات الشهادة',
                              icon: Icons.attach_money,
                            ),
                                    buildTextFormField(
                              controller: marriageAllowance,
                              labelText: 'مخصصات الزوجية',
                              icon: Icons.attach_money,
                              keyboardType: TextInputType.number,
                            ),
                                 buildTextFormField(
                              controller: childrenAllowance,
                              labelText: 'مخصصات الاطفال',
                              icon: Icons.attach_money,
                              keyboardType: TextInputType.number,
                            ),
                             buildTextFormField(
                              controller: transportAllowance,
                              labelText: 'مخصصات النقل',
                              icon: Icons.attach_money,
                              keyboardType: TextInputType.number,
                            ),
                                    buildTextFormField(
                              controller: serviceYearsAllowance,
                              labelText: 'مخصصات سنوات الخدمة',
                              icon: Icons.attach_money,
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                   
                      
                        buildSectionCard(width: 500,
                          context,
                          title: 'الاستقطاعات والصافي',
                          icon: Icons.info,
                          children: [
                            buildTextFormField(
                              controller: autherAllowance,
                              labelText: 'مخصصات اخرى',
                              icon: Icons.attach_money,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            buildTextFormField(
                              controller: socialSecurity,
                              labelText: 'الضريبة',
                              icon: Icons.money_off,
                            ),
                             buildTextFormField(
                              controller: taqaud,
                              labelText: 'التقاعد',
                              icon: Icons.money_off,
                            ),
                             buildTextFormField(
                              controller: selfa,
                              labelText: 'سلفة من الراتب',
                              icon: Icons.money_off,
                            ),
                            //  buildDatePickerFormField(
                            //   context,
                            //   controller: dateJoinedController,
                            //   labelText: 'التقاعد',
                            //   icon: Icons.calendar_today,
                            // ),
                            // buildDropdownField(
                            //   value: selectedStatus,
                            //   labelText: 'الحالة',
                            //   items: ['نشط', 'غير نشط'],
                            //   icon: Icons.toggle_on,
                            //   onChanged: (value) {
                            //     setState(() {
                            //       selectedStatus = value;
                            //     });
                            //   },
                            // ),
                               
                            buildTextFormField(
                              controller: autherDeduction,
                              labelText: 'استقطاعات اخرى',
                              icon: Icons.money_off,
                              keyboardType: TextInputType.emailAddress,
                            ),
                          
                          buildTextFormField(
                              controller: netSalary,
                              labelText: 'صافي الراتب',
                              icon: Icons.attach_money_sharp,
                              keyboardType: TextInputType.number,readOnly: true 
                            ),
                          ],
                        ),
                     
                        buildSectionCard(width: 500,
                          context,
                          title: 'معلومات إضافية',
                          icon: Icons.info,
                          children: [
                            buildTextFormField(
                              controller: phoneNumber1Controller,
                              labelText: 'رقم الهاتف',
                              icon: Icons.phone_android_rounded,
                            ),
                             buildTextFormField(
                              controller: jobLocationController,
                              labelText: 'محل العمل',
                              icon: Icons.place,
                              keyboardType: TextInputType.text,
                            ),
                             buildTextFormField(
                              controller: ibanController,
                              labelText: 'الحساب المصرفي Iban',
                              icon: Icons.credit_card,
                            ),
                             
                            //  buildDatePickerFormField(
                            //   context,
                            //   controller: dateJoinedController,
                            //   labelText: 'التقاعد',
                            //   icon: Icons.calendar_today,
                            // ),
                            // buildDropdownField(
                            //   value: selectedStatus,
                            //   labelText: 'الحالة',
                            //   items: ['نشط', 'غير نشط'],
                            //   icon: Icons.toggle_on,
                            //   onChanged: (value) {
                            //     setState(() {
                            //       selectedStatus = value;
                            //     });
                            //   },
                            // ),
                               
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
                Expanded(flex: 1,
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // زر حفظ البيانات
                      SizedBox(height: 50,width: 150,
                        child: ElevatedButton(
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
                      ),
                  SizedBox(width: 50), // إضافة مسافة بين النموذج والأزرار
                  
                      // زر الرجوع
                      SizedBox(height: 50,width: 150,
                        child: ElevatedButton(
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
                      ),
                    ],
                  ),
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

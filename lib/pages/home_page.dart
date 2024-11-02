import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_app_desktop/components/app_bar.dart';
import 'package:school_app_desktop/pages/employee/add_employee.dart';
import 'package:school_app_desktop/pages/employee/employee_profile.dart';
import 'package:school_app_desktop/pages/student/add_student_screen.dart';
import 'package:school_app_desktop/pages/student/students_data.dart';
import 'package:school_app_desktop/pages/user_manger.dart';

import '../constant.dart';
import '../model/student.dart';

List<Installment> installments1 = [
  Installment(amount: 1500, dueDate: '2024-09-01', isPaid: true),
  Installment(amount: 1500, dueDate: '2024-10-01', isPaid: false),
  Installment(amount: 1500, dueDate: '2024-11-01', isPaid: false),
];

List<Installment> installments2 = [
  Installment(amount: 1000, dueDate: '2024-09-15', isPaid: true),
  Installment(amount: 1000, dueDate: '2024-10-15', isPaid: false),
  Installment(amount: 1000, dueDate: '2024-11-15', isPaid: false),
];

class HomePage extends StatelessWidget {
  // كائنات الطلاب التجريبية (Student objects)
  Student student1 = Student(
    name: 'أحمد علي',
    birthdate: '2006-07-10',
    gender: 'ذكر',
    studentToken: 'ST123456',
    schoolName: 'مدرسة النور',
    location: 'جدة',
    stage: 'الإعدادية',
    studentClass: 'الصف الثامن',
    totalInstallments: 4500,
    remainingInstallment: 3000,
    phoneNumber1: '0541234567',
    phoneNumber2: '0547654321',
    installmentsList: installments1,
    hasBrother: 'نعم',
    status: 'نشط',
    educationalLevel: 'الإعدادية',
    dateJoined: '2022-09-01',
    discount: 10.0,
    email: 'ahmed.ali@example.com',
    password: 'password123',
    notes: 'طالب متميز',
  );

  Student student2 = Student(
    name: 'سارة محمد',
    birthdate: '2007-04-25',
    gender: 'أنثى',
    studentToken: 'ST7891011',
    schoolName: 'مدرسة الفجر',
    location: 'الرياض',
    stage: 'الثانوية',
    studentClass: 'الصف الحادي عشر',
    totalInstallments: 3000,
    remainingInstallment: 2000,
    phoneNumber1: '0551239876',
    phoneNumber2: '0559876543',
    installmentsList: installments2,
    hasBrother: 'لا',
    status: 'نشط',
    educationalLevel: 'الثانوية',
    dateJoined: '2021-09-01',
    discount: 5.0,
    email: 'sara.mohammed@example.com',
    password: 'password456',
    notes: 'تحتاج إلى دعم في الرياضيات',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'ثانوية الوتار الابتدائية الاهلية'),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/homebg.jpg"),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              // القسم الأيمن: عرض التقارير باستخدام مخططات
              Expanded(
                flex: 1, // تخصيص حجم القسم الأيمن (المخططات)
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50),
                          child: ListView(
                            children: [
                              // ReportChart(
                              //   title: 'الحضور الشهري للطلاب',
                              //   chart: LineChart(
                              //     LineChartData(
                              //       gridData: FlGridData(show: true),
                              //       titlesData: FlTitlesData(show: true),
                              //       borderData: FlBorderData(show: true),
                              //       lineBarsData: [
                              //         LineChartBarData(
                              //           spots: [
                              //             FlSpot(0, 1),
                              //             FlSpot(1, 3),
                              //             FlSpot(2, 5),
                              //             FlSpot(3, 2),
                              //             FlSpot(4, 4),
                              //             FlSpot(5, 3),
                              //           ],
                              //           isCurved: true,
                              //           colors: [Colors.blue],
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              ReportChart(
                                title: 'توزيع الطلاب حسب الفئات',
                                chart: PieChart(
                                  PieChartData(
                                    sections: [
                                      PieChartSectionData(
                                        color: Colors.blue,
                                        value: 350,
                                        title: 'الصف الأول',
                                        radius: 60,
                                      ),
                                      PieChartSectionData(
                                        color: Colors.orange,
                                        value: 100,
                                        title: 'الصف الثاني',
                                        radius: 60,
                                      ),
                                      PieChartSectionData(
                                        color: Colors.green,
                                        value: 250,
                                        title: 'الصف الثالث',
                                        radius: 60,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ReportChart(
                                title: 'أداء الموظفين',
                                chart: BarChart(
                                  BarChartData(
                                    axisTitleData: FlAxisTitleData(
                                        leftTitle: AxisTitle(
                                            textStyle: const TextStyle(
                                                color: secondaryColor))),
                                    borderData: FlBorderData(
                                        border: Border.all(
                                            color:  secondaryColor)),
                                    titlesData: FlTitlesData(
                                        show: true,
                                        rightTitles: SideTitles(),topTitles: SideTitles(),
                                        leftTitles: SideTitles(
                                          showTitles: true,
                                          getTitles: (value) {
                                            return '${value.toInt()}'; // Y-axis labels
                                          },
                                          getTextStyles: (context, value) {
                                            return const TextStyle(
                                              color: Color(
                                                  0xff00ADB5), // Change this to your desired color
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            );
                                          },
                                        ),
                                        bottomTitles:SideTitles(
                                          showTitles: true,
                                          getTitles: (value) {
                                            return '${value.toInt()}'; // Y-axis labels
                                          },
                                          getTextStyles: (context, value) {
                                            return const TextStyle(
                                              color: Color(
                                                  0xff00ADB5), // Change this to your desired color
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            );
                                          },
                                        ), ),
                                        
                                    gridData: FlGridData(show: true),
                                    barGroups: [
                                      BarChartGroupData(x: 1, barRods: [
                                        BarChartRodData(y: 5, colors: [
                                          Colors.blue,
                                        ])
                                      ]),
                                      BarChartGroupData(x: 2, barRods: [
                                        BarChartRodData(
                                            y: 3, colors: [Colors.orange])
                                      ]),
                                      BarChartGroupData(x: 3, barRods: [
                                        BarChartRodData(
                                            y: 7, colors: [Colors.green])
                                      ]),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20), // إضافة مسافة بين القسمين

              // القسم الأيسر: الأزرار (الكاردات)
              Directionality(
                textDirection: TextDirection.rtl,
                child: Expanded(
                  flex: 1, // تخصيص حجم القسم الأيسر (الأزرار)
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 150),
                    child: GridView.count(
                      crossAxisCount: MediaQuery.of(context).size.width > 1200
                          ? 3
                          : 2, // 3 أعمدة للشاشات الكبيرة و 2 للأصغر
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        HomeCard(
                          icon: Icons.person_add,
                          title: 'إضافة طالب جديد',
                          count: null,
                          // menuItems: ['تحديث', 'حذف'],
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddStudentScreen()));
                            // إضافة طالب جديد
                          },
                        ),
                        HomeCard(
                          icon: Icons.school,
                          title: 'بيانات الطلاب',
                          count: 120, // العداد لعدد الطلاب
                          // menuItems: ['عرض التفاصيل', 'تحديث'],
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StudentDataScreen(),
                                ));

                            // بيانات الطلاب
                          },
                        ),
                        HomeCard(
                          icon: Icons.person_add_alt,
                          title: 'إضافة موظف جديد',
                          count: null,
                          // menuItems: ['تحديث', 'حذف'],
                          onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddEmployeeScreen(),
                                ));
                            // إضافة موظف جديد
                          },
                        ),
                        HomeCard(
                          icon: Icons.people,
                          title: 'بيانات الموظفين',
                          count: 30, // العداد لعدد الموظفين
                          // menuItems: ['عرض التفاصيل', 'تحديث'],
                          onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AdminManagementPage(),
                                ));
                            // بيانات الموظفين
                          },
                        ),
                        HomeCard(
                          icon: Icons.credit_score_outlined,
                          title: 'رواتب الموظفين',
                          count: 30, // العداد لعدد الموظفين
                          // menuItems: ['عرض التفاصيل', 'تحديث'],
                          onTap: () {
                             Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EmployeeProfilePage(),
                                ));
                            // بيانات الموظفين
                          },
                        ),
                        HomeCard(
                          icon: Icons.insert_chart_outlined,
                          title: 'تقارير عامة',
                          count: null,
                          // menuItems: ['عرض التقرير', 'تحديث'],
                          onTap: () {
                            // تقارير عامة
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final int? count;
  final List<String>? menuItems;

  const HomeCard({
    required this.icon,
    required this.title,
    required this.onTap,
    this.count,
    this.menuItems,
  });

  @override
  _HomeCardState createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  bool _isHovered = false;
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isTapped = true),
      onTapUp: (_) => setState(() => _isTapped = false),
      onTapCancel: () => setState(() => _isTapped = false),
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (event) => setState(() => _isHovered = true),
        onExit: (event) => setState(() => _isHovered = false),
        child: AnimatedScale(
          scale: _isTapped
              ? 0.95
              : _isHovered
                  ? 1.05
                  : 1.0,
          duration: const Duration(milliseconds: 300),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: _isHovered ? Color(0xffeeeeee) :  primaryColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: _isHovered ? 15 : 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Center(
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      AnimatedScale(
                        scale: _isHovered ? 1.2 : 1.0,
                        duration: const Duration(milliseconds: 300),
                        child: Icon(widget.icon,
                            size: 60, color:  secondaryColor),
                      ),
                      const SizedBox(height: 16),
                      if (widget.count != null) ...[
                        Text(
                          '${widget.count}',
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: secondaryColor),
                        ),
                        const SizedBox(height: 8),
                      ],
                      Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color:
                              _isHovered ? primaryColor :Color(0xffeeeeee) ,
                        ),
                      ),
                    ],
                  ),
                  if (widget.menuItems != null)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: PopupMenuButton<String>(
                        icon: const Icon(Icons.more_vert),
                        onSelected: (String value) {
                          print('$value selected for ${widget.title}');
                        },
                        itemBuilder: (BuildContext context) {
                          return widget.menuItems!.map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class ReportChart extends StatelessWidget {
  final String title;
  final Widget chart;

  const ReportChart({
    required this.title,
    required this.chart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            const BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[50]),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200, // تحديد ارتفاع المخطط
              child: chart,
            ),
          ],
        ),
      ),
    );
  }
}

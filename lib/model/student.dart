class Installment {
  double amount;
  String dueDate;
  bool isPaid;

  Installment({
    required this.amount,
    required this.dueDate,
    required this.isPaid,
  });
}

class Student {
  String name;
  String birthdate;
  String gender;
  String studentToken;
  String schoolName;
  String location;
  String stage;
  String studentClass;
  double totalInstallments;
  double remainingInstallment;
  String phoneNumber1;
  String phoneNumber2;
  List<Installment> installmentsList=[];
  String hasBrother; // Could be 'yes' or 'no'
  String status; // Could be 'active' or 'inactive'
  String educationalLevel;
  String dateJoined;
  double discount;
  String email;
  String password;
  String notes;

  Student({
    required this.name,
    required this.birthdate,
    required this.gender,
    required this.studentToken,
    required this.schoolName,
    required this.location,
    required this.stage,
    required this.studentClass,
    required this.totalInstallments,
    required this.remainingInstallment,
    required this.phoneNumber1,
    required this.phoneNumber2,
    required this.installmentsList,
    required this.hasBrother,
    required this.status,
    required this.educationalLevel,
    required this.dateJoined,
    required this.discount,
    required this.email,
    required this.password,
    required this.notes,
  });
}
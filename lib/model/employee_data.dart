class EmployeeData {
  final String fullName;
  final String position;
  final String phoneNumber;
  final String email;
  final String salary;
  final int? id;

  EmployeeData(
    this.id, {
    required this.fullName,
    required this.position,
    required this.phoneNumber,
    required this.email,
    required this.salary,
  });

  Map<String, String>? toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'position': position,
      'salary': salary
    };
  }

  EmployeeData.fromJson(Map<String, dynamic> json)
      : id = json['id']!,
        fullName = json['fullName']!,
        phoneNumber = json['phoneNumber']!,
        position = json['position']!,
        email = json['email']!,
        salary = json['salary']!;
}

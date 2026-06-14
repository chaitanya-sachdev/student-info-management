class Student {
  final int? id;
  final String name;
  final String rollNumber;
  final String email;
  final double cgpa;

  Student({
    this.id,
    required this.name,
    required this.rollNumber,
    required this.email,
    required this.cgpa,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      rollNumber: json['roll_number'],
      email: json['email'],
      cgpa: double.parse(json['cgpa'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'roll_number': rollNumber,
      'email': email,
      'cgpa': cgpa,
    };
  }
}

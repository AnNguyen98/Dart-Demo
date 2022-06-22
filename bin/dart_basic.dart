Future<void> main(List<String> arguments) async {
  int? a;

  final _ = a ?? 100;

  a ??= 100;

  final ages = <int>[];

  ages.addAll([]);

  // numbers = <int>[1, 2, 3, ...ages];
  // print(a);
}

class User {
  final String balance;
  final String picture;
  final int age;
  final String name;
  final String gender;
  final String company;
  final String email;
  User({
    required this.balance,
    required this.picture,
    required this.age,
    required this.name,
    required this.gender,
    required this.company,
    required this.email,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        balance: json['balance'] as String,
        picture: json['picture'] as String,
        age: json['age'] as int,
        name: json['name'] as String,
        gender: json['gender'] as String,
        company: json['company'] as String,
        email: json['email'] as String);
  }
  Map<String, dynamic> toJson(User instance) => {
        'balance': instance.balance,
        'picture': instance.picture,
        'age': instance.age,
        'name': instance.name,
        'gender': instance.gender,
        'company': instance.company,
        'email': instance.email
      };
}

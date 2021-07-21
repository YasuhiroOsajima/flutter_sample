class Member {
  final String name;
  final int age;
  final String job;

  Member(this.name, this.age, this.job);

  Member.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'],
        job = json['job'];

  Map<String, dynamic> toJson() => {'name': name, 'age': age, 'job': job};
}

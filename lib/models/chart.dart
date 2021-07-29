class Chart {
  final String name;
  final double value;

  Chart(
    this.name,
    this.value,
  );

  Chart.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        value = json['value'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'value': value,
      };
}

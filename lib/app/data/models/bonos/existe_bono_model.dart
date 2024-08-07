class ExisteBonoModel {
  final bool existe;

  ExisteBonoModel({required this.existe});

  factory ExisteBonoModel.fromJson(Map<String, dynamic> json) {
    return ExisteBonoModel(
      existe: json['existe'],
    );
  }
}

class LoginResponse {
  final int id;
  final String name;
  final String email;
  final String alamat;
  final String username;
  final String no_hp;
  final String agama;
  final String tanggal_lahir;

  LoginResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.alamat,
    required this.username,
    required this.no_hp,
    required this.agama,
    required this.tanggal_lahir,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      alamat: json['alamat'],
      username: json['username'],
      no_hp: json['no_hp'],
      agama: json['agama'],
      tanggal_lahir: json['tanggal_lahir'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'address': alamat,
      'username': username,
      'phoneNumber': no_hp,
      'religion': agama,
      'birthDate': tanggal_lahir,
    };
  }
}

import 'package:flutter/material.dart';
import 'package:mobile/model/loginrespon.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:mobile/class/DatabaseHelper.dart';
import 'package:mobile/View/Profile.dart';
import 'package:mobile/View/edit_profile.dart';

class EditProfile extends StatefulWidget {
  final LoginResponse editProfile;

  const EditProfile({Key? key, required this.editProfile}) : super(key: key);

  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _alamatController;
  late TextEditingController _agamaController;
  late TextEditingController _tanggalLahirController;
  late TextEditingController _noHpController;



  @override
  void initState() {
    super.initState();

    // Mengisi controller dengan data dari currentUser
    _usernameController =
        TextEditingController(text: widget.editProfile.username);
    _emailController = TextEditingController(text: widget.editProfile.email);
    _alamatController = TextEditingController(text: widget.editProfile.alamat);
    _agamaController = TextEditingController(text: widget.editProfile.agama);
    _tanggalLahirController =
        TextEditingController(text: widget.editProfile.tanggal_lahir);
    _noHpController = TextEditingController(text: widget.editProfile.no_hp);
  }

  @override
  void dispose() {
    // Membersihkan controller ketika widget dihapus
    _usernameController.dispose();
    _emailController.dispose();
    _alamatController.dispose();
    _agamaController.dispose();
    _tanggalLahirController.dispose();
    _noHpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _alamatController,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _agamaController,
              decoration: InputDecoration(labelText: 'Agama'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _tanggalLahirController,
              decoration: InputDecoration(labelText: 'Tanggal Lahir'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _noHpController,
              decoration: InputDecoration(labelText: 'No Hp'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                // Mengonversi nilai nomor HP ke tipe data int
                int? noHp = int.tryParse(_noHpController.text);
                if (noHp == null) {
                  // Handle jika konversi gagal, misalnya menampilkan pesan kesalahan
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Nomor HP tidak valid'),
                    ),
                  );
                  return;
                }

                // Membuat objek updatedUser dengan data yang ingin diperbarui
                LoginResponse updatedUser = LoginResponse(
                  username: _usernameController.text,
                  email: _emailController.text,
                  alamat: _alamatController.text,
                  agama: widget.editProfile.agama,
                  tanggal_lahir: widget.editProfile.tanggal_lahir,
                  no_hp: widget.editProfile.no_hp,
                  name: widget.editProfile.name,
                  id: widget.editProfile.id!,
                );

                // Panggil method updateUser dari DB Helper SQFlite dengan objek updatedUser sebagai argumen
                await DatabaseHelper().updateUserByUsername(updatedUser);

                // Tampilkan pesan berhasil
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Profil berhasil diperbarui'),
                  ),
                );
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}

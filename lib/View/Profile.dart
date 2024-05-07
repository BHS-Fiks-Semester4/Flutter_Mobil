import 'package:flutter/material.dart';
import 'package:mobile/view/edit_profile.dart';
import 'package:mobile/model/loginrespon.dart';


class Profile extends StatefulWidget {
  final LoginResponse profile;
  const Profile({Key? key, required this.profile}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(
                          'assets/poto.png'), // Ganti dengan path gambar Anda
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.profile.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 430,
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TextField(
                  controller:
                      TextEditingController(text: '${widget.profile.username}'),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    prefix: Icon(Icons.person),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: 430,
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TextField(
                  controller:
                      TextEditingController(text: '${widget.profile.alamat}'),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Alamat',
                    prefix: Icon(Icons.location_city),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 430,
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TextField(
                  controller: TextEditingController(
                      text: '${widget.profile.tanggal_lahir}'),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tanggal Lahir',
                    prefix: Icon(Icons.person),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 430,
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TextField(
                  controller:
                      TextEditingController(text: '${widget.profile.agama}'),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Agama',
                    prefix: Icon(Icons.person),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 430,
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TextField(
                  controller:
                      TextEditingController(text: '${widget.profile.email}'),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    prefix: Icon(Icons.person),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Container(
                width: 430,
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TextField(
                  controller:
                      TextEditingController(text: '${widget.profile.no_hp}'),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'No Hp',
                    prefix: Icon(Icons.person),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          EditProfile(editProfile: widget.profile),
                    ),
                  );
                },
                child: Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

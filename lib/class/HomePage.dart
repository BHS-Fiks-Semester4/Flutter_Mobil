import 'package:flutter/material.dart';
import 'package:mobile/Model/LoginRespon.dart';
import 'package:mobile/class/HomePage.dart';
import 'package:mobile/class/Login.dart';
import 'package:mobile/class/Register.dart';
import 'package:mobile/class/LupaPassword.dart';
import 'package:mobile/View/Beranda.dart';
import 'package:mobile/View/Profile.dart';
import 'package:mobile/View/Report.dart';
import 'package:mobile/View/Transaksi.dart';
import 'package:mobile/View/Report.dart';
import 'package:mobile/Model/LoginRespon.dart';

class HomePage extends StatefulWidget {
  final LoginResponse home;

  const HomePage({Key? key, required this.home}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _getBody(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.shade300,
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage, color: Colors.black),
            label: 'Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, color: Colors.black),
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart, color: Colors.black),
            label: 'Laporan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  Widget _getBody() {
    switch (_currentIndex) {
      case 0:
        return Bernda();
      case 1:
        return Management();
      case 2:
        return Transaction();
      case 3:
        return Report();
      case 4:
        return Profile(user: widget.home);
      default:
        return Home();
    }
  }
}

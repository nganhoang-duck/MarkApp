import 'package:flutter/material.dart';
import 'package:kiem_tra/widgets/components/drawer.dart';
import 'package:kiem_tra/widgets/pages/quanly_sinhvien.dart';
import 'package:kiem_tra/widgets/pages/quanly_lop.dart';
import 'package:kiem_tra/widgets/pages/quanly_monhoc.dart';
import 'package:kiem_tra/widgets/pages/quanly_diem.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF405189),
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Image.asset('images/logo.jpg'),
          SizedBox(height: 20),
          Text(
            'Hệ thống quản lý sinh viên',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF405189),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: buildCard(
                  'images/sinhvien.jpg',
                  'Quản lý Sinh viên',
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuanLySinhVienPage(),
                      ),
                    );
                  },
                ),
              ),Expanded(
                child: buildCard(
                  'images/lop.jpg',
                  'Quản lý Lớp',
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuanLyLopPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: buildCard(
                  'images/monhoc.jpg',
                  'Quản lý Môn học',
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuanLyMonHocPage(),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: buildCard(
                  'images/diem.jpg',
                  'Quản lý Điểm',
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuanLyDiemPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCard(String imagePath, String text, VoidCallback onPressed) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onPressed, // Xử lý sự kiện nhấn vào ảnh
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                imagePath,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 15),
              Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF405189),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
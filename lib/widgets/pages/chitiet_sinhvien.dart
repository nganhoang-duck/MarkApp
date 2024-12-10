import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kiem_tra/models/sinhvien.dart';
import 'package:kiem_tra/widgets/pages/sua_sinhvien.dart';
import 'package:kiem_tra/models/data/sinhvien_data.dart';
import 'package:kiem_tra/models/data/lop_data.dart';
import 'package:kiem_tra/widgets/pages/homepage.dart';

class ChiTietSinhVien extends StatelessWidget {
  final SinhVien sinhVien;

  ChiTietSinhVien({required this.sinhVien});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết sinh viên'),
        backgroundColor: Color(0xFF405189),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Họ và tên: ${sinhVien.hoVaTen}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Ngày sinh: ${DateFormat('dd-MM-yyyy').format(sinhVien.ngaySinh)}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Quê quán: ${sinhVien.queQuan}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'CCCD: ${sinhVien.cccd}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Bảng điểm:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.edit, size: 40,),
              onPressed: () {
                navigateToSuaSinhVien(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete, size: 40,),
              onPressed: () {
                deleteSinhVien(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void navigateToSuaSinhVien(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SuaSinhVien(sinhVien: sinhVien, updateLopHocs: updateLopHocs,),
      ),
    );
  }

  void deleteSinhVien(BuildContext context) {
    sinhViens.remove(sinhVien);
    Navigator.pop(context);
  }

  void updateLopHocs() {
    lopHocs = initializeSinhViensInLops(lopHocs);
  }
}
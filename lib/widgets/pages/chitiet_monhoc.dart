import 'package:flutter/material.dart';
import 'package:kiem_tra/models/monhoc.dart';
import 'package:kiem_tra/widgets/pages/homepage.dart';

class ChiTietMonHoc extends StatelessWidget {
  final MonHoc monHoc;

  ChiTietMonHoc({required this.monHoc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết môn học'),
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
                'Mã môn học: ${monHoc.maMonHoc}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Tên môn học: ${monHoc.tenMonHoc}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Số tín chỉ: ${monHoc.soTinChi}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
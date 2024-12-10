import 'package:flutter/material.dart';
import 'package:kiem_tra/models/lop.dart';
import 'package:kiem_tra/widgets/pages/chitiet_sinhvien.dart';
import 'package:kiem_tra/widgets/pages/homepage.dart';

class ChiTietLop extends StatelessWidget {
  final Lop lop;

  ChiTietLop({required this.lop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết lớp học'),
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
        child: DataTable(
          columns: [
            DataColumn(label: Text('STT')),
            DataColumn(label: Text('Mã sinh viên')),
            DataColumn(label: Text('Họ và tên')),
            DataColumn(label: Text('Quê quán')),
          ],
          columnSpacing: 15,
          headingRowHeight: 50,
          rows: lop.sinhViens
              .map(
                (sinhVien) => DataRow(
              cells: [
                DataCell(FittedBox(
                  fit: BoxFit.fitWidth,
                  child:
                  Text((lop.sinhViens.indexOf(sinhVien) + 1).toString()))
                ),
                DataCell(FittedBox(
                  fit: BoxFit.fitWidth,
                  child:
                  Text((sinhVien.maSinhVien.toString())))
                ),
                DataCell(FittedBox(
                  fit: BoxFit.fitWidth,
                  child: GestureDetector(
                    child: Text(sinhVien.hoVaTen),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChiTietSinhVien(sinhVien: sinhVien),
                        ),
                      );
                    },
                  )),
                ),
                DataCell(FittedBox(
                  fit: BoxFit.fitWidth,
                  child:
                  Text((sinhVien.queQuan)))
                ),
              ],
            ),
          ).toList(),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:kiem_tra/models/data/lop_data.dart';
import 'package:kiem_tra/widgets/components/drawer.dart';
import 'package:kiem_tra/widgets/pages/chitiet_lop.dart';
import 'package:kiem_tra/widgets/pages/homepage.dart';

class QuanLyLopPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản lý lớp'),
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
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: DataTable(
          columns: [
            DataColumn(label: Text('STT')),
            DataColumn(label: Text('Tên lớp')),
            DataColumn(label: Text('Sĩ số')),
            DataColumn(label: Text('Khóa')),
          ],
          columnSpacing: 15,
          headingRowHeight: 50,
          rows: lops
              .map(
                (lop) => DataRow(
              cells: [
                DataCell(FittedBox(
                    fit: BoxFit.fitWidth,
                    child:
                    Text((lops.indexOf(lop) + 1).toString()))
                ),
                DataCell(FittedBox(
                    child: GestureDetector(
                      child: Text(lop.tenLop),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChiTietLop(lop: lop),
                          ),
                        );
                      },
                    )),
                ),
                DataCell(FittedBox(
                    fit: BoxFit.fitWidth,
                    child:
                    Text((lop.sinhViens.length.toString())))
                ),
                DataCell(FittedBox(
                    fit: BoxFit.fitWidth,
                    child:
                    Text((lop.khoaTuyenSinh.toString())))
                ),
              ],
            ),
          ).toList(),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:kiem_tra/models/monhoc.dart';
import 'package:kiem_tra/widgets/pages/quanly_monhoc.dart' as qlmonhoc;
import 'package:kiem_tra/widgets/components/drawer.dart';
import 'package:kiem_tra/widgets/pages/chitiet_monhoc.dart';
import 'package:kiem_tra/widgets/pages/homepage.dart';
import 'package:kiem_tra/models/data/monhoc_data.dart';


class QuanLyMonHocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản lý môn học'),
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
            DataColumn(label: Text('Mã môn học')),
            DataColumn(label: Text('Tên môn học')),
            DataColumn(label: Text('Số tín chỉ')),
          ],
          columnSpacing: 15,
          headingRowHeight: 50,
          rows: monHocs
              .map(
                (monHoc) => DataRow(
              cells: [
                DataCell(FittedBox(
                  fit: BoxFit.fitWidth,
                  child:
                  Text((monHocs.indexOf(monHoc) + 1).toString()))
                ),
                DataCell(FittedBox(
                  fit: BoxFit.fitWidth,
                  child:
                  Text((monHoc.maMonHoc.toString())))
                ),
                DataCell(FittedBox(
                  fit: BoxFit.fitWidth,
                  child: GestureDetector(
                    child: Text(monHoc.tenMonHoc),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChiTietMonHoc(monHoc: monHoc,),
                        ),
                      );
                    },
                  ))
                ),
                DataCell(FittedBox(
                  fit: BoxFit.fitWidth,
                  child:
                  Text((monHoc.soTinChi.toString())))
                ),
              ],
            ),
          ).toList(),
        ),
      ),
    );
  }
}

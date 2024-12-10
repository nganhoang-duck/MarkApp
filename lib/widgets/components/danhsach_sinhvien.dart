import 'package:flutter/material.dart';
import 'package:kiem_tra/models/sinhvien.dart';
import 'package:kiem_tra/widgets/pages/chitiet_sinhvien.dart';

class DanhSachSinhVien extends StatelessWidget {
  final List<SinhVien> sinhViens;

  DanhSachSinhVien(this.sinhViens);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: SingleChildScrollView(
        child: DataTable(
          columns: [
            DataColumn(label: Text('STT')),
            DataColumn(label: Text('Mã sinh viên')),
            DataColumn(label: Text('Họ và tên')),
            DataColumn(label: Text('Lớp')),
          ],
          columnSpacing: 15,
          headingRowHeight: 50,
          rows: sinhViens
              .map(
                (sinhVien) => DataRow(
              cells: [
                DataCell(FittedBox(
                  fit: BoxFit.fitWidth,
                  child:
                  Text((sinhViens.indexOf(sinhVien) + 1).toString()))
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
                  Text('CNTT ' + sinhVien.maLop.toString())
                )
                ),
              ],
            ),
          ).toList(),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:kiem_tra/models/lop.dart';
import 'package:kiem_tra/models/monhoc.dart';
import 'package:kiem_tra/models/sinhvien.dart';
import 'package:kiem_tra/models/diem.dart';
import 'package:kiem_tra/widgets/pages/homepage.dart';

class BangDiem extends StatefulWidget {
  final Lop lop;
  final MonHoc monHoc;

  BangDiem({required this.lop, required this.monHoc});

  @override
  _BangDiemState createState() => _BangDiemState();
}

class _BangDiemState extends State<BangDiem> {
  List<SinhVien> sinhViens = [];

  @override
  void initState() {
    super.initState();
    sinhViens = widget.lop.sinhViens;
  }

  void _showUpdateDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Cập Nhật Điểm'),
          content: Text('Đã cập nhật điểm thành công.'),
          actions: [
            TextButton(
              child: Text('Đóng'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bảng Điểm môn ' + widget.monHoc.tenMonHoc),
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
            DataColumn(label: Text('MSV')),
            DataColumn(label: Text('Họ tên')),
            DataColumn(label: Text('KT')),
            DataColumn(label: Text('T')),
            DataColumn(label: Text('TB')),
          ],
          columnSpacing: 15,
          headingRowHeight: 50,
          rows: sinhViens.map((sinhVien) {
            Diem diem = sinhVien.diems.firstWhere(
                  (diem) => diem.maMonHoc == widget.monHoc.maMonHoc,
              orElse: () => Diem(
                maSinhVien: sinhVien.maSinhVien,
                maMonHoc: widget.monHoc.maMonHoc,
                diemKiemTra: 0,
                diemThi: 0,
                diemTrungBinh: 0,
              ),
            );

            return DataRow(
              cells: [
                DataCell(Text(sinhVien.maSinhVien.toString())),
                DataCell(Text(sinhVien.hoVaTen)),
                DataCell(
                  TextFormField(
                    initialValue: diem.diemKiemTra.toString(),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        diem.diemKiemTra = double.tryParse(value) ?? 0;
                        diem.diemTrungBinh = (diem.diemKiemTra + diem.diemThi) / 2;
                      });
                    },
                  ),
                ),
                DataCell(
                  TextFormField(
                    initialValue: diem.diemThi.toString(),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        diem.diemThi = double.tryParse(value) ?? 0;
                        diem.diemTrungBinh = (diem.diemKiemTra + diem.diemThi) / 2;
                      });
                    },
                  ),
                ),
                DataCell(
                  Text(diem.diemTrungBinh.toStringAsFixed(2)),
                ),
              ],
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showUpdateDialog();
          });
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
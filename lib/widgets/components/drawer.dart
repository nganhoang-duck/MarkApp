import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(height: 50),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Trang chủ"),
            onTap: () => Navigator.of(context).popAndPushNamed("/"),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text("Quản lý lớp"),
            onTap: () => Navigator.of(context).popAndPushNamed("/quanly_lop"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Quản lý sinh viên"),
            onTap: () => Navigator.of(context).popAndPushNamed("/quanly_sinhvien"),
          ),
          ListTile(
            leading: Icon(Icons.menu_book),
            title: Text("Quản lý môn học"),
            onTap: () => Navigator.of(context).popAndPushNamed("/quanly_monhoc"),
          ),
          ListTile(
            leading: Icon(Icons.check),
            title: Text("Quản lý điểm"),
            onTap: () => Navigator.of(context).popAndPushNamed("/quanly_diem"),
          ),
        ],
      ),
    );
  }
}

import 'dart:io'; // Thêm thư viện để nhập/xuất
import '../models//sach.dart'; // Giả sử class Sach nằm trong file Sach.dart

void main() {
  List<Sach> danhSachSach = [];

  while (true) {
    print('--- Quản lý Sách ---');

    // Nhập thông tin sách từ người dùng
    Sach sach = nhapThongTinSach();
    // Thêm sách vào danh sách
    danhSachSach.add(sach);

    // Hiển thị thông tin sách
    sach.hienThiThongTin();

    // Hỏi người dùng xem có muốn tiếp tục nhập sách không
    stdout.write('Bạn có muốn nhập thêm sách? (y/n): ');
    String? luaChon = stdin.readLineSync();
    if (luaChon?.toLowerCase() != 'y') {
      break; // Thoát khỏi vòng lặp nếu người dùng không muốn nhập thêm
    }
  }

  // Hiển thị tất cả sách trong danh sách
  print('\n--- Danh Sách Sách ---');
  for (var sach in danhSachSach) {
    sach.hienThiThongTin();
  }
}

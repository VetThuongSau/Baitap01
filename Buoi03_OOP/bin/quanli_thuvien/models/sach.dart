import 'dart:io'; // Thêm thư viện để nhập/xuất

class Sach {
  // Thuộc tính
  String _maSach;
  String _tenSach;
  String _tacGia;
  bool _trangThaiMuon; // true: đã mượn, false: chưa mượn

  // Constructor
  Sach(this._maSach, this._tenSach, this._tacGia, this._trangThaiMuon) {
    // Kiểm tra điều kiện trong constructor
    if (_maSach.isEmpty) throw ArgumentError('Mã sách không được rỗng');
    if (_tenSach.isEmpty) throw ArgumentError('Tên sách không được rỗng');
    if (_tacGia.isEmpty) throw ArgumentError('Tác giả không được rỗng');
  }

  // Getter và Setter với điều kiện kiểm tra
  String get maSach => _maSach;
  set maSach(String value) {
    if (value.isEmpty) throw ArgumentError('Mã sách không được rỗng');
    _maSach = value;
  }

  String get tenSach => _tenSach;
  set tenSach(String value) {
    if (value.isEmpty) throw ArgumentError('Tên sách không được rỗng');
    _tenSach = value;
  }

  String get tacGia => _tacGia;
  set tacGia(String value) {
    if (value.isEmpty) throw ArgumentError('Tác giả không được rỗng');
    _tacGia = value;
  }

  bool get trangThaiMuon => _trangThaiMuon;
  set trangThaiMuon(bool value) {
    _trangThaiMuon = value;
  }

  // Phương thức hiển thị thông tin sách
  void hienThiThongTin() {
    print('\n--- Thông Tin Sách ---');
    print('Mã sách: $_maSach');
    print('Tên sách: $_tenSach');
    print('Tác giả: $_tacGia');
    print('Trạng thái: ${_trangThaiMuon ? 'Đã mượn' : 'Chưa mượn'}');
  }
}

// Hàm nhập thông tin sách từ người dùng
Sach nhapThongTinSach() {
  stdout.write('Nhập mã sách: ');
  String maSach = stdin.readLineSync() ?? '';

  stdout.write('Nhập tên sách: ');
  String tenSach = stdin.readLineSync() ?? '';

  stdout.write('Nhập tác giả: ');
  String tacGia = stdin.readLineSync() ?? '';

  stdout.write('Trạng thái mượn (true: đã mượn, false: chưa mượn): ');
  bool trangThaiMuon = (stdin.readLineSync()?.toLowerCase() == 'true');

  return Sach(maSach, tenSach, tacGia, trangThaiMuon);
}


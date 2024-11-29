class NhanVien {
  String _maNV;
  String _hoTen;
  double _luongCanBan;

  // Constructor
  NhanVien(this._maNV, this._hoTen, this._luongCanBan);

  // Getter
  String get maNV => _maNV;
  String get hoTen => _hoTen;
  double get luongCanBan => _luongCanBan;

  // Setter
  set maNV(String maNV) {
    _maNV = (maNV.isNotEmpty) ? maNV : _maNV;
  }

  set hoTen(String hoTen) {
    _hoTen = (hoTen.isNotEmpty) ? hoTen : _hoTen;
  }

  set luongCanBan(double luongCanBan) {
    if (luongCanBan > 0) {
      _luongCanBan = luongCanBan;
    }
  }

  // Phương thức tính lương
  double tinhLuong() {
    return _luongCanBan;
  }

  // Phương thức hiển thị thông tin
  void hienThiThongTin() {
    print('Mã nhân viên: $_maNV');
    print('Họ và tên: $_hoTen');
    print('Lương cơ bản: $_luongCanBan');
    print('Tổng lương: ${tinhLuong()}');
  }
}

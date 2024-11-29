class DienThoai {
  // Thuộc tính private
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTonKho;
  bool _trangThai;

  // Constructor đầy đủ tham số
  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat,
      this._giaNhap, this._giaBan, this._soLuongTonKho, this._trangThai) {
    // Validation trong constructor
    if (!_maDienThoai.startsWith('DT-')) {
      throw Exception('Mã điện thoại không hợp lệ');
    }
    if (_giaNhap <= 0 || _giaBan <= _giaNhap) {
      throw Exception('Giá nhập hoặc giá bán không hợp lệ');
    }
    if (_soLuongTonKho < 0) {
      throw Exception('Số lượng tồn kho phải lớn hơn hoặc bằng 0');
    }
  }

  // Định nghĩa các getter
  String get maDienThoai => _maDienThoai;
  String get tenDienThoai => _tenDienThoai;
  String get hangSanXuat => _hangSanXuat;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get soLuongTonKho => _soLuongTonKho;
  bool get trangThai => _trangThai;

  // Định nghĩa các setter với validation
  set maDienThoai(String value) {
    if (value.isEmpty || !value.startsWith('DT-')) {
      throw Exception('Mã điện thoại không hợp lệ');
    }
    _maDienThoai = value;
  }

  set tenDienThoai(String value) {
    if (value.isEmpty) {
      throw Exception('Tên điện thoại không được để trống');
    }
    _tenDienThoai = value;
  }

  set hangSanXuat(String value) {
    if (value.isEmpty) {
      throw Exception('Hãng sản xuất không được để trống');
    }
    _hangSanXuat = value;
  }

  set giaNhap(double value) {
    if (value <= 0) {
      throw Exception('Giá nhập phải lớn hơn 0');
    }
    _giaNhap = value;
  }

  set giaBan(double value) {
    if (value <= _giaNhap) {
      throw Exception('Giá bán phải lớn hơn giá nhập');
    }
    _giaBan = value;
  }

  set soLuongTonKho(int value) {
    if (value < 0) {
      throw Exception('Số lượng tồn kho không được nhỏ hơn 0');
    }
    _soLuongTonKho = value;
  }

  set trangThai(bool value) {
    _trangThai = value;
  }

  // Phương thức hiển thị thông tin
  void hienThiThongTin() {
    print('Mã: $maDienThoai, Tên: $tenDienThoai, Hãng: $hangSanXuat, '
        'Giá nhập: $giaNhap, Giá bán: $giaBan, Tồn kho: $soLuongTonKho, '
        'Trạng thái: ${trangThai ? "Còn kinh doanh" : "Ngừng kinh doanh"}');
  }
}

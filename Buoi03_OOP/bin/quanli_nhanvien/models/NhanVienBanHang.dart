import 'NhanVien.dart';

class NhanVienBanHang extends NhanVien {
  double _doanhSo;
  double _hoaHong;

  // Constructor
  NhanVienBanHang(String maNV, String hoTen, double luongCanBan, this._doanhSo,
      this._hoaHong)
      : super(maNV, hoTen, luongCanBan);

  // Getter
  double get doanhSo => _doanhSo;
  double get hoaHong => _hoaHong;

  // Setter
  set doanhSo(double doanhSo) {
    _doanhSo = (doanhSo > 0) ? doanhSo : _doanhSo;
  }

  set hoaHong(double hoaHong) {
    _hoaHong = (hoaHong > 0) ? hoaHong : _hoaHong;
  }

  @override
  void hienThiThongTin() {
    super.hienThiThongTin();
    print('Doanh số: $_doanhSo');
    print('Hoa hồng: $_hoaHong');
  }
}

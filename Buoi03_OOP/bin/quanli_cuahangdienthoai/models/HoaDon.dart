import '../models/DienThoai.dart';

class HoaDon {
  // Thuộc tính private
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoai;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  // Constructor đầy đủ tham số
  HoaDon(this._maHoaDon, this._ngayBan, this._dienThoai, this._soLuongMua,
      this._giaBanThucTe, this._tenKhachHang, this._soDienThoaiKhach) {
    // Validation
    if (!_maHoaDon.startsWith('HD-')) {
      throw Exception('Mã hóa đơn không hợp lệ');
    }
    if (_soLuongMua <= 0 || _soLuongMua > _dienThoai.soLuongTonKho) {
      throw Exception('Số lượng mua không hợp lệ');
    }
  }

  // Tính tổng tiền
  double tinhTongTien() => _soLuongMua * _giaBanThucTe;

  // Tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() =>
      _soLuongMua *
      (_giaBanThucTe - _dienThoai.giaNhap); // Sử dụng getter giaNhap

  // Hiển thị thông tin hóa đơn
  void hienThiThongTinHoaDon() {
    print(
        'Mã hóa đơn: $_maHoaDon, Ngày bán: $_ngayBan, Khách hàng: $_tenKhachHang, '
        'Điện thoại: ${_dienThoai.tenDienThoai}, Số lượng: $_soLuongMua, Tổng tiền: ${tinhTongTien()}');
  }
}

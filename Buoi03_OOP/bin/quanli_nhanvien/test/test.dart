import '../models/NhanVien.dart';
import '../models/NhanVienBanHang.dart';

void main() {
  //Test nhân viên thường
  NhanVien nv = NhanVien('1234', 'Nguyễn Văn A', 50000000);
  print('Thông tin nhân viên: ');
  nv.hienThiThongTin();

  //Test nhân viên bán hàng
  NhanVienBanHang nv_BH =
      NhanVienBanHang('2222', 'Nguyễn Văn B', 50000000, 1000000000, 0.02);
  print('\nThông tin nhân viên bán hàng: ');
  nv_BH.hienThiThongTin();

  nv_BH.doanhSo = 100000000;
  print('\nSau khi tăng doanh số: ');
  nv_BH.hienThiThongTin();
}

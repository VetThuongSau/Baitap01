import '../models/CuaHang.dart';
import '../models/DienThoai.dart';
import '../models/HoaDon.dart';
import 'dart:io';

void main() {
  // Tạo cửa hàng
  CuaHang cuaHang = CuaHang('TechShop', '123 Đường ABC');

  while (true) {
    print("\n--- Quản lý cửa hàng ---");
    print("1. Thêm điện thoại mới");
    print("2. Cập nhật thông tin điện thoại");
    print("3. Hiển thị danh sách điện thoại");
    print("4. Tạo hóa đơn mới");
    print("5. Thống kê báo cáo");
    print("6. Thoát");
    stdout.write("Chọn chức năng: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        themDienThoai(cuaHang);
        break;
      case '2':
        capNhatThongTinDienThoai(cuaHang);
        break;
      case '3':
        cuaHang.hienThiDanhSachDienThoai();
        break;
      case '4':
        taoHoaDon(cuaHang);
        break;
      case '5':
        thongKeBaoCao(cuaHang);
        break;
      case '6':
        print("Thoát chương trình.");
        return;
      default:
        print("Lựa chọn không hợp lệ. Vui lòng thử lại.");
    }
  }
}

void themDienThoai(CuaHang cuaHang) {
  stdout.write("Nhập mã điện thoại: ");
  String? maDienThoai = stdin.readLineSync();
  stdout.write("Nhập tên điện thoại: ");
  String? tenDienThoai = stdin.readLineSync();
  stdout.write("Nhập hãng sản xuất: ");
  String? hangSanXuat = stdin.readLineSync();
  stdout.write("Nhập giá nhập: ");
  double giaNhap = double.parse(stdin.readLineSync() ?? "0");
  stdout.write("Nhập giá bán: ");
  double giaBan = double.parse(stdin.readLineSync() ?? "0");
  stdout.write("Nhập số lượng tồn kho: ");
  int soLuongTonKho = int.parse(stdin.readLineSync() ?? "0");
  stdout.write("Điện thoại còn kinh doanh? (true/false): ");
  bool trangThai = stdin.readLineSync()?.toLowerCase() == 'true';

  try {
    DienThoai dt = DienThoai(maDienThoai!, tenDienThoai!, hangSanXuat!, giaNhap,
        giaBan, soLuongTonKho, trangThai);
    cuaHang.themDienThoai(dt);
    print("Đã thêm điện thoại thành công.");
  } catch (e) {
    print("Lỗi: ${e.toString()}");
  }
}

void capNhatThongTinDienThoai(CuaHang cuaHang) {
  stdout.write("Nhập mã điện thoại cần cập nhật: ");
  String? maDienThoai = stdin.readLineSync();

  try {
    var dt = cuaHang.danhSachDienThoai.firstWhere(
      (d) => d.maDienThoai == maDienThoai,
      orElse: () {
        throw Exception("Không tìm thấy điện thoại với mã $maDienThoai");
      },
    );

    print("Cập nhật thông tin (để trống nếu không muốn thay đổi):");
    stdout.write("Tên mới: ");
    String? tenMoi = stdin.readLineSync();
    stdout.write("Hãng mới: ");
    String? hangMoi = stdin.readLineSync();
    stdout.write("Giá nhập mới: ");
    String? giaNhapMoi = stdin.readLineSync();
    stdout.write("Giá bán mới: ");
    String? giaBanMoi = stdin.readLineSync();
    stdout.write("Số lượng tồn kho mới: ");
    String? soLuongMoi = stdin.readLineSync();
    stdout.write("Trạng thái kinh doanh mới (true/false): ");
    String? trangThaiMoi = stdin.readLineSync();

    if (tenMoi != null && tenMoi.isNotEmpty) dt.tenDienThoai = tenMoi;
    if (hangMoi != null && hangMoi.isNotEmpty) dt.hangSanXuat = hangMoi;
    if (giaNhapMoi != null && giaNhapMoi.isNotEmpty)
      dt.giaNhap = double.parse(giaNhapMoi);
    if (giaBanMoi != null && giaBanMoi.isNotEmpty)
      dt.giaBan = double.parse(giaBanMoi);
    if (soLuongMoi != null && soLuongMoi.isNotEmpty)
      dt.soLuongTonKho = int.parse(soLuongMoi);
    if (trangThaiMoi != null && trangThaiMoi.isNotEmpty)
      dt.trangThai = trangThaiMoi.toLowerCase() == 'true';

    print("Cập nhật thành công.");
  } catch (e) {
    print("Lỗi: ${e.toString()}");
  }
}

void taoHoaDon(CuaHang cuaHang) {
  stdout.write("Nhập mã điện thoại bán: ");
  String? maDienThoai = stdin.readLineSync();

  try {
    var dt = cuaHang.danhSachDienThoai.firstWhere(
      (d) => d.maDienThoai == maDienThoai,
      orElse: () {
        throw Exception("Không tìm thấy điện thoại với mã $maDienThoai");
      },
    );

    stdout.write("Nhập số lượng mua: ");
    int soLuong = int.parse(stdin.readLineSync() ?? "0");
    if (soLuong <= 0 || soLuong > dt.soLuongTonKho) {
      print("Số lượng mua không hợp lệ.");
      return;
    }

    stdout.write("Nhập tên khách hàng: ");
    String? tenKhachHang = stdin.readLineSync();
    stdout.write("Nhập số điện thoại khách: ");
    String? soDienThoaiKhach = stdin.readLineSync();

    HoaDon hd = HoaDon(
      'HD-${cuaHang.danhSachHoaDon.length + 1}',
      DateTime.now(),
      dt,
      soLuong,
      dt.giaBan,
      tenKhachHang!,
      soDienThoaiKhach!,
    );
    cuaHang.danhSachHoaDon.add(hd);
    dt.soLuongTonKho -= soLuong;

    print("Hóa đơn tạo thành công.");
    hd.hienThiThongTinHoaDon();
  } catch (e) {
    print("Lỗi: ${e.toString()}");
  }
}

void thongKeBaoCao(CuaHang cuaHang) {
  print("\n--- Thống kê báo cáo ---");
  print("1. Doanh thu theo thời gian");
  print("2. Lợi nhuận theo thời gian");
  print("3. Top bán chạy");
  print("4. Báo cáo tồn kho");
  stdout.write("Chọn loại báo cáo: ");
  String? choice = stdin.readLineSync();

  switch (choice) {
    case '1':
      double doanhThu = cuaHang.danhSachHoaDon
          .fold(0, (total, hd) => total + hd.tinhTongTien());
      print("Tổng doanh thu: $doanhThu");
      break;
    case '2':
      double loiNhuan = cuaHang.danhSachHoaDon
          .fold(0, (total, hd) => total + hd.tinhLoiNhuanThucTe());
      print("Tổng lợi nhuận: $loiNhuan");
      break;
    case '3':
      var topBanChay = cuaHang.danhSachDienThoai
          .where((dt) => dt.soLuongTonKho < 50) // VD: tồn ít là bán chạy
          .toList();
      print("Top bán chạy:");
      for (var dt in topBanChay) {
        dt.hienThiThongTin();
      }
      break;
    case '4':
      print("Báo cáo tồn kho:");
      for (var dt in cuaHang.danhSachDienThoai) {
        print("${dt.tenDienThoai}: ${dt.soLuongTonKho} sản phẩm tồn.");
      }
      break;
    default:
      print("Lựa chọn không hợp lệ.");
  }
}

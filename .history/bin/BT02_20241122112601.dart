import 'dart:io';

void main() {
  // Khai bao bien co ban
  var ten = 'Tung'; // tu suy luan
  int tuoi = 25; // khai bao ro rang

  // Su dung null safety
  String? tenNullable;
  tenNullable = null;

  // Su dung bien late
  late String moTa;
  moTa = 'Lap trinh Dart';

  // Su dung final va const
  final String quocGia = 'VietNam';
  const int nam = 2024;

  // In gia tri bien
  print('Ten: $ten');
  print('Tuoi: $tuoi');
  print('Mo ta: $moTa');
  print('Quoc Gia: $quocGia');
  print('Nam: $nam');

  // Kiem tra bien nullable
  int? soLuong1 = 5;
  assert(soLuong1 == null);

  // Kiem tra bien nullable
  int? soLuong;
  assert(soLuong == null);
  print(soLuong);
}

import 'dart:io';

void main() {
  // Yêu cầu người dùng nhập một số nguyên
  stdout.write("Nhập một số nguyên (n ≥ 1): ");
  int n = int.parse(stdin
      .readLineSync()!); // Đọc dữ liệu từ bàn phím và chuyển thành số nguyên

  // Kiểm tra điều kiện n ≥ 1
  if (n < 1) {
    print("Vui lòng nhập một số nguyên lớn hơn hoặc bằng 1.");
  } else {
    // Tính tổng các ước số
    int sum = sumOfDivisors(n);
    print("Tổng các ước số của $n là: $sum");
  }
}

// Hàm tính tổng các ước số của một số nguyên
int sumOfDivisors(int number) {
  int sum = 0;
  for (int i = 1; i <= number; i++) {
    if (number % i == 0) {
      // Kiểm tra i có phải là ước số của number không
      sum += i;
    }
  }
  return sum;
}

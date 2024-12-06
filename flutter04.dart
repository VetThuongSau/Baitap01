import 'package:flutter/material.dart';

class BMICalculator extends StatelessWidget {
  BMICalculator({super.key});

  // Tạo TextEditingController cho cân nặng và chiều cao
  static final TextEditingController _weightController = TextEditingController();
  static final TextEditingController _heightController = TextEditingController();
  static String _bmiResult = '';
  static String _healthStatus = '';

  // Hàm tính BMI
  void _calculateBMI() {
    if (_weightController.text.isNotEmpty && _heightController.text.isNotEmpty) {
      try {
        double weight = double.parse(_weightController.text);
        double height = double.parse(_heightController.text) / 100; // Chuyển cm sang m
        double bmi = weight / (height * height);

        _bmiResult = bmi.toStringAsFixed(2);
        _healthStatus = _getHealthStatus(bmi);
      } catch (e) {
        _bmiResult = 'Lỗi: Vui lòng nhập số hợp lệ';
        _healthStatus = '';
      }
    } else {
      _bmiResult = 'Vui lòng nhập đầy đủ thông tin';
      _healthStatus = '';
    }
  }

  // Hàm lấy trạng thái sức khỏe dựa trên BMI
  String _getHealthStatus(double bmi) {
    if (bmi < 18.5) {
      return 'Thiếu cân';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Bình thường';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Thừa cân';
    } else {
      return 'Béo phì';
    }
  }

  // Hàm xóa dữ liệu
  void _clearAll() {
    _weightController.clear();
    _heightController.clear();
    _bmiResult = '';
    _healthStatus = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tính chỉ số BMI'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('../assets/images/04.jpg',
              width: 150,
              height: 150,
              fit: BoxFit.fitWidth,
            ),

            SizedBox(height: 50),
            // Input cân nặng
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Cân nặng (kg)',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: _clearAll,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Input chiều cao
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Chiều cao (cm)',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: _clearAll,
                ),
              ),
            ),
            SizedBox(height: 30),

            // Nút tính toán
            ElevatedButton(
              onPressed: () {
                _calculateBMI();
                // Đảm bảo UI cập nhật sau khi tính toán
                (context as Element).markNeedsBuild();
              },
              child: Text('Tính BMI'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),

            SizedBox(height: 20),
            // Nút xóa tất cả
            ElevatedButton.icon(
              onPressed: _clearAll,
              icon: Icon(Icons.refresh),
              label: Text('Xóa tất cả'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),

            SizedBox(height: 20),
            SizedBox(height: 20),

            // Hiển thị kết quả BMI
            Text(
              'Chỉ số BMI: $_bmiResult',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Hiển thị trạng thái sức khỏe
            Text(
              'Tình trạng: $_healthStatus',
              style: TextStyle(fontSize: 16, color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}

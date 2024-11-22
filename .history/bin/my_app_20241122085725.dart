import 'package:my_app/my_app.dart' as my_app;

void main(List<String> arguments) {
  Object obj = 'hello';

  if (obj is String) {
    print("Dieu bi ngu");
  }

  if (obj is! int) {
    print("Dieu khong bi ngu");
  }

  String str = obj as String;
  print(str.toUpperCase());
}

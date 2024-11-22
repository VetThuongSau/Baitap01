import 'package:my_app/my_app.dart' as my_app;

void main(List<String> arguments) {
  Object obj = 'hello';

  if (obj is String) {
    print("Object is String");
  }

  if (obj! is String) {
    print("Object is not String");
  }

  String str = obj as String;
  print(str.toUpperCase());
}

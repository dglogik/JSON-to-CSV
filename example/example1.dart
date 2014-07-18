import "package:json2csv/json2csv.dart";

import "dart:io";

void main(List<String> args) {
  var converter = new JSON2CSV();
  var file = new File("example/input.json");
  var data = file.readAsStringSync();
  print(converter.take(data));
}
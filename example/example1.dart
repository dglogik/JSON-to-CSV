import "package:json2csv/json2csv.dart" as JSON2CSV;

import "dart:io";

void main(List<String> args) {
  var file = new File("example/input.json");
  var data = file.readAsStringSync();
  print(JSON2CSV.convert(data));
}
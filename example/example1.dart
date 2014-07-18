import "package:json2csv/json2csv.dart";

void main(List<String> args) {
  var converter = new JSON2CSV();
  var out = converter.take("""
  {
    "keyA": "valueA",
    "keyB": [
      "valueA1",
      "valueA2"
    ]
  }
  """);
  print(out);
}
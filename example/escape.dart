import "package:json2csv/json2csv.dart";

main() {
  var converter = new JSON2CSV();
  var out = converter.take('[ "test,test", "test,test" ]');
  print(out);
}

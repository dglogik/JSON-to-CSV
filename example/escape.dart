import "package:json2csv/json2csv.dart" as JSON2CSV;

main() {
  var out = JSON2CSV.convert('[ "test,test", "test,test" ]');
  print(out);
}

import 'dart:html';

import 'package:json2csv/json2csv.dart' as JSON2CSV;

void main() {
  var json = document.querySelector("#json") as PreElement;
  var csv = document.querySelector("#csv") as PreElement;
  HttpRequest.getString("basic.json").then((data) {
    json.appendText(data);
    var output = JSON2CSV.convert(data).toString();
    output = output.substring(0, output.length - 1);
    csv.appendText(output);
  });
}

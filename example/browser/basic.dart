import 'dart:html';

import 'package:json2csv/json2csv.dart';

void main() {
  var json = document.querySelector("#json") as TextAreaElement;
  var csv = document.querySelector("#csv") as TextAreaElement;
  HttpRequest.getString("basic.json").then((data) {
    json.appendText(data);
    json.rows = data.split("\n").length;
    var output = convert(data).toString();
    output = output.substring(0, output.length - 1);
    csv.appendText(output);
    csv.rows = csv.text.split("\n").length;
  });
}

CSV convert(String json) {
  return new JSON2CSV().take(json);
}
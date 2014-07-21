part of json2csv.csv;

class CSV {
  final List<Row> rows;
  
  CSV() : rows = [];
  
  CSV.from(CSV original) : rows = new List.from(original.rows);
  
  void append(Row row) => rows.add(row);
  
  void add(List<String> row) => append(new Row.fromList(row));
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    for (var row in rows) {
      buffer.writeln(row.toString());
    }
    return buffer.toString();
  }
}

class Row {
  final List<String> values;
  
  Row() : values = [];
  
  Row.from(Row original) : values = new List.from(original.values);
  
  Row.fromList(List<String> list) : values = new List.from(list);
  
  @override
  String toString() => values.map(_escape_value).join(",");
}

String _escape_value(String input) {
  var buffer = new StringBuffer();
  if (input.contains(",") || input.contains("\n") || input.contains("\r\n") || input.contains("\r")) {
    buffer.write('"');
    buffer.write(input);
    buffer.write('"');
  } else {
    buffer.write(input);
  }
  return buffer.toString();
}
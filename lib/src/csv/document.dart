part of json2csv.csv;

class CSV {
  final List<Row> rows;
  
  CSV() : rows = [];
  
  CSV.from(CSV original) : rows = new List.from(original.rows);
  
  void add(Row row) => rows.add(row);
  
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
  
  @override
  String toString() => values.join(",");
}
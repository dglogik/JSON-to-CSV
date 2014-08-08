part of json2csv.csv;

/**
 * A CSV Table
 */
class Table {
  /**
   * Table Rows
   */
  final List<Row> rows;
  
  /**
   * Creates an empty table.
   */
  Table() : rows = [];
  
  /**
   * Creates a Table that contains the same rows from the [original] table.
   */
  Table.from(Table original) : rows = new List.from(original.rows.map((it) {
    return new Row.from(it);
  }));
  
  /**
   * Creates a Table that syncs the rows from the [original] table.
   */
  Table.sync(Table other) : rows = other.rows;
  
  /**
   * Appends to Specified [row] at the end of the table.
   */
  void append(Row row) => rows.add(row);
  
  /**
   * Creates a row from the [values] and append it to thr table.
   */
  void addRow(List<String> values) => append(new Row.fromList(values));
  
  /**
   * Gets the specified column's data by index (starting at 0).
   */
  List<String> getColumn(int column) {
    var list = [];
    for (var row in rows) {
      list.add(list[column]);
    }
    return list;
  }
  
  /**
   * Gets the specified row's data by index (starting at 0).
   */
  Row getRow(int row) {
    return rows[row];
  }
  
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
  /**
   * The Row Values
   */
  final List<String> values;
  
  /**
   * Creates an Empty Row
   */
  Row() : values = [];
  
  /**
   * Creates a [Row] from an existing instance.
   */
  Row.from(Row original) : values = new List.from(original.values);
  
  /**
   * Creates a [Row] that will use the same list as the other row to store the row's values.
   */
  Row.sync(Row other) : values = other.values;
  
  /**
   * Creates a [Row] instance from [list].
   */
  Row.fromList(List<String> list) : values = new List.from(list);
  
  /**
   * Adds a value to [values].
   */
  void addValue(String value) => values.add(value);
  
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
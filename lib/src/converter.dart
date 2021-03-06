part of json2csv;

Table convert(input) {
  var outRows = [];
  var inList = _listFrom(input is String ? JSON.decode(input) : input);
  var firstRow = new Row();
  for (var row in inList) {
    var it = new Row();
    var obj = JSONFlattener.flatten(row);
    for (var key in obj.keys) {
      if (!firstRow.values.contains(key)) {
        firstRow.values.add(key);
      }
    }
    it.values.addAll(obj.values.map((value) => value.toString()));
    outRows.add(it);
  }
  var table = new Table();
  table.append(firstRow);
  outRows.forEach(table.append);
  return table;
}

List<dynamic> _listFrom(input, [key]) {
  if (input is List) {
    return input;
  } else if (key != null) {
    return input[key];
  } else {
    for (var key in input.keys) {
      if (input[key] is List) {
        return input[key];
      }
    }
    
    return [input];
  }
}

class JSONFlattener {
  static Map<String, dynamic> flatten(input) {
    return visit(input);
  }
  
  static Map<String, dynamic> visit(input, [String path]) {
    if (path == null) {
      path = "";
    }
    
    var scalar = input is num || input is String || input is bool || input == null;
    
    if (input is Map) {
      var out = {};
      for (var key in input.keys) {
        var new_stuff = visit(input[key], path + key + "/");
        out.addAll(new_stuff);
      }
      return out;
    } else if (scalar) {
      var out = {};
      // Single Scalar
      if (path == "") {
        path = "value/";
      }
      var endPath = path.substring(0, path.length - 1);
      out[endPath] = input;
      return out;
    } else if (input is List) {
      var out = {};
      for (int i = 0; i < input.length; i++) {
        var new_stuff = visit(input[i], path + i.toString() + "/");
        out.addAll(new_stuff);
      }
      return out;
    } else {
      return {};
    }
  }
}
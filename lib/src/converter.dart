part of json2csv;

class JSON2CSV {
  CSV csv;
  
  JSON2CSV() : csv = new CSV();
  
  CSV take(String json_data) {
    var json = JSON.decode(json_data);
    var flattened = JSONFlattener.flatten(json);
    print(flattened);
    return null;
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
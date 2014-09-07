part of json2csv.mapper;

Map<String, dynamic> _createMap(Object object) {
  var instance = reflect(object);
  var mirror = instance.type;
  
  var variables = mirror.declarations.values.where((it) => it is VariableMirror && !it.isStatic && !it.isPrivate);
  
  var out = {};
  
  variables.forEach((variable) {
    
    if (variable.metadata.any((it) => it is Ignore)) return;
    
    var requestedKeyMirror = variable.metadata.firstWhere((it) => it.reflectee is Key, orElse: () => null);
    
    var name = requestedKeyMirror == null ? MirrorSystem.getName(variable.simpleName) : (requestedKeyMirror.reflectee as Key).value;
    var value = instance.getField(variable.simpleName).reflectee;
    out[name] = map(value);
  });
  
  return out;
}

List<dynamic> _createList(List obj) {
  return obj.map((it) => map(it)).toList();
}

dynamic map(Object object) {
  if (object is List) {
    return _createList(object);
  } else if (_isScalar(object)) {
    return object;
  } else {
    return _createMap(object);
  }
}

bool _isScalar(obj) =>
    obj is String || obj is bool || obj is num;
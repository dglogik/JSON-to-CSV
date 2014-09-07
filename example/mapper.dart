import "package:json2csv/mapper.dart";

class Something {
  @Key("value")
  final String name;
  final List<SomethingElse> other;
  
  Something(this.name, this.other);
}

class SomethingElse {
  final List<String> value;
  
  SomethingElse(this.value);
}

void main() {
  print(map(new Something("Hello World", [new SomethingElse(["Hello", "World"])])));
}
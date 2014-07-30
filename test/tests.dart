import 'package:json2csv/json2csv.dart';

import 'package:unittest/unittest.dart';

void main() {
  group("Converter", () {
    test("Basic JSON", () {
      var input = """
      {
        "people": [
          {
            "name": "Alex",
            "age": 15
          },
          {
            "name": "Sam",
            "age": 17
          }
        ]
      }
      """;
      
      var csv = converter.take(input);
      var rows = csv.rows;
      expect(rows.length, equals(3), reason: "there should be 3 rows");
      expect(rows[0].values.length, equals(2), reason: "there should be 2 columns in the first row");
      expect(rows[1].values.length, equals(2), reason: "there should be 2 columns in the second row");
      expect(rows[2].values.length, equals(2), reason: "there should be 2 columns in the third row");
      expect(rows[1].values[0], equals("Alex"), reason: "first value in row 2 should be 'Alex'");
      expect(rows[1].values[1], equals("15"), reason: "second value in row 2 should be '15'");
      expect(rows[2].values[0], equals("Sam"), reason: "first value in row 3 should be 'Sam'");
      expect(rows[2].values[1], equals("17"), reason: "second value in row 3 should be '17'");
    });
  });
}

JSON2CSV get converter => new JSON2CSV();
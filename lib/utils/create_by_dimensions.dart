import 'package:tik_tak_toe/models/option.dart';

List<List<Option>> createBoardByDimensions(int dimensions) {
  if (dimensions < 3) {
    throw "dimensions needs to be greather than 3";
  }

  List<List<Option>> result = [];
  for (var x = 0; x < dimensions; x++) {
    List<Option> xOptions = [];
    for (var y = 0; y < dimensions; y++) {
      xOptions.add(Option(xPosition: x, yPosition: y));
    }
    result.add(xOptions);
  }
  return result;
}

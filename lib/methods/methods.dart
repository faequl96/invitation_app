String toCapitalize(String value) {
  List<String> values = value.split("-");
  String returnValue = "";
  for (int i = 0; i < values.length; i++) {
    if (i == 0) {
      returnValue +=
          "${values[i].toUpperCase()[0]}${values[i].toLowerCase().replaceRange(0, 1, "")}";
    } else {
      returnValue +=
          " ${values[i].toUpperCase()[0]}${values[i].toLowerCase().replaceRange(0, 1, "")}";
    }
  }

  return returnValue;
}

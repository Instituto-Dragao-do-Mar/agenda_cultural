extension ClearMask on String {
  String clearMask() {
    return replaceAll('-', '')
        .replaceAll("/", "")
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(".", "")
        .replaceAll(" ", "");
  }
  String clearMaskWithSpaces() {
    return replaceAll('-', '')
        .replaceAll("/", "")
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(".", "");
  }


  double? textToDouble()
  {
    var ret = double.tryParse(  replaceAll(",", "."));
    return ret;
  }

}

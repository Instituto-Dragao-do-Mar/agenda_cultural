extension ClearMask on String {
  String clearMask() {
    return this
        .replaceAll('-', '')
        .replaceAll("/", "")
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(".", "")
        .replaceAll(" ", "");
  }
  String clearMaskWithSpaces() {
    return this
        .replaceAll('-', '')
        .replaceAll("/", "")
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(".", "");
  }


  double? textToDouble()
  {
    var ret = double.tryParse(  this.replaceAll(",", "."));
    return ret;
  }

}

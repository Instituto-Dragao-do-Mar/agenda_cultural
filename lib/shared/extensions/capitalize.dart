extension StringExtension on String {
  String capitalize() {
    if (!contains(" ")) if (length > 1) {
      return substring(0, 1).toUpperCase() +
          substring(1).toLowerCase();
    } else {
      return this;
    }
    else {
      return toLowerCase().split(" ").map((word) {
        if (word.isNotEmpty) {
          return word[0].toUpperCase() + word.substring(1, word.length);
        } else {
          return word;
        }
      }).join(" ");
    }
  }
}

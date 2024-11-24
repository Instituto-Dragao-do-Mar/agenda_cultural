extension StringExtension on String {
  String capitalize() {
    if (!this.contains(" ")) if (this.length > 1) {
      return this.substring(0, 1).toUpperCase() +
          this.substring(1).toLowerCase();
    } else {
      return this;
    }
    else
      return this.toLowerCase().split(" ").map((word) {
        if (word.length >= 1)
          return word[0].toUpperCase() + word.substring(1, word.length);
        else
          return word;
      }).join(" ");
  }
}

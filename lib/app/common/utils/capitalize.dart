extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;

    if (contains(' ')) {
      return split(' ').map((word) {
        if (word.isEmpty) return word;
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      }).join(' ');
    }

    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}


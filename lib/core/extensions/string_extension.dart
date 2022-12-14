extension StringExtension on String {
  getDate() {
    int tIndex = indexOf('T');

    return substring(0, tIndex);
  }

  getTime() {
    int tIndex = indexOf('T');

    return substring(tIndex + 1, length - 1);
  }

  String? get divideAuthority {
    for (int index = 8; index < length; index++) {
      this[index];
      if (this[index] == '/') {
        return substring(8, index);
      }
    }
    return null;
  }

  String? get divideParams {
    for (int index = 8; index < length; index++) {
      this[index];
      if (this[index] == '/') {
        return substring(index, length);
      }
    }
    return null;
  }
}

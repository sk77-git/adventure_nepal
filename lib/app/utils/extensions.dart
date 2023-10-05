extension StringExtension on String? {
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

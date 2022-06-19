
extension SeparatedList<T> on List<T> {
  List<T> separated(T separator) {
    final res = <T>[];
    if (isNotEmpty) {
      res.add(first);
    }
    for (var i = 1; i < length; i++) {
      res.add(separator);
      res.add(this[i]);
    }
    return res;
  }
}
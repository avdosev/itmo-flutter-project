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

extension ToString on Object? {
  String get str => this == null ? 'Не указано' : toString();
}

extension StringX on String {
  String? get nullIfEmpty => isEmpty ? null : this;
}

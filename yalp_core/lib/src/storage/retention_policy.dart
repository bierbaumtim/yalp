sealed class RetentionPolicy {
  const RetentionPolicy._();

  factory RetentionPolicy.keepAll() = KeepAll;
  factory RetentionPolicy.keepLast({required int count}) = KeepLast;
  factory RetentionPolicy.keepDays({required int days}) = KeepDays;
}

class KeepAll extends RetentionPolicy {
  const KeepAll() : super._();
}

class KeepLast extends RetentionPolicy {
  final int count;

  const KeepLast({required this.count}) : super._();
}

class KeepDays extends RetentionPolicy {
  final int days;

  const KeepDays({required this.days}) : super._();
}

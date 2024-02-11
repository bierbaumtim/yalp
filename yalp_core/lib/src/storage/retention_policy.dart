sealed class RetentionPolicy {
  const RetentionPolicy._();

  factory RetentionPolicy.keepAll() = KeepAllPolicy;
  factory RetentionPolicy.keepLast({required int count}) = KeepLastPolicy;
  factory RetentionPolicy.keepDays({required int days}) = KeepDaysPolicy;
}

class KeepAllPolicy extends RetentionPolicy {
  const KeepAllPolicy() : super._();
}

class KeepLastPolicy extends RetentionPolicy {
  final int count;

  const KeepLastPolicy({required this.count}) : super._();
}

class KeepDaysPolicy extends RetentionPolicy {
  final int days;

  const KeepDaysPolicy({required this.days}) : super._();
}

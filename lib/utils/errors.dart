class Failure {
  final String message;

  const Failure({
    required this.message,
  });
}

class CacheException implements Exception {
  final String message;

  const CacheException({
    required this.message,
  });
}

class DataNotFoundException implements Exception {
  final String message;

  const DataNotFoundException({
    required this.message,
  });
}
// ignore_for_file: public_member_api_docs, sort_constructors_first
class KeyException implements Exception {
  final String message;
  KeyException(
    this.message,
  );

  @override
  String toString() => 'KeyException: $message';
}


class CustomException implements Exception {
  const CustomException({required this.code,required this.message});
  final String code;
  final String message;
}


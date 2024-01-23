class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class NotFoundException extends AppException {
  NotFoundException([message]) : super(message, "Not found: ");
}

class RequestTimeoutException extends AppException {
  RequestTimeoutException([message]) : super(message, "Request Timed out: ");
}

class InternalServerErrorException extends AppException {
  InternalServerErrorException([message])
      : super(message, "Internal Server Error: ");
}

class ServiceUnavailableException extends AppException {
  ServiceUnavailableException([message])
      : super(message, "Service Unavailable: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

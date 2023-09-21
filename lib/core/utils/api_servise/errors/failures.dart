import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout from APIService');
      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout from APIService');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout from APIService');
      case DioErrorType.badResponse:
        if (dioError.response != null) {
          // Attempt to parse the JSON error response
          try {
            final errorList = dioError.response!.data as List<dynamic>;

            // Iterate through the list of error objects
            final errorMessages = errorList.map((error) => error['message']).toList();

            final errorMessage = errorMessages.join(', '); // Combine error messages

            return ServerFailure(errorMessage);
          } catch (_) {
            // If parsing fails, fall back to a generic error message
            return ServerFailure('Failed to parse error response');
          }
        } else {
          return ServerFailure('Bad response from APIService');
        }
      case DioErrorType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioErrorType.connectionError:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No internet connection');
        }
        return ServerFailure('Unexpected Error, try again');

      default:
        return ServerFailure('Oops there was an Error, Pls try again later');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response)
  {
    if(statusCode == 400 || statusCode == 401 || statusCode == 403)
    {
      return ServerFailure(response['error']['message']);
    }
    else if(statusCode == 404)
    {
      return ServerFailure('Your request not found, Pls try again later');
    }
    else if(statusCode == 500)
    {
      return ServerFailure('Internal server error, Pls try again later');
    }
    else
    {
      return ServerFailure('Oops there was an Error, Pls try again later');
    }
  }
}
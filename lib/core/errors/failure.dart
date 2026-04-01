import 'package:dio/dio.dart';

abstract class Faliure {
  final String errmessage;

  Faliure(this.errmessage);
}

class ServerEoor extends Faliure {
  ServerEoor(super.errmessage);
  factory ServerEoor.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        // TODO: Handle this case.
        return ServerEoor('connection timeout with api server');
      case DioExceptionType.sendTimeout:
        // TODO: Handle this case.
        return ServerEoor('send timeout with api server');
      case DioExceptionType.receiveTimeout:
        // TODO: Handle this case.
        return ServerEoor('reciver timeout with api server');
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        return ServerEoor('badCertificatet with api server');
      case DioExceptionType.badResponse:
        // TODO: Handle this case.
        return ServerEoor.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        // TODO: Handle this case.
        return ServerEoor('request with api server was canceled');
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        return ServerEoor('connection error  with api server ');
      case DioExceptionType.unknown:
        // TODO: Handle this case.
        if (dioError.message!.contains('socket exception')) {
          return ServerEoor('no internet connectiob');
        }
        return ServerEoor('oopps there was an error');
      default:
        return ServerEoor('please try again');
    }
  }
  factory ServerEoor.fromResponse(int statuscode, dynamic response) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return (ServerEoor(response['error']['message']));
    } else if (statuscode == 404) {
      return ServerEoor('your request not found, please try later!');
    } else if (statuscode == 500) {
      return ServerEoor('internal server error');
    } else {
      return ServerEoor('oops there was an error please try later');
    }
  }
}

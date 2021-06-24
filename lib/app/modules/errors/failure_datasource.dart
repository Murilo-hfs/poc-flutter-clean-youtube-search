import 'failure.dart';

class FailureDatasource extends Failure implements Exception {
  FailureDatasource(dynamic instance, String message, {dynamic exception})
      : super(instance, message, exception: exception);
}

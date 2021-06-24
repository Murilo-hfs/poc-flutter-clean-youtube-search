import 'failure.dart';

class FailureRepository extends Failure implements Exception {
  FailureRepository(dynamic instance, String message, {dynamic exception})
      : super(instance, message, exception: exception);
}

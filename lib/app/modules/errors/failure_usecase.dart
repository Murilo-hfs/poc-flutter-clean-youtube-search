import 'package:poc_clean_arch_mobx/app/modules/errors/failure.dart';

class FailureUseCase extends Failure implements Exception {
  FailureUseCase(dynamic instance, String message, {dynamic exception})
      : super(instance, message, exception: exception);
}

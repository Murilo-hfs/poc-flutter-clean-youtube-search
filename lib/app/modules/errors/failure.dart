abstract class Failure {
  final String message;
  final dynamic exception;
  final dynamic instance;

  Failure(this.instance, this.message, {this.exception});

  String get getMessage => this.message;

  String get getError => this.exception.toString();

  String get getInstance => this.instance.toString();
}

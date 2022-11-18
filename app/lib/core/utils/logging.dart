import 'package:logger/logger.dart';

class Log {
  late final Logger logger;

  Log() {
    logger = Logger();
  }

  info(dynamic message) {
    logger.i(message);
  }

  warn(dynamic message) {
    logger.w(message);
  }

  error(
    dynamic message, [
    dynamic err,
    StackTrace? stackTrace,
  ]) {
    logger.e(message, err, stackTrace);
  }
}

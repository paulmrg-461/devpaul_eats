import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Error del servidor. Intenta de nuevo.']);
}

class AuthFailure extends Failure {
  const AuthFailure([super.message = 'Error de autenticación.']);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'Recurso no encontrado.']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Error de caché local.']);
}

class PermissionFailure extends Failure {
  const PermissionFailure([super.message = 'Permisos insuficientes.']);
}

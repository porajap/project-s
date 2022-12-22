import '../bloc/auth/auth_bloc.dart';
import 'navigation_service.dart';
import 'package:provider/provider.dart';

class AuthenticationException implements Exception {
  final String message;

  AuthenticationException({this.message = 'Unknown error occurred. '});

}

class AuthenticationUnauthorized implements Exception {
  final String message;

  AuthenticationUnauthorized({this.message = 'Unauthorized'}) : super() {
    NavigationService.navigatorKey.currentContext?.read<AuthBloc>().add(AuthEventTokenInvalid());
  }
}

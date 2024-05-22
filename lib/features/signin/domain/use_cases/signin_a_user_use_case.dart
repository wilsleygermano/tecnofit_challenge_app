import 'package:tecnofit_challenge_app/core/generics/resource.dart';
import 'package:tecnofit_challenge_app/core/models/user.dart';

abstract class SigninAUserUseCase {
  /// Registers a user with the provided email and password.
  ///
  /// Returns a [Resource] object containing either the registered [User] or an error message.
  /// The [Resource] object is wrapped in a [Future] to allow asynchronous execution.
  ///
  /// The [email] parameter is the email of the user to be registered.
  /// The [password] parameter is the password of the user to be registered.
  ///
  /// Throws an exception if an error occurs during the registration process.
  Future<Resource<User, String>> call({
    required String email,
    required String password,
  });
}

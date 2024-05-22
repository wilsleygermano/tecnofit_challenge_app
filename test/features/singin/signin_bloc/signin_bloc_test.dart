import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tecnofit_challenge_app/core/generics/resource.dart';
import 'package:tecnofit_challenge_app/core/models/user.dart';
import 'package:bloc_test/bloc_test.dart';

@GenerateNiceMocks([MockSpec<SigninAUserUseCase>()])
@GenerateNiceMocks([MockSpec<GetUserUseCase>()])
import 'package:tecnofit_challenge_app/features/signin/signin.dart';

import 'signin_bloc_test.mocks.dart';

void main() {
  group("[Signin Bloc Group Test] -", () {
    late SigninBloc signinBloc;
    late MockSigninAUserUseCase mockSigninAUserUseCase;
    late MockGetUserUseCase mockGetUserUseCase;

    setUp(() {
      mockSigninAUserUseCase = MockSigninAUserUseCase();
      mockGetUserUseCase = MockGetUserUseCase();
      signinBloc = SigninBloc(mockSigninAUserUseCase, mockGetUserUseCase);
    });

    test("Initial State Status is SigninStatus.initial", () {
      expect(signinBloc.state.status, SigninStatus.initial);
    });

    blocTest("Emits Success when the requisition completes successfully",
        setUp: () {
          when(mockSigninAUserUseCase.call(
                  email: "email", password: "password"))
              .thenAnswer((_) async => Resource.success(
                  data: const User(
                      id: 0,
                      email: "",
                      firstName: "",
                      lastName: "",
                      avatar: "",
                      token: "")));

          when(mockGetUserUseCase.call()).thenAnswer((_) async =>
              Resource.success(
                  data: const User(
                      id: 0,
                      email: "",
                      firstName: "",
                      lastName: "",
                      avatar: "",
                      token: "")));
        },
        build: () => signinBloc,
        act: (bloc) =>
            bloc.add(SigninRequested(email: "email", password: "password")),
        expect: () => [
              const SigninBlocState(
                  status: SigninStatus.loading,
                  error: "",
                  user: User(
                      id: 0,
                      email: "",
                      firstName: "",
                      lastName: "",
                      avatar: "",
                      token: "")),
              const SigninBlocState(
                  status: SigninStatus.success,
                  error: "",
                  user: User(
                      id: 0,
                      email: "",
                      firstName: "",
                      lastName: "",
                      avatar: "",
                      token: ""))
            ]);
    blocTest("Emits Failure when the requisition fails to complete",
        setUp: () {
          when(mockSigninAUserUseCase.call(
                  email: "email", password: "password"))
              .thenAnswer((_) async => Resource.failed(
                  error: "An error occurred while signin the user."));
          when(mockGetUserUseCase.call()).thenAnswer((_) async =>
              Resource.failed(
                  error: "An error occurred while signin the user."));
        },
        build: () => signinBloc,
        act: (bloc) =>
            bloc.add(SigninRequested(email: "email", password: "password")),
        expect: () => [
              const SigninBlocState(
                  status: SigninStatus.loading,
                  error: "",
                  user: User(
                      id: 0,
                      email: "",
                      firstName: "",
                      lastName: "",
                      avatar: "",
                      token: "")),
              const SigninBlocState(
                  status: SigninStatus.failure,
                  error: "An error occurred while signin the user.",
                  user: User(
                      id: 0,
                      email: "",
                      firstName: "",
                      lastName: "",
                      avatar: "",
                      token: ""))
            ]);
  });
}

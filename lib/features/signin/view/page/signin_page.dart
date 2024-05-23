import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnofit_challenge_app/core/constants/app_strings.dart';
import 'package:tecnofit_challenge_app/core/widgets/adaptive_layout_builder.dart';
import 'package:tecnofit_challenge_app/core/widgets/vertical_spacer.dart';
import 'package:tecnofit_challenge_app/features/signin/signin.dart';
import 'package:tecnofit_challenge_app/features/signin/view/widgets/generic_signin_image.dart';
import 'package:tecnofit_challenge_app/features/signin/view/widgets/mock_text_field.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XFFfffff4),
        body: BlocProvider(
          create: (context) => SigninBloc(),
          child: Center(
            child: AdaptiveLayoutBuilder.signin(
              children: [
                const GenericSigninImage(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0XFFf9f9f9),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            AppStrings.welcomeBack,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          const VerticalSpacer(),
                          const MockTextField.email(),
                          const VerticalSpacer(),
                          const MockTextField.password(),
                          const VerticalSpacer(),
                          BlocBuilder<SigninBloc, SigninBlocState>(
                              builder: (context, state) {
                            if (state.status == SigninStatus.loading) {
                              return const CircularProgressIndicator.adaptive();
                            }
                            if (state.status == SigninStatus.failure) {
                              context.read<SigninBloc>().add(
                                    ResetRequested(),
                                  );
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                showAdaptiveDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog.adaptive(
                                    title: const Text(
                                      AppStrings.somethingWentWrong,
                                    ),
                                    titlePadding: const EdgeInsets.all(8),
                                    titleTextStyle: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                          color: Colors.black,
                                        ),
                                    content: const Text(
                                      AppStrings.pleaseTryAgain,
                                    ),
                                    contentTextStyle: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Colors.black,
                                        ),
                                    contentPadding: const EdgeInsets.all(8),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          AppStrings.ok,
                                          style: TextStyle(
                                            color: Color(0xFF6C63FF),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                            }
                            if (state.status == SigninStatus.success) {
                              context.read<SigninBloc>().add(
                                    ProfilePageRequested(
                                      context: context,
                                      user: state.user,
                                    ),
                                  );
                            }

                            return ElevatedButton(
                              onPressed: () {
                                context.read<SigninBloc>().add(
                                      SigninRequested(
                                        email: AppStrings.mockMail,
                                        password: AppStrings.mockPassword,
                                      ),
                                    );
                              },
                              child: Text(
                                AppStrings.signIn,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

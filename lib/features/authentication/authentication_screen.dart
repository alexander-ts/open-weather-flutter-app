import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather_flutter_app/config/themes.dart';
import 'package:open_weather_flutter_app/features/authentication/cubit/authentication_cubit.dart';
import 'package:open_weather_flutter_app/features/authentication/widgets/authentication_text_field.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final areaPadding = MediaQuery.of(context).padding.top > 20
        ? MediaQuery.of(context).padding.top - 20
        : MediaQuery.of(context).padding.top;
    final double topPadding = areaPadding < 48 ? 48 - areaPadding : 0;
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(minWidth: double.infinity),
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(24, topPadding, 24, 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Вход',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Введите данные для входа',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 32),
                  Form(
                    child: Column(
                      children: [
                        AuthenticationTextField(
                          label: 'Email',
                          controller: loginController,
                        ),
                        AuthenticationTextField(
                          label: 'Пароль',
                          controller: passwordController,
                          useObscureSuffix: true,
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.resolveWith((states) => const Size(400, 48)),
                            maximumSize: MaterialStateProperty.resolveWith((states) => const Size(400, 48)),
                            backgroundColor: MaterialStateProperty.resolveWith((states) => blue),
                            foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
                            textStyle: MaterialStateProperty.resolveWith((states) =>
                                Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
                          ),
                          onPressed: () => context.read<AuthenticationCubit>().signIn(
                                loginController.text,
                                passwordController.text,
                              ),
                          child: const Text('Войти'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

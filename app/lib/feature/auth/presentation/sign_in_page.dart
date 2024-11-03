import 'dart:async';

import 'package:app/common_widget.dart';
import 'package:app/feature/auth/controller.dart';
import 'package:app/feature/validation/domain.dart';
import 'package:app/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController(text: 'test@example.com');
    final passwordController = useTextEditingController(text: 'pass1234');
    final passwordFocusNode = useFocusNode();
    final isHidePassword = useState(true);
    final isLoading = useState(false);

    FutureOr<void> runWithLoading(AsyncCallback action) async {
      try {
        isLoading.value = true;
        await action();
      } finally {
        isLoading.value = false;
      }
    }

    return FullScreenLoading(
      isLoading: isLoading.value,
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'サインイン',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: emailController,
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  validator: ValidatorFactory.make([
                    RequiredValidation(),
                    EmailValidation(),
                  ]),
                  autofillHints: const [AutofillHints.username],
                  decoration: InputDecoration(
                    hintText: 'メールアドレス',
                    prefixIcon: const Icon(Icons.email_outlined),
                    suffixIcon: DeleteTextButton(controller: emailController),
                  ),
                  onEditingComplete: passwordFocusNode.requestFocus,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                  validator: ValidatorFactory.make([
                    RequiredValidation(),
                    PasswordValidation(),
                  ]),
                  autofillHints: const [AutofillHints.password],
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  obscureText: isHidePassword.value,
                  decoration: InputDecoration(
                    hintText: 'パスワード',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IsVisibleIconButton(
                      isVisible: isHidePassword.value,
                      onPressed: () =>
                          isHidePassword.value = !isHidePassword.value,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton(
                  child: const Text('サインイン'),
                  onPressed: () {
                    if (formKey.currentState?.validate() != true) {
                      return;
                    }

                    FocusScope.of(context).unfocus();

                    runWithLoading(
                      () async => ref
                          .read(emailAuthControllerProvider(context))
                          .signIn(
                              email: emailController.text,
                              password: passwordController.text),
                    );
                  },
                ),
                const SizedBox(height: 8),
                FilledButton.tonalIcon(
                  label: const Text('Googleでサインイン'),
                  icon: const Text('G'),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    runWithLoading(
                      () async => ref
                          .read(googleAuthControllerProvider(context))
                          .signIn(),
                    );
                  },
                ),
                const Divider(height: 32),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  child: const Text('アカウントをお持ちでないかたはこちら'),
                  onPressed: () => context.router.push(const SignUpRoute()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

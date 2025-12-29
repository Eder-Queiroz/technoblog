import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/utils/components/button.dart';
import 'package:mobile/views/contexts/user_context.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late final UserContext _userContext;

  @override
  void initState() {
    super.initState();
    _userContext = ref.read(userContextProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userContextProvider);

    return Scaffold(
      appBar: AppBar(title: Text('TechBlog')),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 69),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              Text(
                'Insights & Learning',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                'Explorando tendências Tech, um post por vez',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              Button(
                label: 'Começar a ler',
                onPressedAsync: _userContext.login,
                isLoading: user.isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

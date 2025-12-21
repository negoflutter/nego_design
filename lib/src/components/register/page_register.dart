import 'package:flutter/material.dart';
import 'package:nego_design/_import.dart';

class PageRegister extends StatefulWidget {
  const PageRegister({super.key});

  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return BaseContainer(
      title: 'Cadastro',
      description: 'Faça o processo de criação da sua conta',
      child: ListView(
        shrinkWrap: true,
        children: [
          InputEmail(controller: _emailController),
          const SizedBox(height: 20),
          InputPhone(controller: _phoneController),
          const SizedBox(height: 20),
          InputPassword(controller: _passwordController),
          const SizedBox(height: 10),
          BaseContainerButton(onPressed: () {}),
          const SizedBox(height: 20),
          const OrDivider(),
          const SizedBox(height: 20),
          SocialLinkButton(
            label: 'Login com Google',
            image: NegoAppImage.google,
          ),
          const SizedBox(height: 20),
          SocialLinkButton(
            label: 'Login com Facebook',
            image: NegoAppImage.facebook,
          ),
          const SizedBox(height: 20),
          Container(
            //child: TextButton(onPressed: () {}, child: Text('Esqueci minha senha ?')),
            alignment: Alignment.center,
            child: Text.rich(
              TextSpan(
                text: 'Não tenho conta?',
                children: [
                  TextSpan(text: '  '),
                  TextSpan(
                    text: 'Cadastramento',
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

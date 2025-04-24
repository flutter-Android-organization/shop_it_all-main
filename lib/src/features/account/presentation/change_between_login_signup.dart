import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_it_all/src/common_widgets/add_button.dart';
import 'package:shop_it_all/src/common_widgets/my_dialog_box.dart';
import 'package:shop_it_all/src/common_widgets/show_snack_bar.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/constants/padding_constants.dart';
import 'package:shop_it_all/src/constants/shop_it_keys.dart';
import 'package:shop_it_all/src/features/account/presentation/controller/auth_controller.dart';
import 'package:shop_it_all/src/features/account/presentation/controller/current_user_controller.dart';
import 'package:shop_it_all/src/features/account/presentation/login_page.dart';
import 'package:shop_it_all/src/features/account/presentation/signup_page.dart';
import 'package:shop_it_all/src/routes/route_names.dart';

import '../domain/app_user.dart';


class ChangeBetweenLoginSignup extends ConsumerStatefulWidget {
  const ChangeBetweenLoginSignup({super.key, this.initialViewIsLogin = true});

  final bool initialViewIsLogin;

  @override
  ConsumerState<ChangeBetweenLoginSignup> createState() => _ChangeBetweenLoginSignupState();
}

class _ChangeBetweenLoginSignupState extends ConsumerState<ChangeBetweenLoginSignup> {
  late bool _isLoginView;
  final _loginEmailController = TextEditingController();
  final _loginPasswordController = TextEditingController();
  final _signupEmailController = TextEditingController();
  final _signupPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _isLoginView = widget.initialViewIsLogin;
  }

  @override
  void dispose() {
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    _signupEmailController.dispose();
    _signupPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: pd1All0,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              gbHt40,
              Text(
                _isLoginView ? 'Welcome to Shop it all' : 'Create An Account',
                style: const TextStyle(
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              gbHt5,
              const Text('Please enter your detail', style: TextStyle(fontSize: 16)),
              gbHt20,
              gbHt40,
              _isLoginView
                  ? LoginPage(
                loginEmailController: _loginEmailController,
                loginPasswordController: _loginPasswordController,
              )
                  : SignupPage(
                signupEmailController: _signupEmailController,
                signupPasswordController: _signupPasswordController,
              ),
              gbHt20,
              const HorizontalOr(),
              gbHt30,
              _buildSocialButtons(),
              gbHt20,
              _buildAuthButton(),
              gbHt5,
              ChangeTextButton(
                key: ShopItKeys.changeBtwBtnKey,
                onChangeText: _toggleView,
                changeText: _isLoginView
                    ? 'Don\'t have an account? Sign up'
                    : 'Go back and Login',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButtons() => Column(
    children: [
      AddButton(
        iconToImage: false,
        wishImage: 'assets/images/random_images/google.png',
        onWish: () => myDialogBox(context),
        wishText: 'Continue With Google',
      ),
      gbHt10,
      AddButton(
        iconToImage: false,
        onWish: () => context.goNamed(RouteNames.pageNav.name),
        wishImage: 'assets/images/random_images/guest.png',
        wishText: 'Continue As A Guest',
      ),
    ],
  );

  Widget _buildAuthButton() => AddButton(
    key: ShopItKeys.signupOrLoginBtn,
    btnBackground: const Color(0xffFFE393),
    onWish: _handleAuthAction,
    wishIcon: _isLoginView ? Icons.login : Icons.assignment_ind_outlined,
    wishText: _isLoginView ? 'Login' : 'Register',
  );

  Future<void> _handleAuthAction() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final authNotifier = ref.read(authControllerProvider.notifier);
    final currentUserNotifier = ref.read(currentUserControllerProvider.notifier);

    if (_isLoginView) {
      await _handleLogin(authNotifier,currentUserNotifier);
    } else {
      await _handleSignup(authNotifier);
    }
  }

  Future<void> _handleLogin(
      AuthController authNotifier,
      CurrentUserController currentUserNotifier,
      ) async {
    final email = _loginEmailController.text.trim();
    final password = _loginPasswordController.text.trim();

    try {
      final isRegistered = await authNotifier.isUserRegistered(email, password);

      if (!isRegistered) {
        _showSnackBar('Invalid email or password', isError: true);
        return;
      }

      await authNotifier.signInWithEmailAndPassword(email, password);
      await currentUserNotifier.setUser(AppUser(email: email, password: password));

      _showSnackBar('Login successful');
      if (mounted) {
        context.goNamed(RouteNames.pageNav.name);
      }
    } catch (e) {
      _showSnackBar('Login failed: ${e.toString()}', isError: true);
    }
  }

  Future<void> _handleSignup(AuthController authNotifier) async {
    final email = _signupEmailController.text.trim();
    final password = _signupPasswordController.text.trim();

    try {
      await authNotifier.registerWithEmailAndPassword(email, password);
      _showSnackBar('Registration successful');
      if (mounted) {
        setState(() => _isLoginView = true); // Switch to login view
      }
    } catch (e) {
      _showSnackBar('Registration failed: ${e.toString()}', isError: true);
    }
  }

  void _showSnackBar(String message, {bool isError = false}) {
    if (!mounted) return;

    showSnackBar(
        context,
        message,
        isError
            ? 'assets/images/random_images/error.png'
            : 'assets/images/random_images/correct.png'
    );
  }

  void _toggleView() {
    setState(() => _isLoginView = !_isLoginView);
  }
}

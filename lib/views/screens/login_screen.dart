import 'package:archive_app2/data/services/auth_service.dart';
import 'package:archive_app2/utils/app_pading.dart';
import 'package:archive_app2/viewModel/api_provider.dart';
import 'package:archive_app2/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class LoginPage extends ConsumerStatefulWidget {
  LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GetStorage _storage = GetStorage();
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    // "Beni Hatırla" seçeneğini kontrol et
    _rememberMe = _storage.read('rememberMe') ?? false;
    if (_rememberMe) {
      // Token kontrolü yap ve ana sayfaya yönlendir
      checkTokenAndNavigate();
    }
  }

  Future<void> checkTokenAndNavigate() async {
    final token = await TokenManager.getToken();
    if (token != null) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.read(authViewModelProvider.notifier);
    final isLoading = ref.watch(authViewModelProvider).isLoading;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(200),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/serdivan.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 130, left: 16, right: 16, bottom: 16),
                child: CustomTextFormField(
                  labelText: 'Kullanıcı Adı',
                  controller: _emailController,
                ),
              ),
              Padding(
                padding: AppPaddings.all16,
                child: CustomTextFormField(
                  labelText: 'Şifre',
                  isObscure: true,
                  controller: _passwordController,
                ),
              ),
              Padding(
                padding: AppPaddings.all16,
                child: Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                        _storage.write('rememberMe', _rememberMe);
                      },
                    ),
                    const Text('Beni Hatırla'),
                  ],
                ),
              ),
              Padding(
                padding: AppPaddings.all16,
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          await authNotifier.login(
                              _emailController.text,
                              _passwordController.text,
                              context);
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: SizedBox(
                    height: 25,
                    width: 100,
                    child: Center(
                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              'Giriş',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
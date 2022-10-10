import 'package:flutter/material.dart';
import 'package:mvp_pattern/login/presenter/login_presenter_contract.dart';
import 'package:mvp_pattern/login/presenter/login_presenter_impl.dart';
import 'package:mvp_pattern/login/view/login_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginView {
  var _loading = false;
  LoginPresenter presenter = LoginPresenterImpl();

  @override
  void initState() {
    presenter.view = this;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade700, Colors.red.shade700])),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      filled: true,
                      labelText: 'Login',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          borderSide: BorderSide(color: Colors.white)),
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white)),
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Senha',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: const BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: const BorderSide(color: Colors.white)),
                      labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white)),
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.teal)),
                      onPressed: () {
                        presenter.login();
                      },
                      child: _loading
                          ? const Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.0),
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'Entrar',
                              style: TextStyle(fontSize: 18),
                            )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void hideLoading() {
    setState(() {
      _loading = false;
    });
  }

  @override
  void redirect() {
    Navigator.of(context).pushNamed('/home');
  }

  @override
  void showLoading() {
    setState(() {
      _loading = true;
    });
  }
}

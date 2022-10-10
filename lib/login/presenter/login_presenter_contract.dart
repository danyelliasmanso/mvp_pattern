import 'package:mvp_pattern/login/view/login_view.dart';

abstract class LoginPresenter {
  set view(LoginView view);
  void login();
}
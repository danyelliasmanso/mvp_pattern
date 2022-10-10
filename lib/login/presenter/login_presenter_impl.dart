import 'package:mvp_pattern/login/presenter/login_presenter_contract.dart';
import 'package:mvp_pattern/login/view/login_view.dart';

class LoginPresenterImpl implements LoginPresenter {
  late final LoginView _view;

  @override
  void login() {
    _view.showLoading();
    Future.delayed(const Duration(seconds: 3))
        .then((value) {
      _view.hideLoading();
      _view.redirect();
    });
  }

  @override
  set view(LoginView view) => _view = view;
}

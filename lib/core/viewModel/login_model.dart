import 'package:provider_architecture/core/enums/view_state.dart';
import 'package:provider_architecture/core/services/authentication_service.dart';
import 'package:provider_architecture/core/viewModel/base_model.dart';
import 'package:provider_architecture/locator.dart';

class LoginModel extends BaseModel {

  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  String errorMessage;

  Future<bool> login({ String userIdValue }) async {
    setState(ViewState.Busy);

    var userId = int.tryParse(userIdValue);

    if (userId == null) {
      errorMessage = "Value entered is not a number";
      setState(ViewState.Idle);
      return false;
    }

      var success = await _authenticationService.login(userId: userId);

      setState(ViewState.Idle);
      return success;
  }
}
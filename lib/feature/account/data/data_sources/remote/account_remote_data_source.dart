import 'package:travel_guide/core/services/network/network_configrations.dart';
import 'package:travel_guide/core/services/network/network_interface.dart';
import 'package:travel_guide/core/services/network/network_service.dart';
import 'package:travel_guide/feature/account/data/models/remote/login_model.dart';
import 'package:travel_guide/feature/account/data/models/remote/register_model.dart';

class AccountRemoteDataSource {
  NetworkServices networkServices = NetworkServices();
  Future<RegisterResponseModel> register(
    RegisterParamsModel model,
  ) async {
    final res = await networkServices.post(
      RemoteDataBundle(
        body: model.toJson(),
        networkPath: NetworkConfigurations.kRegister,
        urlParams: <String, String>{},
      ),
    );
    return Future.value(RegisterResponseModel.fromJson(res));
  }

  Future<LoginResponseModel> login(
    LoginParamsModel model,
  ) async {
    final res = await networkServices.post(
      RemoteDataBundle(
        body: model.toJson(),
        networkPath: NetworkConfigurations.kLogin,
        urlParams: <String, String>{},
      ),
    );
    return Future.value(LoginResponseModel.fromJson(res));
  }
}

import 'package:bookingapp/pages/settings/bloc/data/settings_model.dart';

class SettingsRepo {
  Future<SettingsModel> getSettingsDatas() async {
    await Future.delayed(Duration(milliseconds: 500));

    var jsonDecoded = {
      "firstName": "Ayaan",
      "lastName": "Sharaf",
      "phone": "8547938611",
      "email": "ayaan@belllab.co"
    };

    //  throw "Json Momova";

    return SettingsModel.fromJson(jsonDecoded);
  }
}

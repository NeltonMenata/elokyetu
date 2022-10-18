import 'package:elokyetu/Back4app/model/personal/personal_model.dart';
import 'package:elokyetu/Back4app/repository/personal/i_personal_back4app.dart';

class PersonalRepository implements IPersonalBack4app {
  @override
  Future<PersonalModel> getPersonal(String objectId) async {
    return PersonalModel();
  }

  @override
  Future<List<PersonalModel>> getListPersonal(String objectId) async {
    return [PersonalModel()];
  }
}

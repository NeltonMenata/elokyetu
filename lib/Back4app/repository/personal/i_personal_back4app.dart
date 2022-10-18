import '../../model/personal/personal_model.dart';

abstract class IPersonalBack4app {
  Future<PersonalModel> getPersonal(String objectId);
  Future<List<PersonalModel>> getListPersonal(String objectId);
}

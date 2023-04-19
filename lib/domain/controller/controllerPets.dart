import 'package:crud_http/data/services/peticionesPets.dart';
import 'package:crud_http/domain/models/pets.dart';
import 'package:get/get.dart';

class ControlPets extends GetxController {
  final Rxn<List<Pets>> listaPets = Rxn<List<Pets>>([]);

  Future<void> getPetsGral() async {
    listaPets.value = await PeticionesPets.getListPets();
  }

  

  List<Pets>? get listaPetsFinal => listaPets.value;
}

import 'package:crud_http/domain/controller/controllerPets.dart';
import 'package:crud_http/domain/controller/controllerUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListPets extends StatelessWidget {
  const ListPets({super.key});

  @override
  Widget build(BuildContext context) {
    ControlPets controlp = Get.find();
    ControlUser controlu = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Mascotas'),
      ),
      body: ListView.builder(
        itemCount: controlp.listaPetsFinal!.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(controlp.listaPetsFinal![index].foto),
            ),
            title: Text(controlp.listaPetsFinal![index].nombre),
            subtitle: Text(controlp.listaPetsFinal![index].raza),
            trailing: (controlp.listaPetsFinal![index].idUser ==
                    controlu.listaUserLogin![0].id)
                ? IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
                : const Text(''),
          );
        },
      ),
    );
  }
}

import 'package:testcasepttransisi/app/data/model/user.model.dart';
import 'package:testcasepttransisi/app/data/service/ApiService.dart';

class ApiRepositoryImpl {
  final _service = ApiService();

  Future<List<Data>> fetchUserList() => _service.getuserList();

  Future addUser(String name, String job) => _service.addUser(name, job);
}

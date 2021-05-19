import 'package:hasura_connect/hasura_connect.dart';
import 'package:hasura_integration/shared/constants.dart';
import 'home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final _client = HasuraConnect(HASURA_URL);

  @override
  Future<List<Map>> getTarefas() async {
    return await _client.query(
    '''   
    query {
      MyProjects_posts {
        id
        name
        photo
      }
    }
  ''');
  }

  @override
  Stream<List<Map>> streamTarefas() {
    return tarefas
        .snapshots()
        .map((e) => e.documents.map((e) => {"name": e.data['name']}).toList());
  }
}

import 'package:hasura_connect/hasura_connect.dart';
import 'package:hasura_integration/shared/constants.dart';
import 'package:hasura_integration/shared/headers.dart';
import 'home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final _client = HasuraConnect(HASURA_URL, headers: headers);

  @override
  Future<List<Map>> getTarefas() async {
    final response = await _client.query("""  
    query {
      MyProjects_posts {
        id
        name
        photo
      }
    }
    """ );
    print(response);
  }

  @override
  Stream<List<Map>> streamTarefas() {
    /*return tarefas
        .snapshots()
        .map((e) => e.documents.map((e) => {"name": e.data['name']}).toList());*/
  }
}

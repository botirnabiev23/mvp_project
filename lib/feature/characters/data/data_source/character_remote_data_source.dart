import 'package:dio/dio.dart';
import 'package:mvp_project/feature/characters/data/models/character_model.dart';

abstract interface class CharacterRemoteDataSource {
  Future<List<CharacterModel>> getCharacter(int page);
}

class CharacterRemoteDataSourceImpl extends CharacterRemoteDataSource {
  final Dio dio;

  CharacterRemoteDataSourceImpl(this.dio);

  @override
  Future<List<CharacterModel>> getCharacter(int page) async {
    try {
      final response = await dio.get(
        'https://rickandmortyapi.com/api/character',
        queryParameters: {'page': page},
      );
      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['results'];
        return results.map((json) => CharacterModel.fromJson(json)).toList();
      } else {
        throw Exception('Unexpected status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }
}

import 'package:bloc_demo/model/album_model.dart';
import 'package:bloc_demo/service/api_service.dart';

class AlbumApiService extends ApiService {
  @override
  String get apiUrl => '/albums';

  Future<List<AlbumModel>> fetchAlbums() async {
    var albumsMap = await fetch() as List;
    return albumsMap.map((map) => AlbumModel.fromJson(map)).toList();
  }

  Future<AlbumModel> fetchAlbum(String end) async {
    var map = await fetch(endPoint: end) as Map<String, dynamic>;
    return AlbumModel.fromJson(map);
  }

  Future<bool> insertAlbum(AlbumModel album) async {
    return await insert(album.toJson());
  }

  Future<bool> updateAlbum(AlbumModel album) async {
    return await update(album.toJson());
  }

  Future<bool> deleteAlbum(AlbumModel album) async {
    return await remove(album.toJson());
  }
}

part of 'album_bloc.dart';

@immutable
sealed class AlbumState {
  const AlbumState();
}

final class AlbumInitial extends AlbumState {}

final class AlbumLoading extends AlbumState {}

final class AlbumLoaded extends AlbumState {
  final List<AlbumModel> albums;
  final List<AlbumModel> filteredAlbums;

  const AlbumLoaded({required this.albums, required this.filteredAlbums});

  AlbumLoaded copyWith({List<AlbumModel>? filteredAlbums}) {
    return AlbumLoaded(
      albums: albums,
      filteredAlbums: filteredAlbums ?? this.filteredAlbums,
    );
  }
}

final class AlbumError extends AlbumState {
  final String errorMsg;

  const AlbumError({required this.errorMsg});
}

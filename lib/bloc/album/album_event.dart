part of 'album_bloc.dart';

@immutable
sealed class AlbumEvent {}

class AlbumsFetchEvent extends AlbumEvent {}

class AlbumSearchEvent extends AlbumEvent {
  final String query;

  AlbumSearchEvent({required this.query});
}

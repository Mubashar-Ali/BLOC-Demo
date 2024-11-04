import 'dart:async';

import 'package:bloc_demo/model/album_model.dart';
import 'package:bloc_demo/service/album_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc() : super(AlbumInitial()) {
    on<AlbumsFetchEvent>(fetchAlbums);
    on<AlbumSearchEvent>(filterAlbums);
  }

  Future<void> fetchAlbums(
      AlbumsFetchEvent event, Emitter<AlbumState> emit) async {
    emit(AlbumLoading());

    try {
      var albums = await AlbumApiService().fetchAlbums();
      emit(AlbumLoaded(albums: albums, filteredAlbums: albums));
    } catch (e) {
      emit(AlbumError(errorMsg: "Error: $e"));
    }
  }

  FutureOr<void> filterAlbums(
      AlbumSearchEvent event, Emitter<AlbumState> emit) {
    final currState = state as AlbumLoaded;
    if (state is AlbumLoaded) {
      final filtered = currState.albums.where((album) {
        return album.title!.toLowerCase().contains(event.query.toLowerCase());
      }).toList();
      emit(currState.copyWith(filteredAlbums: filtered));
    }
  }
}

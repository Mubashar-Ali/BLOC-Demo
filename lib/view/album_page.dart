import 'package:bloc_demo/bloc/album/album_bloc.dart';
import 'package:bloc_demo/model/album_model.dart';
import 'package:bloc_demo/view/error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({super.key});

  static const String routeName = "AlbumPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API and Filtered'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                context.read<AlbumBloc>().add(AlbumSearchEvent(query: value));
              },
              decoration: const InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<AlbumBloc, AlbumState>(
                builder: (context, state) {
                  return switch (state) {
                    AlbumInitial() =>
                      const Center(child: CircularProgressIndicator()),
                    AlbumLoading() =>
                      const Center(child: CircularProgressIndicator()),
                    AlbumLoaded(:var filteredAlbums) =>
                      AlbumLoadedPage(albums: filteredAlbums),
                    _ => const ErrorPage(),
                  };
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlbumLoadedPage extends StatelessWidget {
  const AlbumLoadedPage({
    super.key,
    required this.albums,
  });

  final List<AlbumModel> albums;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(5),
      itemCount: albums.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: ListTile(
            leading: Text(albums[index].id.toString()),
            title: Text(albums[index].title.toString()),
          ),
        );
      },
    );
  }
}

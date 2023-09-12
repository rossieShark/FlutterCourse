import 'package:audio_player/models/favorite_folder_model.dart';
import 'package:audio_player/screens/my_music_screens/new_folder.dart';
import 'package:audio_player/screens/tab_bar/index.dart';
import 'package:audio_player/widgets/user_info_widget.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MyMusicPage extends StatefulWidget {
  const MyMusicPage({super.key});

  @override
  State<MyMusicPage> createState() => _MyMusicPageState();
}

class _MyMusicPageState extends State<MyMusicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      appBar: AppBar(
        shadowColor: AppColors.black.color,
        elevation: 1.0,
        backgroundColor: AppColors.background.color,
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'My music',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        leading: IconButtonWidget(
            iconData: Icons.splitscreen,
            color: AppColors.accent.color,
            onPressed: () {}),
        actions: [
          IconButtonWidget(
              iconData: Icons.add,
              color: AppColors.accent.color,
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) =>
                      const ImagePickerActionSheet(),
                );
              })
        ],
      ),
      body: PlatformBuilder(
          web: const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: _MyFavoriteListView(),
          ),
          other: Column(
            children: [
              const UserInfoWidget(),
              Container(
                height: 10,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.accent.color, width: 1),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: _MyFavoriteListView(),
              ),
            ],
          ),
          builder: (context, child, widget) {
            return widget;
          }),
    );
  }
}

class _MyFavoriteListView extends StatelessWidget {
  const _MyFavoriteListView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70 * folders.length.toDouble(),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: folders.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (index == 0) {
                  GoRouter.of(context)
                      .push('/${routeNameMap[RouteName.favoriteAlbums]!}');
                } else {
                  GoRouter.of(context)
                      .push('/${routeNameMap[RouteName.favoriteTracks]!}');
                }
              },
              child: _FavouritefoldersCard(index: index),
            );
          }),
    );
  }
}

class _FavouritefoldersCard extends StatelessWidget {
  const _FavouritefoldersCard({required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: MediaQuery.of(context).size.width - 32,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: folders[index].image),
            ),
            Text(
              folders[index].title,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: AppFonts.lusitana.font,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        folders[index].iconButton
      ]),
    );
  }
}

List<FavoriteFolder> folders = [
  FavoriteFolder(
      image: Icon(
        Icons.album,
        color: AppColors.white.color,
      ),
      title: "Albums",
      iconButton: IconButtonWidget(
        iconData: Icons.arrow_forward_ios,
        color: AppColors.white.color,
        onPressed: () {},
      )),
  FavoriteFolder(
    image: Icon(Icons.music_note, color: AppColors.white.color),
    title: "Tracks",
    iconButton: IconButtonWidget(
      iconData: Icons.arrow_forward_ios,
      color: AppColors.white.color,
      onPressed: () {},
    ),
  ),
];

class ImagePickerActionSheet extends StatelessWidget {
  const ImagePickerActionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: <Widget>[
        Container(
          color: const Color.fromARGB(255, 55, 54, 54),
          child: CupertinoActionSheetAction(
            isDefaultAction: true,
            child: Row(
              children: [
                Icon(Icons.library_music, color: AppColors.white.color),
                Text(
                  ' Playlist',
                  style: TextStyle(
                      color: AppColors.white.color,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            onPressed: () => showBarModalBottomSheet(
              // Use the alias here
              expand: true,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => const NewFolder(),
            ),
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 55, 54, 54),
          child: CupertinoActionSheetAction(
            child: Row(
              children: [
                Icon(Icons.art_track, color: AppColors.white.color),
                Text(
                  ' Artist',
                  style: TextStyle(
                      color: AppColors.white.color,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ),
      ],
      // cancelButton: CupertinoActionSheetAction(
      //   child: Text(
      //     'Cancel',
      //     style: TextStyle(
      //         color: AppColors.accent.color,
      //         fontSize: 16,
      //         fontWeight: FontWeight.w600),
      //   ),
      //   onPressed: () => Navigator.of(context).pop(),
      // ),
    );
  }
}

import 'package:audio_player/models/song_model/song_model.dart';

import 'package:audio_player/services/services.dart';
import 'package:audio_player/widgets/ui_properties.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailMusicPage extends StatefulWidget {
  final String param;
  const DetailMusicPage({super.key, required this.param});

  @override
  State<DetailMusicPage> createState() => _DetailMusicPageState();
}

class _DetailMusicPageState extends State<DetailMusicPage> {
  late final SongDetailRepository _songDetailRepository;
  late double _sliderValue;
  String _formattedDuration = '00:00';
  final Duration _audioDuration = const Duration(seconds: 15);

  @override
  void initState() {
    super.initState();
    _songDetailRepository = SongDetailRepository();
    _sliderValue = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _songDetailRepository.getSongInfo(widget.param),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(color: Colors.transparent);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final songInfo = snapshot.data;
            return _buildMusicPage(context, songInfo);
          }
        });
  }

  Widget _buildMusicPage(BuildContext context, SongDetail? songInfo) {
    return Scaffold(
      backgroundColor: AppColors.white.color,
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.delta.dy > 10) {
            context.pop('/');
          }
        },
        child: _builMainSection(songInfo),
      ),
    );
  }

  Widget _builMainSection(SongDetail? songInfo) {
    final maxWidth = MediaQuery.of(context).size.width;
    bool isIpad = maxWidth > 600;
    double sizeInspector(double size) {
      return isIpad ? size * 1 : size * 1.3;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildImageSection(songInfo),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Text(
                songInfo?.artist_names ?? 'NoName',
                style: TextStyle(
                    fontFamily: AppFonts.lusitana.font,
                    fontSize: sizeInspector(maxWidth * 0.028),
                    fontWeight: FontWeight.w600),
              ),
            ),
            Text(songInfo?.title ?? '',
                style: TextStyle(
                    fontFamily: AppFonts.colombia.font,
                    fontSize: sizeInspector(maxWidth * 0.033),
                    fontWeight: FontWeight.w600)),
          ],
        ),
        Column(
          children: [
            SizedBox(
              width: maxWidth * 0.8,
              child: Slider(
                activeColor: AppColors.darkAccent.color,
                inactiveColor: AppColors.accent.color,
                value: _sliderValue,
                min: 0.0,
                max: _audioDuration.inMilliseconds.toDouble(),
                onChanged: (newValue) {
                  setState(() {
                    setState(() {
                      _sliderValue = newValue;
                      _formattedDuration =
                          _sliderValueFormatDuration(_sliderValue);
                    });
                  });
                },
                onChangeEnd: (newValue) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formattedDuration,
                    style: TextStyle(
                        fontSize: sizeInspector(maxWidth * 0.033),
                        fontFamily: AppFonts.colombia.font,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    _formatDuration(_audioDuration),
                    style: TextStyle(
                        fontSize: sizeInspector(maxWidth * 0.033),
                        fontFamily: AppFonts.colombia.font,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButtonWidget(iconData: Icons.fast_rewind, onPressed: () {}),
            Container(
              height: sizeInspector(maxWidth * 0.09),
              width: sizeInspector(maxWidth * 0.09),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black),
              child: IconButtonWidget(
                  iconData: Icons.play_arrow,
                  color: AppColors.white.color,
                  onPressed: () {}),
            ),
            IconButtonWidget(iconData: Icons.fast_forward, onPressed: () {}),
          ],
        ),
        SizedBox(
          height: sizeInspector(maxWidth * 0.02),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: Container(
            height: sizeInspector(maxWidth * 0.03),
            decoration: BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(color: AppColors.accent.color, width: 1))),
          ),
        ),
        _builActionButtons()
      ],
    );
  }

  Widget _builActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButtonWidget(
            iconData: Icons.repeat,
            color: AppColors.accent.color,
            onPressed: () {}),
        IconButtonWidget(
            iconData: Icons.favorite_border_outlined,
            color: AppColors.accent.color,
            onPressed: () {}),
        IconButtonWidget(
            iconData: Icons.shuffle,
            color: AppColors.accent.color,
            onPressed: () {}),
      ],
    );
  }

  Widget _buildImageSection(SongDetail? songInfo) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: maxHeight / 2,
      width: maxWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(maxWidth / 2),
          bottomRight: Radius.circular(maxWidth / 2),
        ),
        child: Image.network(
          songInfo?.header_image_url ??
              'https://static.dezeen.com/uploads/2020/06/architects-designers-racial-justice-george-floyd-protests-dezeen-sq-a.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  String _sliderValueFormatDuration(double sliderValue) {
    Duration duration = Duration(milliseconds: sliderValue.toInt());
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);
    String formattedDuration =
        '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    return formattedDuration;
  }
}

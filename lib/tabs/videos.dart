import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoTab extends StatefulWidget {
  const VideoTab({Key? key}) : super(key: key);

  @override
  State<VideoTab> createState() => _VideoTabState();
}

class _VideoTabState extends State<VideoTab> {
  String? videoPath;

  VideoPlayerController? controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // controller!.dispose();
    super.dispose();
  }

  Future pickVideo() async {
    XFile? video;

    video = await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (video != null) {
      videoPath = video.path;
    }


    setState(() {});

    controller = VideoPlayerController.file(File(videoPath!))
      ..initialize().then((_) {
        setState(() {});
      });

    controller!.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: GestureDetector(
          onTap: () {
            pickVideo();
          },
          child: (videoPath != null)
              ? VideoPlayer(controller!)
              : Image.asset(width: 70, 'assets/images/video.png'), //
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
              height: 50,
              color: Colors.black,
              child: Align(
                  alignment: FractionalOffset.center,
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: MaterialButton(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              topRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                            ),
                          ),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          minWidth: double.infinity,
                          color: Colors.yellow,
                          onPressed: () {},
                          child: const Text('SNAPPER LA VIDÉO',
                              style:
                                  TextStyle(fontWeight: FontWeight.bold))))))),
    );
  }
}

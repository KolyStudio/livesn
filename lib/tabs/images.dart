import 'package:flutter/material.dart';
import '../imagecontainer.dart';
import 'package:flutter/widgets.dart';

class ImageTab extends StatefulWidget {
  const ImageTab({Key? key}) : super(key: key);

  @override
  State<ImageTab> createState() => _ImageTabState();
}

class _ImageTabState extends State<ImageTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Container(
          color: Colors.black87,
          child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    mainAxisExtent: 200),
                children: const [
                  ImageContainer(id: "1"),
                  ImageContainer(id: "2"),
                  ImageContainer(id: "3"),
                  ImageContainer(id: "4"),
                ],
              )),
        ));
  }
}

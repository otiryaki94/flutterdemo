import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http_get_post/widgets/video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:open_file/open_file.dart';

class AracimiTaniyalim extends StatefulWidget {
  _AracimiTaniyalimStatefulWidgetState createState() => _AracimiTaniyalimStatefulWidgetState ();
}

class _AracimiTaniyalimStatefulWidgetState  extends State<AracimiTaniyalim> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(child: VideoPlayerWidget()),
            Center(
              child: Text("Otokar sürdürülebilirlik stratejisi, yerli sermaye yapısı ve karlılığın korunması hedefinde çevreye, insana ve topluma duyarlığı ve iş etiği ilkelerine bağlığı,müşteri memnuniyetine odaklanmayı ve yüksek teknolojiye dayalı, katma değerli ürünler geliştirmeyi ana eksen olarak kabul etmektedir."),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Text('Bilgi dökümanı'),
                    onPressed: (){
                      OpenFile.open("sdcard/deneme.pptx");
                    },
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  
}
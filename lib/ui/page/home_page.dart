import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/provider/provider_widget.dart';
import 'package:flutter_base/view_model/home_model.dart';
import 'package:flutter_base/model/banner.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dubbing-配音'),
      ),
      body: Container(
        child: BannerWidget(),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 16 / 9,
        child: DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: ProviderWidget<HomeModel>(
              model: HomeModel(),
              onModelReady: (model)=> model.initData(),
              builder: (context, homeModel, child) {
                if (homeModel.busy) {
                  return CupertinoActivityIndicator();
                } else {
                  DBanner banner = homeModel.list[0];
                  return Image.network(banner.imagePath);
                }
              },
            )));
  }
}

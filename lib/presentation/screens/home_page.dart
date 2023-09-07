import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_project/core/app_colors.dart';
import 'package:web_project/core/app_dimensions.dart';
import 'package:web_project/presentation/bloc/web_bloc.dart';
import 'package:web_project/utils/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? offset;
  final appBarSize = 80.0;
  final zeroOpacityOffset = 0;
  ScrollController controller = ScrollController();
  late final appBarHeight;

  double get opacity {
    if (offset == null) {
      return 0;
    } else {
      if (appBarSize == zeroOpacityOffset) {
        return 1;
      } else if (appBarSize > zeroOpacityOffset) {
        // fading in
        if (offset! <= zeroOpacityOffset) {
          return 0;
        } else if (offset! >= appBarSize) {
          return 1;
        } else {
          return (offset! - zeroOpacityOffset) /
              (appBarSize - zeroOpacityOffset);
        }
      } else {
        // fading out
        if (offset! <= appBarSize) {
          return 1;
        } else if (offset! >= zeroOpacityOffset) {
          return 0;
        } else {
          return (offset! - appBarSize) / (zeroOpacityOffset - appBarSize);
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      appBarHeight = (MediaQuery.of(context).size.height * 0.38);
      Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        if (controller.hasClients) {
          offset = controller.offset;
          controller.addListener(_setOffset);
        }
      });
    });
  }

  void _setOffset() {
    setState(() {
      offset = controller.offset;
    });
  }

  @override
  dispose() {
    controller.removeListener(_setOffset);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            controller: controller,
            children: [
              FirstTwoPages(),
              Container(
                height: MediaQuery.of(context).size.height * 0.67,
                color: Colors.redAccent,
              ),
            ],
          ),
          CustomAppBar(
            opaque: opacity,
          ),
        ],
      ),
    );
  }
}

class FirstTwoPages extends StatelessWidget {
  const FirstTwoPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebBloc, WebState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: state.themeData == ThemeData.light()
                      ? AppColors.backgroundLight
                      : AppColors.backgroundDark,
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          "WELCOME",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: Image.asset(
                            'assets/images/my_image.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Material(
                color: Colors.white,
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    16.0,
                  ),
                ),
                child: SizedBox(
                  height: AppDimens.size.height / 2,
                  width: AppDimens.size.width / 1.2,
                  child: Row(
                    children: [],
                  ),
                ),
              ),
            ),
          ],
        );
      },
      listener: (context, state) {},
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_project/core/app_colors.dart';
import 'package:web_project/presentation/bloc/web_bloc.dart';

import '../core/app_svgs.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.opaque = 0.0,
  }) : super(key: key);

  final double opaque;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WebBloc, WebState>(builder: (context, state) {
      return Stack(
        children: [
          Opacity(
            opacity: opaque,
            child: Material(
              color: state.themeData == ThemeData.light()
                  ? AppColors.appBarColorLight
                  : AppColors.backgroundDark,
              elevation: 0.0,
              child: const Padding(
                padding: EdgeInsets.all(40.0),
                child: Row(
                  children: [],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: CustomWidget(),
                ),
                const Expanded(
                  flex: 2,
                  child: LinkRow(),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppSvgs.github(),
                      const SizedBox(
                        width: 20,
                      ),
                      AppSvgs.twitter(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: InkWell(
                      onTap: () {
                        context
                            .read<WebBloc>()
                            .add(ToggleThemeEvent(state.themeData));
                      },
                      child: state.themeData == ThemeData.light()
                          ? SizedBox(
                              width: 30,
                              height: 30,
                              child: AppSvgs.light(),
                            )
                          : SizedBox(
                              width: 20,
                              height: 20,
                              child: AppSvgs.dark(),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class CustomWidget extends StatelessWidget {
  const CustomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 20,
          width: 8,
          decoration: BoxDecoration(
            color: AppColors.activeColor,
            borderRadius: BorderRadius.circular(2.0),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        const Text(
          "Chimdike Nnacheta",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class LinkRow extends StatelessWidget {
  const LinkRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppBarLinks("Home"),
        AppBarLinks("Services"),
        AppBarLinks("Apps"),
        AppBarLinks("Blog"),
        AppBarLinks("Contact Me"),
      ],
    );
  }
}

class AppBarLinks extends StatefulWidget {
  const AppBarLinks(
    this.text, {
    super.key,
    this.onClicked,
  });
  final String text;
  final Function()? onClicked;

  @override
  State<AppBarLinks> createState() => _AppBarLinksState();
}

class _AppBarLinksState extends State<AppBarLinks> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WebBloc, WebState>(builder: (context, state) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: () => widget.onClicked,
          onHover: (val) {
            setState(() {
              isHovered = val;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              widget.text,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: !isHovered
                        ? state.themeData == ThemeData.light()
                            ? AppColors.appBarColorDark
                            : AppColors.appBarColorLight
                        : AppColors.activeColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      );
    });
  }
}

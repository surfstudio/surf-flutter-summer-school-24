import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_summer_school_24/features/tape/bloc/tape_bloc.dart';
import 'package:surf_flutter_summer_school_24/features/tape/widgets/widgets.dart';
import 'package:surf_flutter_summer_school_24/router/router.dart';

@RoutePage()
class TapeScreen extends StatefulWidget {
  const TapeScreen({super.key});

  @override
  State<TapeScreen> createState() => _TapeScreenState();
}

class _TapeScreenState extends State<TapeScreen> {
  @override
  void initState() {
    super.initState();
    final tapeBloc = BlocProvider.of<TapeBloc>(context);
    tapeBloc.add(const TapeInit(path: ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.background,
        onRefresh: () async {
          await _refreshScreen(context);
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 50,
              centerTitle: true,
              title: Image.asset('./assets/images/logo.png',
                  color: Theme.of(context).colorScheme.primary
                ),
              leading: IconButton(
                onPressed: () {
                  context.router.push(const CameraViewRoute());
                },
                icon: SvgPicture.asset(
                  './assets/icons/camera.svg',
                  width: 32,
                  height: 32,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    _showBottomSheet();
                  },
                  icon: SvgPicture.asset(
                    './assets/icons/points.svg',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SliverPadding(padding: EdgeInsets.all(8.0), sliver: ImageBox()), // ImageBox должен возвращать Sliver
          ],
        ),
      )
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.4,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Column(
                children: [
                  SizedBox(height: 15),
                  ThemeButton(),
                  SizedBox(height: 10),
                  UploadButton()
                ],
              ),
            ),
          );
        }
      );
  }

  Future<void> _refreshScreen(BuildContext context) async {
    final tapeBloc = BlocProvider.of<TapeBloc>(context);
    final completer = Completer<void>();
    tapeBloc.add(
      TapeInit(
        completer: completer,
        path: ''
      )
    );
    await completer.future;
  }
}


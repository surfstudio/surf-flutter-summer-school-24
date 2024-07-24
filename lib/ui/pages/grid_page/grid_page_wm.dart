import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/data/repositiry/mock_image_repository.dart';
import 'package:surf_flutter_summer_school_24/entity/image_entity.dart';
import 'package:surf_flutter_summer_school_24/ui/pages/carusel_page/carusel_page_widget.dart';
import 'package:surf_flutter_summer_school_24/ui/pages/grid_page/grid_page_model.dart';
import 'package:surf_flutter_summer_school_24/ui/pages/grid_page/grid_page_widget.dart';

class GridPageWM extends WidgetModel<GridPageScreen, GridPageModel> {
  ValueListenable<List<ImageEntity>> get images => model.images;

  GridPageWM(super.model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  void openCarousel() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CarouselPageScreen(),
      ),
    );
  }
}

GridPageWM createGridPageWM(BuildContext context) => GridPageWM(
      GridPageModel(
        MockImageRepository(),
      ),
    );

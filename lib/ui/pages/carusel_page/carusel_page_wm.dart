import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/data/repositiry/mock_image_repository.dart';
import 'package:surf_flutter_summer_school_24/entity/image_entity.dart';
import 'package:surf_flutter_summer_school_24/ui/pages/carusel_page/carusel_page_widget.dart';
import 'package:surf_flutter_summer_school_24/ui/pages/carusel_page/сarousel_page_model.dart';

class CarouselPageWM
    extends WidgetModel<CarouselPageScreen, CarouselPageModel> {
  ValueListenable<List<ImageEntity>> get images => model.images;

  CarouselPageWM(CarouselPageModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }
}

CarouselPageWM createCarouselPageWM(BuildContext context) => CarouselPageWM(
      CarouselPageModel(
        MockImageRepository(),
      ),
    );

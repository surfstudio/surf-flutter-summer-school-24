import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UploadButton extends StatelessWidget {
  const UploadButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
      onPressed: () {},
      child: Container(
          width: double.infinity,
          height: 50,
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  SvgPicture.asset('./assets/icons/upload.svg'),
                  const SizedBox(width: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Загрузить фото...',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}

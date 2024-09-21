import 'package:flutter/material.dart';
import 'package:giphyapp/app/utils/app_constant/app_colors.dart';
import 'package:giphyapp/app/services/app_language.dart';
import 'package:giphyapp/app/services/language_service.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key, this.usePopUp = false});
  final bool usePopUp;

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {

  AppLanguage language = AppLanguage.english;

  @override
  void initState() {
    language = AppLanguageService.lang;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if(widget.usePopUp)PopupMenuButton(
          color: AppColors.purpleColors,
          icon: const Icon(Icons.language),
          onSelected: (AppLanguage? appLanguage){
            log.d("Selected Language through pop up is ${appLanguage?.language} and code is ${appLanguage?.code}");
          },
          // style: ButtonStyle(elevation: WidgetStateProperty.all(20)),
          popUpAnimationStyle: AnimationStyle(curve: Curves.slowMiddle),
          itemBuilder: (BuildContext context) {
            return AppLanguage.values.map<PopupMenuItem<AppLanguage>>((AppLanguage language)  {
              return PopupMenuItem<AppLanguage>(
                onTap: (){
                  AppLanguageService.services.changeLanguage(language: language);
                  // AppLanguageService.services.directChange(language: language);
                },
                value: language,
                child: Text(language.language),
              );
            }).toList();
          },
        ),
        if(!widget.usePopUp)Flexible(
          child: InputDecorator(
            decoration: InputDecoration(
                constraints: const BoxConstraints(
                    maxWidth: 104
                ),
                contentPadding: const EdgeInsetsDirectional.only(start: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)
                )
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<AppLanguage>(
                dropdownColor: AppColors.purpleColors,
                value: language,
                elevation: 10,
                onChanged: (AppLanguage? newLanguage) {
                  if(newLanguage != null) {
                    // AppLanguageService.services.directChange(language: language);
                    AppLanguageService.services.changeLanguage(language: newLanguage);
                    setState(() {
                      language = newLanguage;
                    });
                  }
                },
                items: AppLanguage.values.map<DropdownMenuItem<AppLanguage>>((AppLanguage language) {
                  return DropdownMenuItem<AppLanguage>(
                    value: language,
                    child: SizedBox(
                        width: 65,
                        child: Text(language.language,
                          overflow: TextOverflow.clip,
                        )
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
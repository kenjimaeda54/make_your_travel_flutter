import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:make_your_food/constants/constants_environment.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:make_your_food/screens/home/widget/show_gallery_camera.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apiKey = dotenv.env[environmentApiKey];
    final focusTextMessage = useFocusNode();

    return GestureDetector(
      onTap: () => focusTextMessage.unfocus(),
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: SafeArea(
            top: false,
            left: false,
            right: false,
            bottom: true,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(apiKey ?? ""),
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              showModalBottomSheet<void>(
                                  context: context,
                                  enableDrag: true,
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return const ShowGalleryCamera();
                                  });
                            },
                            child: Image.asset(
                              "assets/images/clip.png",
                              width: 25,
                              height: 25,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextField(
                              autocorrect: false,
                              focusNode: focusTextMessage,
                              textInputAction: TextInputAction.done,
                              maxLines: null,
                              cursorColor:
                                  Theme.of(context).colorScheme.primary,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  hintText: "Message",
                                  hintStyle: TextStyle(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.3),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 17),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  filled: true,
                                  fillColor:
                                      Theme.of(context).colorScheme.secondary),
                            ),
                          ),
                          Image.asset(
                            "assets/images/microphone.png",
                            width: 25,
                            height: 25,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ],
                      ))
                ]),
          )),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adcanced_usecase/image_picker/life_cycle_mixin.dart';
import 'package:flutter_adcanced_usecase/image_picker/permission_check.dart';
import 'package:flutter_adcanced_usecase/image_picker/pick_manager.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerView extends StatefulWidget {
  const ImagePickerView({super.key});

  @override
  State<ImagePickerView> createState() => _ImagePickerViewState();
}

class _ImagePickerViewState extends State<ImagePickerView>
    with WidgetsBindingObserver, LifeCycleMixin {
  XFile? image;
  final IPickManager pickImage = PickManager();
  bool? _latestResultPermission;

  @override
  void initState() {
    super.initState();
    _chechkPhotoAccess();
  }

  Future<void> _chechkPhotoAccess() async {
    _latestResultPermission =
        await ApplicationPermission().chechkMediaLibrary();
    setState(() {});
  }

  /*  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch(state){
      case AppLifecycleState.detached:
      case AppLifecycleState.resumed:
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
    }
  } */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          SwitchListTile(
            value: _latestResultPermission ?? false,
            onChanged: (value) {},
          ),
          ElevatedButton.icon(
              onPressed: () async {
                final model = await pickImage.fetchMediaImage();
                setState(() {
                  image = model?.file;
                });
              },
              icon: const Icon(Icons.add_a_photo_outlined),
              label: const Text('Select a new photo')),
          FutureBuilder(
            future: image?.readAsBytes(),
            builder: (context, AsyncSnapshot<Uint8List> snapshot) {
              if (snapshot.hasData) {
                return Image.memory(snapshot.data!);
              }
              return const SizedBox();
            },
          )
        ]),
      ),
    );
  }

  @override
  void onResume() {
    print('on resume call');
  }
}

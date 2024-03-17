import 'package:dating_app/blocs/onboarding/onboarding_bloc.dart';
import 'package:dating_app/repositories/storage/storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CustomImageContainer extends StatelessWidget {
  final TabController? tabController;
  final String? imageUrl;

  const CustomImageContainer({super.key, this.tabController, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 10),
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border(
              bottom:
                  BorderSide(color: Theme.of(context).primaryColor, width: 1),
              left: BorderSide(color: Theme.of(context).primaryColor, width: 1),
              right:
                  BorderSide(color: Theme.of(context).primaryColor, width: 1),
              top: BorderSide(color: Theme.of(context).primaryColor, width: 1)),
        ),
        child: imageUrl == null
            ? Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    onPressed: () async {
                      ImagePicker _picker = ImagePicker();
                      final XFile? image =
                          await _picker.pickImage(source: ImageSource.gallery);

                      if (image == null) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Fotoğraf seçilmedi'),
                        ));
                      } else {
                        print('uploading..');
                        // ignore: use_build_context_synchronously
                        context
                            .read<OnboardingBloc>()
                            .add(UpdateUserImages(image: image));
                      }
                    },
                    icon: Icon(Icons.add_circle, color: Colors.redAccent)))
            : Image.network(
                imageUrl!,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:social_app/features/auth/controller/auth_controller.dart';
import 'package:social_app/features/timeline/controller/timeline_controller.dart';

import '../../../core/common/loader.dart';
import '../../../theme/pallete.dart';
import '../../timeline/screens/widgets/post.dart';

class RandomProfilePage extends ConsumerWidget {
  final String id;
  const RandomProfilePage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: ref.watch(getUserDataProvider(id)).when(
            data: (data) {
              return SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: const Image(
                                  image:
                                      AssetImage("assets/images/profile.jpg"),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Palette.primary,
                              ),
                              child: const Icon(
                                LineAwesomeIcons.alternate_pencil,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text("Ali",
                          style: TextStyle(color: Palette.white, fontSize: 28)),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Palette.primary,
                                ),
                                child: const Center(
                                  child: Text(
                                    "Follow",
                                    style: TextStyle(
                                      color: Palette.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Palette.primary),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Message",
                                    style: TextStyle(
                                      color: Palette.primary,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "0",
                                style: const TextStyle(
                                  color: Palette.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                "Posts",
                                style: TextStyle(color: Palette.white),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "0",
                                style: const TextStyle(
                                  color: Palette.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                "Followers",
                                style: TextStyle(color: Palette.white),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "0",
                                style: const TextStyle(
                                  color: Palette.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                "Following",
                                style: TextStyle(color: Palette.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: Palette.primary,
                        thickness: 1,
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ref.watch(postsByUserIdProvider(id)).when(
                              data: (data) {
                                return ListView.builder(
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    return Post(
                                      path: "profile",
                                      outside: true,
                                      post: data[index],
                                    );
                                  },
                                );
                              },
                              error: (e, s) => Text('$s'),
                              loading: () => const Loader(),
                            ),
                      ),
                    ],
                  ),
                ),
              );
            },
            loading: () => const Center(child: Loader()),
            error: (error, stack) => const Center(
              child: Text("Error"),
            ),
          ),
    );
  }
}

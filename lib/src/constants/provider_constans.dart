// import 'authentication_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_gallery/src/features/gallery/data/gallery_provider.dart';

import '../features/login/data/authentication_provider.dart';


final authProvider = ChangeNotifierProvider<AuthenticationProvider>(
    (ref) => AuthenticationProvider());
final galleryProvider = ChangeNotifierProvider<GalleryProvider>(
    (ref) => GalleryProvider());

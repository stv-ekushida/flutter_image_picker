# flutter_image_picker

Image Picker

## iOS

info.plist
```
	<key>NSPhotoLibraryUsageDescription</key>
	<string>写真へアクセスするために利用します。</string>
	<key>NSCameraUsageDescription</key>
	<string>写真を撮影するために利用します。</string>
	<key>NSMicrophoneUsageDescription</key>
	<string>音声を録音するために利用します。</string>
```

## Flutter 

```
import 'package:image_picker/image_picker.dart';

File image = await ImagePicker.pickImage(source: ImageSource.gallery);

```

### カメラとギャラリー

```
enum ImageSource {
  camera,
  gallery,
}
```

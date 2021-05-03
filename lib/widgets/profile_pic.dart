import 'package:bikesafe_mobile/utilities/theme/color_scheme.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  final String urlImage;
  final double rad;
  final double border;

  ProfilePic({this.urlImage = "", this.rad = 100, this.border = 5});
  Widget build(BuildContext context) {
    return CircularProfileAvatar(
      urlImage, //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
      radius: rad, // sets radius, default 50.0
      backgroundColor:
          Colors.transparent, // sets background color, default Colors.white
      borderWidth: border, // sets border, default 0.0
      initialsText: Text(
        "AD",
        style: TextStyle(fontSize: 40, color: Colors.white),
      ), // sets initials text, set your own style, default Text('')
      borderColor:
          DeepBlueColorScheme.gray, // sets border color, default Colors.white
      elevation:
          5.0, // sets elevation (shadow of the profile picture), default value is 0.0
      foregroundColor: DeepBlueColorScheme.gray.withOpacity(
          0.5), //sets foreground colour, it works if showInitialTextAbovePicture = true , default Colors.transparent
      cacheImage: true, // allow widget to cache image against provided url
      onTap: () {
        print('adil');
      }, // sets on tap
      showInitialTextAbovePicture:
          true, // setting it true will show initials text above profile picture, default false
    );
  }
}

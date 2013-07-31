# CRNInitialsImageView

A subclass of UIImageView that displays the initials of a user within either a circle or rounded rect.

This class is great to use as a default avatar for a user/social-based application, similar to the way the iOS 7 Phone.app creates a circle avatar with the user's initials on the Favorites tab, or the Gmail.app does with rounded rects.

CRNInitialsImageView is tested on iOS 6 and 7, and requires ARC. Released under the [MIT license](LICENSE).

## Example

<img src="http://i.imgur.com/P5sWYVP.png" width=320 height=568 alt="CRNInitialsImageView example screenshot">

Open up the included Xcode project for an example app.

## Usage

``` objc
 CRNInitialsImageView *crnImageView = [[CRNInitialsImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
 crnImageView.initialsBackgroundColor = [UIColor grayColor];
 crnImageView.initialsTextColor = [UIColor whiteColor];
 crnImageView.initialsFont = [UIFont fontWithName:@"HelveticaNeue" size:18];
 crnImageView.useCircle = TRUE;
 crnImageView.firstName = @"Bruce";
 crnImageView.lastName = @"Wayne";
 [crnImageView drawImage];
```

## Installation

Simply add the files in the `CRNInitialsImageView.h` and `CRNInitialsImageView.m` to your project.
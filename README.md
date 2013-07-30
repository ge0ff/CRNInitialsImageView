# CRNInitialsImageView

A subclass of UIImageView that displays the initials of a user within either a circle or rounded rect.

This class is great to use as a default avatar for a user/social-based application, similar to the way the iOS 7 Phone.app creates a circle user initials avatar on the Favorites tab, or the Gmail.app does with rounded rects.

![Example screenshot](http://i.imgur.com/P5sWYVP.png)

Usage:
``` objective-c
 CRNInitialsImageView *crnImageView = [[CRNInitialsImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
 crnImageView.initialsBackgroundColor = [UIColor grayColor];
 crnImageView.initialsTextColor = [UIColor whiteColor];
 crnImageView.initialsFont = [UIFont fontWithName:@"HelveticaNeue" size:18];
 crnImageView.useCircle = TRUE;
 crnImageView.firstName = @"Bruce";
 crnImageView.lastName = @"Wayne";
 [crnImageView drawImage];
```

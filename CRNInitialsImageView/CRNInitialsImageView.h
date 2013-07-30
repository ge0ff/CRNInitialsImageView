//
//  CRNInitialsImageView.h
//  CRNInitialsImageView
//
//  Created by Geoff Cornwall on 7/17/13.
//  Copyright (c) 2013 Geoff Cornwall. All rights reserved.
//

@interface CRNInitialsImageView : UIImageView

@property (nonatomic) BOOL useGrey;
@property (nonatomic) BOOL useCircle;
@property (nonatomic) NSString *firstName;
@property (nonatomic) NSString *lastName;
@property (nonatomic) CGFloat radius;
@property (nonatomic) UIColor *initialsBackgroundColor;
@property (nonatomic) UIColor *initialsTextColor;
@property (nonatomic) UIFont *initialsFont;

- (void)drawImage;

@end

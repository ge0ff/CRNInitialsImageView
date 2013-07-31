//
//  CRNInitialsImageView.m
//  CRNInitialsImageView
//
//  Created by Geoff Cornwall on 7/17/13.
//  Copyright (c) 2013 Geoff Cornwall. All rights reserved.
//

#import "CRNInitialsImageView.h"

@implementation CRNInitialsImageView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _useCircle = FALSE;
        _useGrey = TRUE;
        _radius = 5.0;
        _initialsBackgroundColor = [UIColor lightGrayColor];
        _initialsTextColor = [UIColor whiteColor];
        _initialsFont = [UIFont systemFontOfSize:10];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawImage {
    if (_useCircle) {
        [self drawCircle];
    }
    else {
        [self drawRoundedRect];
    }
    
    [self addText];
}

- (void)drawCircle {
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, _initialsBackgroundColor.CGColor);
    CGContextFillEllipseInRect(context, self.frame);
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
}

- (void)drawRoundedRect {
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, _initialsBackgroundColor.CGColor);
    CGContextSetFillColorWithColor(context, _initialsBackgroundColor.CGColor);
    CGFloat minx = CGRectGetMinX(self.frame), midx = CGRectGetMidX(self.frame), maxx = CGRectGetMaxX(self.frame);
    CGFloat miny = CGRectGetMinY(self.frame), midy = CGRectGetMidY(self.frame), maxy = CGRectGetMaxY(self.frame);
    CGContextMoveToPoint(context, minx, midy);
    CGContextAddArcToPoint(context, minx, miny, midx, miny, _radius);
    CGContextAddArcToPoint(context, maxx, miny, maxx, midy, _radius);
    CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, _radius);
    CGContextAddArcToPoint(context, minx, maxy, minx, midy, _radius);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
}

- (void)addText {
    NSString *initials = [self createInitials];
    
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    NSAttributedString *initialsString = [[NSAttributedString alloc] initWithString:initials
                                                                         attributes:@{NSFontAttributeName:_initialsFont, NSForegroundColorAttributeName:_initialsTextColor, NSParagraphStyleAttributeName:paragraphStyle}];
    
    UIGraphicsBeginImageContextWithOptions(self.image.size, NO, 0.0f);
    
    [self.image drawAtPoint:CGPointMake(0.0f, 0.0f)];
    CGFloat fontHeight = _initialsFont.lineHeight;
    CGFloat yOffset = (self.frame.size.height - fontHeight) / 2.0;
    [initialsString drawInRect:CGRectMake(self.frame.origin.x, yOffset, self.frame.size.width, self.frame.size.height)];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    self.image = result;
    
    UIGraphicsEndImageContext();
    
}

- (NSString *)createInitials {
    NSMutableString *initials = [[NSMutableString alloc]initWithString:[_firstName substringToIndex:1]];
    [initials appendString:[_lastName substringToIndex:1]];
    
    return initials;
}


@end

//
//  WAwesomeMenuItem.h
//  yxx
//
//  Created by w-002 on 14-5-10.
//  Copyright (c) 2014年 w-002. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WAwesomeMenuItemDelegate;

@interface WAwesomeMenuItem : UIView
{
    UIImageView *_contentImageView;
    UILabel *_titleLabel;
    
    UIImage *_image;
    UIImage *_highlightedImage;
    
    CGPoint _startPoint;
    CGPoint _endPoint;
    CGPoint _nearPoint; // near
    CGPoint _farPoint; // far
    
    
    id<WAwesomeMenuItemDelegate> __weak _delegate;
}





@property (nonatomic, strong, readonly) UIImageView *contentImageView;
@property (nonatomic, strong, readonly) UILabel *titleLabel;

@property (nonatomic, strong)UIImage *image;
@property (nonatomic, strong)UIImage *highlightedImage;

@property (nonatomic) CGPoint startPoint;
@property (nonatomic) CGPoint endPoint;
@property (nonatomic) CGPoint nearPoint;
@property (nonatomic) CGPoint farPoint;

@property (nonatomic, weak) id<WAwesomeMenuItemDelegate> delegate;

- (id)initWithImage:(UIImage *)img
   highlightedImage:(UIImage *)himg
       ContentImage:(UIImage *)cimg
highlightedContentImage:(UIImage *)hcimg
       titleContent:(NSString*)title;


@end

@protocol WAwesomeMenuItemDelegate <NSObject>
- (void)AwesomeMenuItemTouchesBegan:(WAwesomeMenuItem *)item;
- (void)AwesomeMenuItemTouchesEnd:(WAwesomeMenuItem *)item;
@end

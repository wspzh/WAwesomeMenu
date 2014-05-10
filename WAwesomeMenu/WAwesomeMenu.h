//
//  WAwesomeMenu.h
//  yxx
//
//  Created by w-002 on 14-5-10.
//  Copyright (c) 2014年 w-002. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WAwesomeMenuItem.h"

@protocol WAwesomeMenuDelegate;



@interface WAwesomeMenu : UIView<WAwesomeMenuItemDelegate>

@property (nonatomic, copy) NSArray *menusArray;
@property (nonatomic, getter = isExpanding) BOOL expanding;
@property (nonatomic, weak) id<WAwesomeMenuDelegate> delegate;

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *highlightedImage;
@property (nonatomic, strong) UIImage *contentImage;
@property (nonatomic, strong) UIImage *highlightedContentImage;

@property (nonatomic, assign) CGFloat nearRadius;
@property (nonatomic, assign) CGFloat endRadius;
@property (nonatomic, assign) CGFloat farRadius;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGFloat timeOffset;
@property (nonatomic, assign) CGFloat rotateAngle;
@property (nonatomic, assign) CGFloat menuWholeAngle;
@property (nonatomic, assign) CGFloat expandRotation;
@property (nonatomic, assign) CGFloat closeRotation;
@property (nonatomic, assign) CGFloat animationDuration;

- (id)initWithFrame:(CGRect)frame startItem:(WAwesomeMenuItem*)startItem optionMenus:(NSArray *)aMenusArray;

@end

@protocol WAwesomeMenuDelegate <NSObject>
- (void)awesomeMenu:(WAwesomeMenu *)menu didSelectIndex:(NSInteger)idx;
@optional
- (void)awesomeMenuDidFinishAnimationClose:(WAwesomeMenu *)menu;
- (void)awesomeMenuDidFinishAnimationOpen:(WAwesomeMenu *)menu;
@end
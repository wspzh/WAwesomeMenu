//
//  WAwesomeMenuItem.m
//  yxx
//
//  Created by w-002 on 14-5-10.
//  Copyright (c) 2014年 w-002. All rights reserved.
//

#import "WAwesomeMenuItem.h"

static inline CGRect ScaleRect(CGRect rect, float n) {return CGRectMake((rect.size.width - rect.size.width * n)/ 2, (rect.size.height - rect.size.height * n) / 2, rect.size.width * n, rect.size.height * n);}



@implementation WAwesomeMenuItem

@synthesize contentImageView=_contentImageView;
@synthesize titleLabel=_titleLabel;

@synthesize image=_image;
@synthesize highlightedImage=_highlightedImage;

@synthesize startPoint = _startPoint;
@synthesize endPoint = _endPoint;
@synthesize nearPoint = _nearPoint;
@synthesize farPoint = _farPoint;
@synthesize delegate  = _delegate;


#pragma mark - initialization & cleaning up
- (id)initWithImage:(UIImage *)img
   highlightedImage:(UIImage *)himg
       ContentImage:(UIImage *)cimg
highlightedContentImage:(UIImage *)hcimg
       titleContent:(NSString*)title
{
    if (self = [super init])
    {
        [self setBackgroundColor:[UIColor orangeColor]];
        self.image = img;
        self.highlightedImage = himg;
        self.userInteractionEnabled = YES;
        _contentImageView = [[UIImageView alloc] initWithImage:cimg];
        _contentImageView.highlightedImage = hcimg;
        [self addSubview:_contentImageView];
        
        _titleLabel =[[UILabel alloc]init];
        _titleLabel.text=title;
        _titleLabel.font=[UIFont systemFontOfSize:14];
        _titleLabel.backgroundColor=[UIColor clearColor];
        _titleLabel.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
    }
    return self;
}

#pragma mark - UIView's methods
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_titleLabel.text.length>1) {
        self.bounds = CGRectMake(0, 0, self.image.size.width+20, self.image.size.height);
        float width = _contentImageView.image.size.width;
        float height = _contentImageView.image.size.height;
        _contentImageView.frame = CGRectMake(self.bounds.size.width/2 - width/2, self.bounds.size.height/2 - height/2-10, width, height);
        _titleLabel.frame=CGRectMake(0, self.image.size.height-20, self.bounds.size.width, 14);
    }else{
        self.bounds = CGRectMake(0, 0, self.image.size.width+20, self.image.size.height+20);
        
        float width = _contentImageView.image.size.width;
        float height = _contentImageView.image.size.height;
        _contentImageView.frame = CGRectMake(self.bounds.size.width/2 - width/2, self.bounds.size.height/2 - height/2, width, height);
    }
   
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.highlighted = YES;
    if ([_delegate respondsToSelector:@selector(AwesomeMenuItemTouchesBegan:)])
    {
        [_delegate AwesomeMenuItemTouchesBegan:self];
    }
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // if move out of 2x rect, cancel highlighted.
    CGPoint location = [[touches anyObject] locationInView:self];
    if (!CGRectContainsPoint(ScaleRect(self.bounds, 2.0f), location))
    {
        self.highlighted = NO;
    }
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.highlighted = NO;
    // if stop in the area of 2x rect, response to the touches event.
    CGPoint location = [[touches anyObject] locationInView:self];
    if (CGRectContainsPoint(ScaleRect(self.bounds, 2.0f), location))
    {
        if ([_delegate respondsToSelector:@selector(AwesomeMenuItemTouchesEnd:)])
        {
            [_delegate AwesomeMenuItemTouchesEnd:self];
        }
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.highlighted = NO;
}

#pragma mark - instant methods
- (void)setHighlighted:(BOOL)highlighted
{
//    [super setHighlighted:highlighted];
    [_contentImageView setHighlighted:highlighted];
}

@end

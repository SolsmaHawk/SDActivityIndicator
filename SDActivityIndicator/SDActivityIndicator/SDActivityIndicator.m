// SDActivityIndicator.m
//
// Created by John Solsma
// Copyright (c) 2015 SolsmaDev Inc. http://SolsmaDev.com
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
#import "SDActivityIndicator.h"

#define DEFAULT_GREEN_COLOR [UIColor colorWithRed:46.0/255.0 green:205.0/255.0 blue:113.0/255.0 alpha:1]
#define DEFAULT_RED_COLOR [UIColor colorWithRed:231.0/255.0 green:76.0/255.0 blue:60.0/255.0 alpha:1]
#define DEFAULT_YELLOW_COLOR [UIColor colorWithRed:241.0/255.0 green:196.0/255.0 blue:15.0/255.0 alpha:1]
#define DEFAULT_BLUE_COLOR [UIColor colorWithRed:52.0/255.0 green:152.0/255.0 blue:219.0/255.0 alpha:1]
#define DEFAULT_SPEED 1.5

@interface SDActivityIndicator ()
@property BOOL withPulse;
@property BOOL withScale;
@property BOOL withDelay;
@property float speed;
@property (strong,nonatomic) UIImageView *topLeftImageView;
@property (strong,nonatomic) UIImageView *bottomLeftImageView;
@property (strong,nonatomic) UIImageView *topRightImageView;
@property (strong,nonatomic) UIImageView *bottomRightImageView;
@end

@implementation SDActivityIndicator

-(instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame withImages:nil autoRotateImages:NO withPulseAnimation:NO withScaleAnimation:YES withDelay:NO withSpeed:DEFAULT_SPEED];
}
-(instancetype)initWithFrame:(CGRect)frame withPulseAnimation:(BOOL)pulse withScaleAnimation:(BOOL)scale withDelay:(BOOL)delay
{
    return [self initWithFrame:frame withImages:nil autoRotateImages:NO withPulseAnimation:pulse withScaleAnimation:scale withDelay:delay withSpeed:DEFAULT_SPEED];
}
-(instancetype)initWithFrame:(CGRect)frame withColors:(NSArray *)colors withPulseAnimation:(BOOL)pulse withScaleAnimation:(BOOL)scale withDelay:(BOOL)delay withSpeed:(float)speed
{
    return [self initWithFrame:frame withImages:nil withColors:colors autoRotateImages:NO withPulseAnimation:pulse withScaleAnimation:scale withDelay:delay withSpeed:speed];
}
-(instancetype)initWithFrame:(CGRect)frame withImages:(NSArray *)images autoRotateImages:(BOOL)rotate withPulseAnimation:(BOOL)pulse withScaleAnimation:(BOOL)scale withDelay:(BOOL)delay withSpeed:(float)speed
{
    return [self initWithFrame:frame withImages:images withColors:nil autoRotateImages:rotate withPulseAnimation:pulse withScaleAnimation:scale withDelay:delay withSpeed:speed];
}
-(instancetype)initWithFrame:(CGRect)frame withImages:(NSArray *)images withColors:(NSArray *)colors autoRotateImages:(BOOL)rotate withPulseAnimation:(BOOL)pulse withScaleAnimation:(BOOL)scale withDelay:(BOOL)delay withSpeed:(float)speed
{
    _speed=1/speed;
    _withDelay=delay;
    _withPulse=pulse;
    _withScale=scale;
    if((images!=nil && [images count]!=4) || ![self typeCheckArray:images forClass:[UIImage class]])
    {
        NSLog(@"Warning : images array does not contain 4 UIImages. Make sure it contains 4 UIImage objects. Object was not initialized.");
        return nil;
    }
    if((colors!=nil && [colors count]!=4) || ![self typeCheckArray:colors forClass:[UIColor class]])
    {
        NSLog(@"Warning : colors array does not contain 4 UIColors. Make sure it contains 4 UIColor objects. Object was not initialized.");
        return nil;
    }
    if(frame.size.width<15 || frame.size.height<15)
    {
        NSLog(@"Warning : Frame dimensions for SDActivityIndicator cannot be less than 15. Object was not initialized.");
        return nil;
    }
    CGRect indicatorFrame = frame;
    if ((self = [super initWithFrame:frame]))
    {
        if(frame.size.width!=frame.size.height)
        {
            if(frame.size.width>frame.size.height)
            {
                indicatorFrame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.height, frame.size.height);
                self.bottomLeftImageView = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width/2)-(frame.size.height/2), (indicatorFrame.size.height-(indicatorFrame.size.height/2)), indicatorFrame.size.width/2, indicatorFrame.size.height/2)];
                self.bottomRightImageView = [[UIImageView alloc]initWithFrame:CGRectMake((indicatorFrame.size.width-(indicatorFrame.size.width/2))+(frame.size.width/2)-(frame.size.height/2), (indicatorFrame.size.height-(indicatorFrame.size.height/2)), indicatorFrame.size.width/2, indicatorFrame.size.height/2)];
                self.topLeftImageView = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width/2)-(frame.size.height/2), 0, indicatorFrame.size.width/2, indicatorFrame.size.height/2)];
                self.topRightImageView = [[UIImageView alloc]initWithFrame:CGRectMake((indicatorFrame.size.width-(indicatorFrame.size.width/2))+(frame.size.width/2)-(frame.size.height/2), 0, indicatorFrame.size.width/2, indicatorFrame.size.height/2)];
            }
            else
            {
                indicatorFrame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.width);
                self.bottomLeftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, (indicatorFrame.size.height-(indicatorFrame.size.height/2))+frame.size.height/2-frame.size.width/2, indicatorFrame.size.width/2, indicatorFrame.size.height/2)];
                self.bottomRightImageView = [[UIImageView alloc]initWithFrame:CGRectMake((indicatorFrame.size.width-(indicatorFrame.size.width/2)), (indicatorFrame.size.height-(indicatorFrame.size.height/2))+frame.size.height/2-frame.size.width/2, indicatorFrame.size.width/2, indicatorFrame.size.height/2)];
                self.topLeftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, (frame.size.height/2)-(frame.size.width/2), indicatorFrame.size.width/2, indicatorFrame.size.height/2)];
                self.topRightImageView = [[UIImageView alloc]initWithFrame:CGRectMake((indicatorFrame.size.width-(indicatorFrame.size.width/2)), (frame.size.height/2)-(frame.size.width/2), indicatorFrame.size.width/2, indicatorFrame.size.height/2)];
            }
        }
        else
        {
            self.bottomLeftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, (indicatorFrame.size.height-(indicatorFrame.size.height/2)), indicatorFrame.size.width/2, indicatorFrame.size.height/2)];
            self.bottomRightImageView = [[UIImageView alloc]initWithFrame:CGRectMake((indicatorFrame.size.width-(indicatorFrame.size.width/2)), (indicatorFrame.size.height-(indicatorFrame.size.height/2)), indicatorFrame.size.width/2, indicatorFrame.size.height/2)];
            self.topLeftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, indicatorFrame.size.width/2, indicatorFrame.size.height/2)];
            self.topRightImageView = [[UIImageView alloc]initWithFrame:CGRectMake((indicatorFrame.size.width-(indicatorFrame.size.width/2)), 0, indicatorFrame.size.width/2, indicatorFrame.size.height/2)];
        }
        if(images==nil)
        {
            if(colors!=nil)
            {
                self.bottomLeftImageView.image = [self drawCircleWithColor:colors[0] withSize:indicatorFrame.size.height/2];
                self.bottomRightImageView.image = [self drawCircleWithColor:colors[1] withSize:indicatorFrame.size.height/2];
                self.topRightImageView.image = [self drawCircleWithColor:colors[2] withSize:indicatorFrame.size.height/2];
                self.topLeftImageView.image= [self drawCircleWithColor:colors[3] withSize:indicatorFrame.size.height/2];
            }
            else
            {
                self.bottomLeftImageView.image = [self drawCircleWithColor:DEFAULT_GREEN_COLOR withSize:indicatorFrame.size.height/2];
                self.bottomRightImageView.image = [self drawCircleWithColor:DEFAULT_RED_COLOR withSize:indicatorFrame.size.height/2];
                self.topRightImageView.image = [self drawCircleWithColor:DEFAULT_YELLOW_COLOR withSize:indicatorFrame.size.height/2];
                self.topLeftImageView.image= [self drawCircleWithColor:DEFAULT_BLUE_COLOR withSize:indicatorFrame.size.height/2];
            }
        }
        else
        {
            self.topLeftImageView.contentMode = UIViewContentModeScaleAspectFit;
            self.topRightImageView.contentMode = UIViewContentModeScaleAspectFit;
            self.bottomRightImageView.contentMode = UIViewContentModeScaleAspectFit;
            self.bottomLeftImageView.contentMode = UIViewContentModeScaleAspectFit;
            if(rotate)
            {
                self.topLeftImageView.image = images[0];
                self.topRightImageView.image = [self imageRotatedByDegrees:images[1] deg:90];
                self.bottomRightImageView.image = [self imageRotatedByDegrees:images[2] deg:180];
                self.bottomLeftImageView.image = [self imageRotatedByDegrees:images[3] deg:270];
            }
            else
            {
                self.topLeftImageView.image = images[0];
                self.topRightImageView.image = images[1];
                self.bottomRightImageView.image = images[2];
                self.bottomLeftImageView.image = images[3];
            }
        }
        [self addSubview:self.bottomRightImageView];
        [self addSubview:self.bottomLeftImageView];
        [self addSubview:self.topRightImageView];
        [self addSubview:self.topLeftImageView];
    }
    return self;
}
-(UIImage *)drawCircleWithColor:(UIColor *)color withSize:(double)size
{
    CGSize canvasSize = CGSizeMake(size,size);
    CGFloat scale = [UIScreen mainScreen].scale;
    canvasSize.width *= scale;
    canvasSize.height *= scale;
    UIGraphicsBeginImageContext(canvasSize);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 5.0 * scale);
    CGContextSetStrokeColorWithColor(ctx, color.CGColor);
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    CGRect circleRect = CGRectMake( 0, 0, canvasSize.width, canvasSize.height );
    circleRect = CGRectInset(circleRect, 5, 5);
    CGContextFillEllipseInRect(ctx, circleRect);
    CGContextStrokeEllipseInRect(ctx, circleRect);
    CGContextMoveToPoint(ctx, canvasSize.width/2.0, 0);
    CGContextAddLineToPoint(ctx, canvasSize.width/2.0, canvasSize.height);
    CGContextStrokePath(ctx);
    return UIGraphicsGetImageFromCurrentImageContext();
}
-(void)startAnimating
{
    [self startSpin:self];
    if(_withPulse)
    {
        [self applyPulseEffectToView:self.bottomRightImageView];
    }
    if(_withScale)
    {
        [self growAndShrinkView:self.bottomRightImageView from:1 to:0.5];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.25*_speed * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        if(_withPulse)
        {
            [self applyPulseEffectToView:self.topRightImageView];
        }
        if(_withScale)
        {
            [self growAndShrinkView:self.topRightImageView from:1 to:0.5];
        }
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.5*_speed * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        if(_withPulse)
        {
            [self applyPulseEffectToView:self.topLeftImageView];
        }
        if(_withScale)
        {
            [self growAndShrinkView:self.topLeftImageView from:1 to:0.5];
        }
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.75*_speed * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        if(_withPulse)
        {
            [self applyPulseEffectToView:self.bottomLeftImageView];
        }
        if(_withScale)
        {
            [self growAndShrinkView:self.bottomLeftImageView from:1 to:0.5];
        }
    });
}
- (void) startSpin:(UIView *)view
{
    if (!self.isAnimating) {
        self.isAnimating = YES;
        [self spinWithOptions: UIViewAnimationOptionCurveEaseIn withView:view];
    }
}
- (void) spinWithOptions:(UIViewAnimationOptions)options withView:(UIView *)view
{
    float delay;
    float duration;
    if(_withDelay)
    {
        duration = 0;
        delay = (1.0f*_speed);
    }
    else
    {
        duration = _speed;
        delay = 0;
    }
    [UIView animateWithDuration: 0.5f*_speed + duration
                          delay: delay
                        options: options
                     animations: ^{
                         view.transform = CGAffineTransformRotate(view.transform, M_PI / 2);
                     }
                     completion: ^(BOOL finished) {
                         if (finished) {
                             if (self.isAnimating) {
                                 // if flag still set, keep spinning with constant speed
                                 [self spinWithOptions: UIViewAnimationOptionCurveLinear withView:view];
                             } else if (options != UIViewAnimationOptionCurveEaseOut) {
                                 // one last spin, with deceleration
                                 [self spinWithOptions: UIViewAnimationOptionCurveEaseOut withView:view];
                             }
                         }
                     }];
}
-(void)applyPulseEffectToView:(UIView *)view
{
    CABasicAnimation *theAnimation;
    theAnimation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    theAnimation.duration=0.75*_speed;
    // [theAnimation setBeginTime:CACurrentMediaTime()+0.5];
    theAnimation.repeatCount=INFINITY;
    theAnimation.autoreverses=YES;
    theAnimation.fromValue=[NSNumber numberWithFloat:1.0];
    theAnimation.toValue=[NSNumber numberWithFloat:0.1];
    [view.layer addAnimation:theAnimation forKey:@"animateOpacity"]; //myButton.layer instead of
}
-(void)growAndShrinkView:(UIView *)view from:(float)fromValue to:(float)toValue
{
    CABasicAnimation *growAndShrink;
    growAndShrink = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    growAndShrink.duration=0.75*_speed;
    //growAndShrink.tim
    growAndShrink.repeatCount=INFINITY;
    growAndShrink.autoreverses=YES;
    growAndShrink.fromValue=[NSNumber numberWithFloat:fromValue];
    growAndShrink.toValue=[NSNumber numberWithFloat:toValue];
    view.layer.anchorPoint=CGPointMake(0.5, 0.5);
    [view.layer addAnimation:growAndShrink forKey:@"scaleAnimation"];
}
-(void)pauseAnimations
{
    [self pauseLayer:self.layer];
    self.isAnimating=NO;
}
-(void)resumeAnimations
{
    [self resumeLayer:self.layer];
    self.isAnimating=YES;
}
-(void)pauseLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}
-(void)resumeLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}
-(BOOL)typeCheckArray:(NSArray *)array forClass:(Class)classToCheck
{
    for(NSObject *object in array)
    {
        if(![object isKindOfClass:classToCheck])
        {
            return NO;
        }
    }
    return YES;
}
- (UIImage *)imageRotatedByDegrees:(UIImage*)oldImage deg:(CGFloat)degrees{
    UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0,0,oldImage.size.width, oldImage.size.height)];
    CGAffineTransform t = CGAffineTransformMakeRotation(degrees * M_PI / 180);
    rotatedViewBox.transform = t;
    CGSize rotatedSize = rotatedViewBox.frame.size;
    UIGraphicsBeginImageContext(rotatedSize);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    CGContextRotateCTM(bitmap, (degrees * M_PI / 180));
    CGContextScaleCTM(bitmap, 1.0, -1.0);
    CGContextDrawImage(bitmap, CGRectMake(-oldImage.size.width / 2, -oldImage.size.height / 2, oldImage.size.width, oldImage.size.height), [oldImage CGImage]);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end

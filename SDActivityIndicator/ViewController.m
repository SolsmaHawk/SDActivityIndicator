//  ViewController.m
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


#import "ViewController.h"
#import "SDActivityIndicator.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIView *topLeftTopView;
@property (strong, nonatomic) IBOutlet UIView *topLeftBottomView;
@property (strong, nonatomic) IBOutlet UIView *topRightTopView;
@property (strong, nonatomic) IBOutlet UIView *topRightBottomView;

@property (strong, nonatomic) IBOutlet UIView *bottomLeftTopView;
@property (strong, nonatomic) IBOutlet UIView *bottomLeftBottomView;
@property (strong, nonatomic) IBOutlet UIView *bottomRightTopView;
@property (strong, nonatomic) IBOutlet UIView *bottomRightBottomView;

@property NSArray *SDActivityIndicators;
@property (strong, nonatomic) IBOutlet UILabel *websiteLinkLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)onOffButtonSwitched:(id)sender {
    if(((UISwitch *)sender).isOn)
    {
        NSLog(@"Switched on");
        for(SDActivityIndicator *indicator in self.SDActivityIndicators)
        {
            [indicator resumeAnimations];
        }
    }
    else
    {
        NSLog(@"Switched off");
        for(SDActivityIndicator *indicator in self.SDActivityIndicators)
        {
            [indicator pauseAnimations];
        }
    }
}


-(void)viewDidAppear:(BOOL)animated
{
    SDActivityIndicator *indicator0 = [[SDActivityIndicator alloc]initWithFrame:[self shrinkFrame:self.topRightTopView.frame] withImages:nil autoRotateImages:YES withPulseAnimation:NO withScaleAnimation:NO withDelay:NO withSpeed:1.5];
    indicator0.center=self.topRightTopView.center;
    
    SDActivityIndicator *indicator1 = [[SDActivityIndicator alloc]initWithFrame:[self shrinkFrame:self.topLeftBottomView.frame] withPulseAnimation:YES withScaleAnimation:YES withDelay:YES];
    indicator1.center=self.topLeftBottomView.center;
    
    SDActivityIndicator *indicator2 = [[SDActivityIndicator alloc]initWithFrame:[self shrinkFrame:self.topRightTopView.frame] withImages:nil autoRotateImages:YES withPulseAnimation:NO withScaleAnimation:NO withDelay:YES withSpeed:1.5];
    indicator2.center=self.topRightTopView.center;
    
    SDActivityIndicator *indicator3 = [[SDActivityIndicator alloc]initWithFrame:[self shrinkFrame:self.topLeftTopView.frame]];
    indicator3.center=self.topLeftTopView.center;
    
    NSArray *colors=@[[UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor lightGrayColor]];
    
    SDActivityIndicator *indicator4 = [[SDActivityIndicator alloc]initWithFrame:[self shrinkFrame:self.topRightBottomView.frame] withColors:colors withPulseAnimation:YES withScaleAnimation:YES withDelay:NO withSpeed:1.5];
    indicator4.center=self.topRightBottomView.center;
    
    NSArray *arrowImages=@[[UIImage imageNamed:@"arrow.png"],[UIImage imageNamed:@"arrow.png"],[UIImage imageNamed:@"arrow.png"],[UIImage imageNamed:@"arrow.png"]];
    
    SDActivityIndicator *indicator5 = [[SDActivityIndicator alloc]initWithFrame:[self shrinkFrame:self.bottomLeftTopView.frame] withImages:arrowImages autoRotateImages:YES withPulseAnimation:NO withScaleAnimation:YES withDelay:NO withSpeed:1.5];
    indicator5.center=self.bottomLeftTopView.center;
    
    SDActivityIndicator *indicator6 = [[SDActivityIndicator alloc]initWithFrame:[self shrinkFrame:self.bottomRightTopView.frame] withImages:arrowImages autoRotateImages:YES withPulseAnimation:YES withScaleAnimation:NO withDelay:YES withSpeed:1.5];
    indicator6.center=self.bottomRightTopView.center;
    
    NSArray *starImages = @[[UIImage imageNamed:@"star.png"],[UIImage imageNamed:@"star.png"],[UIImage imageNamed:@"star.png"],[UIImage imageNamed:@"star.png"]];
    
    SDActivityIndicator *indicator7 = [[SDActivityIndicator alloc]initWithFrame:[self shrinkFrame:self.bottomRightBottomView.frame] withImages:starImages autoRotateImages:YES withPulseAnimation:YES withScaleAnimation:YES withDelay:NO withSpeed:1.5];
    indicator7.center=self.bottomRightBottomView.center;
    
    SDActivityIndicator *indicator8 = [[SDActivityIndicator alloc]initWithFrame:[self shrinkFrame:self.bottomLeftBottomView.frame] withImages:starImages autoRotateImages:NO withPulseAnimation:NO withScaleAnimation:YES withDelay:YES withSpeed:1.5];
    indicator8.center=self.bottomLeftBottomView.center;
    
    [self.bottomLeftBottomView.superview addSubview:indicator8];
    [self.bottomRightBottomView.superview addSubview:indicator7];
    [self.bottomRightTopView.superview addSubview:indicator6];
    [self.bottomLeftTopView.superview addSubview:indicator5];
    [self.topRightBottomView.superview addSubview:indicator4];
    [self.topLeftTopView.superview addSubview:indicator3];
    [self.topRightTopView.superview addSubview:indicator2];
    [self.topRightTopView.superview addSubview:indicator0];
    [self.topLeftBottomView.superview addSubview:indicator1];
    
    self.SDActivityIndicators = @[indicator1,indicator0,indicator2,indicator3,indicator4,indicator5,indicator6,indicator7,indicator8];
    
    [indicator8 startAnimating];
    [indicator7 startAnimating];
    [indicator6 startAnimating];
    [indicator5 startAnimating];
    [indicator4 startAnimating];
    [indicator3 startAnimating];
    [indicator2 startAnimating];
    [indicator0 startAnimating];
    [indicator1 startAnimating];
}

-(CGRect)shrinkFrame:(CGRect)frame
{
    return CGRectMake(frame.origin.x, frame.origin.y, frame.size.width*0.7, frame.size.height*0.7);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)linkButtonPressed:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://SolsmaDev.com"]];
}

@end


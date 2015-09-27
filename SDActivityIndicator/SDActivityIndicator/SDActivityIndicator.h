// SDActivityIndicator.h
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
#import <UIKit/UIKit.h>
@interface SDActivityIndicator : UIView
/**
 * Initializes a default SDActivityIndicator object
 * @param frame The frame size of the SDActivityIndicator.
 */
-(instancetype)initWithFrame:(CGRect)frame;
/**
 * Initializes a SDActivityIndicator object with the option to specify colors as well as other specified options
 * @param frame The frame size of the SDActivityIndicator.
 * @param images The array of images to build the SDActivityIndicator - must contain 4 UIImages. Images are assembeled starting with the top left image view and index 0 and then assembled clockwise.
 * @param rotate If YES each image starting with the top right and moving clockwise is rotated by, 90, 180, and 270 degrees.
 * @param pulse If YES, each cell will pulse its alpha value.
 * @param scale If YES, each cell will scale down and up continuously.
 * @param delay If YES, the indicator will pause momentarily after each 90 degree rotation.
 * @param speed The speed at which the indicator animates - 1.0 completes one complete rotation every six seconds
 */
-(instancetype)initWithFrame:(CGRect)frame withImages:(NSArray *)images autoRotateImages:(BOOL)rotate withPulseAnimation:(BOOL)pulse withScaleAnimation:(BOOL)scale withDelay:(BOOL)delay withSpeed:(float)speed;
/**
 * Initializes a SDActivityIndicator object with the option to have images and other specified options
 * @param colors The array containing 4 UIColor objects to build the SDActivityIndicator - must contain 4 UIColor objects - if nil, default colors are used.
 * @param pulse If YES, each cell will pulse its alpha value.
 * @param scale If YES, each cell will scale down and up continuously.
 * @param delay If YES, the indicator will pause momentarily after each 90 degree rotation.
 * @param speed The speed at which the indicator animates - 1.0 completes one complete rotation every six seconds
 */
-(instancetype)initWithFrame:(CGRect)frame withColors:(NSArray *)colors withPulseAnimation:(BOOL)pulse withScaleAnimation:(BOOL)scale withDelay:(BOOL)delay withSpeed:(float)speed;
/**
 * Initializes a default SDActivityIndicator with specified animation options
 * @param frame The frame size of the SDActivityIndicator.
 * @param pulse If YES, each cell will pulse its alpha value.
 * @param scale If YES, each cell will scale down and up continuously.
 * @param delay If YES, the indicator will pause momentarily after each 90 degree rotation.
 */
-(instancetype)initWithFrame:(CGRect)frame withPulseAnimation:(BOOL)pulse withScaleAnimation:(BOOL)scale withDelay:(BOOL)delay;
/**
 * A boolean stating if the SDActivityIndicator is currently animating
 */
@property BOOL isAnimating;
/**
 * Start animating the SDActivityIndicator - Run only ONCE. This is not to start animation after a pause - use resumeAnimations for this functionality.
 */
-(void)startAnimating;
/**
 * Pause all animations
 */
-(void)pauseAnimations;
/**
 * Resume all
 */
-(void)resumeAnimations;
@end

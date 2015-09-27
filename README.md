#SDActivityIndicator
###Customizable Activity Indicator

SDActivityIndicator is a simple and flexible iOS class for creating and managing custom activity indicators. It includes a variety of options for controlling how your activity indicator appears and behaves.

![alt tag](http://solsmadev.com/wp-content/uploads/2015/09/sdActivityIndicatorGIF.gif)

## Installation
Simply add `SDActivityIndicator.m` and `SDActivityIndicator.h` to your project.

`import "SDActivityIndicator.h` where appropriate. 
## Usage
SDActivity indicator was built to be simple to use, yet infinitely customizable.

#### Default Initialization

` SDActivityIndicator *indicator = [[SDActivityIndicator alloc]initWithFrame:yourView.frame];`

`[yourView addSubview:indicator];`

`[indicator startAnimating];`

Result: 

![alt tag](http://solsmadev.com/wp-content/uploads/2015/09/sdActivityIndicatorGIF.gif)


#### Customizable initializations

##### With Images

`NSArray *starImages = @[[UIImage imageNamed:@"star.png"],[UIImage imageNamed:@"star.png"],[UIImage imageNamed:@"star.png"],[UIImage imageNamed:@"star.png"]];`
    
`SDActivityIndicator *indicator = [[SDActivityIndicator alloc]initWithFrame:yourView.frame withImages:starImages autoRotateImages:YES withPulseAnimation:YES withScaleAnimation:YES withDelay:NO withSpeed:1.5];`

`[yourView addSubview:indicator];`

`[indicator startAnimating];`

Result:

![alt tag](http://solsmadev.com/wp-content/uploads/2015/09/SDActivityIndicator_stars.gif)

##### With Custom Colors

`NSArray *colors=@[[UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor lightGrayColor]];`
    
`SDActivityIndicator *indicator = [[SDActivityIndicator alloc]initWithFrame:yourView.frame withColors:colors withPulseAnimation:YES withScaleAnimation:YES withDelay:NO withSpeed:1.5];`

`[yourView addSubview:indicator];`

`[indicator startAnimating];`

Result:

![alt tag](http://solsmadev.com/wp-content/uploads/2015/09/SDActivityIndicator_customColors.gif)


##### With Delay

` SDActivityIndicator *indicator = [[SDActivityIndicator alloc]initWithFrame:yourView.frame withPulseAnimation:YES withScaleAnimation:YES withDelay:YES];`

`[yourView addSubview:indicator];`

`[indicator startAnimating];`

Result:

![alt tag](http://solsmadev.com/wp-content/uploads/2015/09/SDActivirtIndicator_delay.gif)

##### Full demo project include

View the demo project included for more examples.

![alt tag](http://solsmadev.com/wp-content/uploads/2015/09/SDActivityIndicator_fullDemoGif.gif)


## Contributing
1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

##License

The MIT License (MIT)

Copyright (c) 2015 John Solsma, SolsmaDev Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

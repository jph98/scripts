Application bundle is created from using XCode
- Icon
- Files with special info
- Images/sounds the app uses

XCode compiles XIB into NIB files

Add a Cocoa UILabel
Define a subclass of UIView and use Quartz font rendering in drawrect
Create a texture mapped font with OpenGL ES
(void viewDidLoad) {
[super viewDidLoad];

//draw "Hello World" using Cocoa UIKit.
//grab the screen dimensions
int w = self.view.frame.size.width;
int h = self.view.frame.size.height;
}

//create a text label: the size 100,50 here is arbitrary
// but it must be large enough to fit the "Hello World" text.
UILabel* label = [[UILabel alloc]
initWithFrame:CGRectMake(0, 0, 100, 50)];

//put the label at the center of the screen
label.center = CGPointMake(w/2, h/2);

//align the text to the center of the label (default is left) label.textAlignment = UITextAlignmentCenter;

//don't draw the label's background (default is white)
label.backgroundColor = [UIColor clearColor];
label.text = @"Hello world!";

//add label to our view, so that it can be rendered
[self.view addSubview:label];

//since we alloc'd label in this method we need to release label here
[label release];

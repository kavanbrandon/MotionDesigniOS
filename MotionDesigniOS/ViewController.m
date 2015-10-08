//
//  ViewController.m
//  MotionDesigniOS
//
//  Created by Kavan Brandon on 9/23/15.
//  Copyright © 2015 Kavan Brandon. All rights reserved.
//

#import "ViewController.h"
#import "JNWSpringAnimation.h"
#import "AppDelegate.h"
#import "Pop.h"
#import "DTCTestButton.h"
#import "DTCHamburgerButton.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *designView;
@property (weak, nonatomic) IBOutlet UIView *overlayView;

- (IBAction)runButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *appBackground;
@property (strong, nonatomic) IBOutlet UIImageView *mapView;
@property (assign) BOOL mapShowing;

@property (assign) BOOL hamburgerOpen;

@property (strong) DTCHamburgerButton *hamburgerButton;
@property (strong) UIView *top;
@property (strong) UIView *middle;
@property (strong) UIView *bottom;

- (void)didTapHamburgerButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    //Do any additional setup after loading the view, typically from a nib.
    self.designView.alpha = 0.0;
    self.overlayView.alpha = 0.0;
    self.appBackground.alpha = 0.0;
    
//    [self setBackgroundAppImage];
//    [self setMapView];
//    [self addMapIcon];
    
//    [self delayedMusicPlayerAnimation];
//    [self animatedTestButtonAnimation];
    [self animatedHamburgerButtonAnimation];
}

- (IBAction)runButton:(id)sender {
    
    //    [self setOverlayViewFrame];
    //    [self setUIAlertViewBounce];
    
    //    [self basicScaleAnimation];
    //    [self animateWithConcat];
    //    [self animateWithDampingSpring];
    
    //    [self animateScaleWithJNWSpringAnimation];
    //    [self animateRotationWithJNWSpringAnimation];
    //    [self animateDampnessAndStiffnessWithJNWSpringAnimation];
    //    [self animateScaleAndRotationJNWSpringAnimation];
    
    //    [self popAnimationSimple];
    //    [self popAnimationMultiple];
    //    [self popAnimationBounciness];
}

-(void)basicScaleAnimation {
    self.designView.alpha = 1.0;
    self.designView.backgroundColor = [UIColor redColor];
    self.designView.layer.cornerRadius = 50;
    [UIView animateWithDuration:.5 delay:0
                        options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            self.designView.transform = CGAffineTransformMakeScale(2.0, 2.0);
                        } completion:NULL];
}

-(void)animateWithConcat {
    self.designView.alpha = 1.0;
    self.designView.backgroundColor = [UIColor redColor];
    self.designView.layer.cornerRadius = 50;
    [UIView animateWithDuration:.5 delay:0
                        options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            self.designView.backgroundColor = [UIColor greenColor];
                            //CGAffineTransformConcat merges multiple animations
                            self.designView.transform = CGAffineTransformConcat(
                                                                                //Make view larger
                                                                                CGAffineTransformMakeScale(2.0, 2.0),
                                                                                //Move 75 pixels to the right
                                                                                CGAffineTransformMakeTranslation(75, 0));
                        } completion:NULL];
}

-(void)animateWithDampingSpring {
    self.designView.alpha = 1.0;
    self.designView.backgroundColor = [UIColor blueColor];
    self.designView.layer.cornerRadius = 50;
    
    //Spring damping is a value between 0 and 1 where 1 simulates an overdamped spring system with no oscillation, and 0 represents an underdamped system with tons of bounciness.
    [UIView animateWithDuration:3 delay:0 usingSpringWithDamping:.3
          initialSpringVelocity:0 options:0 animations:^{
              self.designView.transform = CGAffineTransformMakeTranslation(100, 0);
          } completion:NULL];
}

-(void)animateScaleWithJNWSpringAnimation {
    //Using JNWSpringAnimation to perform scale.
    self.designView.alpha = 1.0;
    self.designView.backgroundColor = [UIColor redColor];
    self.designView.layer.cornerRadius = 50;
    JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
    scale.damping = 13;
    scale.stiffness = 540;
    scale.mass = 11;
    scale.fromValue = @(1.0);
    scale.toValue = @(2.0);;
    
    [self.designView.layer addAnimation:scale forKey:scale.keyPath];
    self.designView.transform = CGAffineTransformMakeScale(2.0, 2.0);
}

/* To start, we defined our JNWSpringAnimation object, a new instance of an animation, and named it scale. We used the designated initializer and passed in a key path of “transform.scale”, but what does that really mean? The key path is simply the property or value which we want to be animated. It’s a property of the view’s underlying CALayer object, which is the thing we’re actually going to be animating here since we’re using a keyframe animation.
 */
-(void)animateRotationWithJNWSpringAnimation {
    //Using JNWSpringAnimation to perform rotation.
    self.designView.alpha = 1.0;
    self.designView.backgroundColor = [UIColor purpleColor];
    self.designView.layer.cornerRadius = 0;
    JNWSpringAnimation *scale =
    [JNWSpringAnimation animationWithKeyPath:@"transform.rotation"];
    scale.damping = 10;
    scale.stiffness = 100;
    scale.mass = 3;
    
    scale.fromValue = @(0);
    scale.toValue = @(M_PI_2);
    
    [self.designView.layer addAnimation:scale forKey:scale.keyPath];
    self.designView.transform = CGAffineTransformMakeRotation(M_PI_2);
}

-(void)animateDampnessAndStiffnessWithJNWSpringAnimation {
    //Using JNWSpringAnimation to perform dampness and stiffness.
    self.designView.alpha = 1.0;
    self.designView.backgroundColor = [UIColor orangeColor];
    self.designView.layer.cornerRadius = 50;
    JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.translation.x"];
    scale.damping = 7;
    scale.stiffness = 7;
    scale.mass = 1;
    
    scale.fromValue = @(-100);
    scale.toValue = @(100);
    
    [self.designView.layer addAnimation:scale forKey:scale.keyPath];
    self.designView.transform = CGAffineTransformMakeTranslation(100, -100);
}

-(void)animateScaleAndRotationJNWSpringAnimation {
    //Animate two components simultaneously
    self.designView.alpha = 1.0;
    self.designView.backgroundColor = [UIColor blueColor];
    JNWSpringAnimation *scale = [JNWSpringAnimation
                                 animationWithKeyPath:@"transform.scale"];
    scale.damping = 9;
    scale.stiffness = 9;
    scale.mass = 1;
    scale.fromValue = @(1);
    scale.toValue = @(2.0);
    
    [self.designView.layer addAnimation:scale forKey:scale.keyPath];
    self.designView.transform = CGAffineTransformScale(self.designView.transform, 2.0, 2.0);
    
    JNWSpringAnimation *rotate = [JNWSpringAnimation
                                  animationWithKeyPath:@"transform.rotation"];
    rotate.damping = 9;
    rotate.stiffness = 9;
    rotate.mass = 1;
    rotate.fromValue = @(0);
    rotate.toValue = @(M_PI);
    
    [self.designView.layer addAnimation:rotate forKey:rotate.keyPath];
    self.designView.transform = CGAffineTransformRotate(self.designView.transform, M_PI);
}

-(void)setOverlayViewFrame {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    self.overlayView.translatesAutoresizingMaskIntoConstraints = YES;
    [self.overlayView setFrame:screenRect];
    self.overlayView.backgroundColor = [UIColor lightGrayColor];
}

-(void)setStandardUIAlertView {
    CGFloat alertDimension = 250;
    CGRect alertViewFrame = CGRectMake(self.overlayView.bounds.size.width/2 - alertDimension/2, self.overlayView.bounds.size.height/2 - alertDimension/2, alertDimension, alertDimension);
    UIView *alertView = [[UIView alloc] initWithFrame:alertViewFrame];
    alertView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"alert_box"]];
    alertView.alpha = 0.0f;
    alertView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    alertView.layer.cornerRadius = 10;
    alertView.layer.shadowColor = [UIColor blackColor].CGColor;
    alertView.layer.shadowOffset = CGSizeMake(0, 5);
    alertView.layer.shadowOpacity = 0.3f;
    alertView.layer.shadowRadius = 10.0f;
    [self.view addSubview:alertView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        
        // Fade in the grey overlay
        [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.overlayView.alpha = 0.2f;
        } completion:NULL];
        
        // Fade in the alert view
        [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            alertView.alpha = 1.0f;
        } completion:NULL];
        
        // Scale-animate in the alert view
        JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
        scale.damping = 14;
        scale.stiffness = 14;
        scale.mass = 1;
        scale.fromValue = @(1.2);
        scale.toValue = @(1.0);
        
        [alertView.layer addAnimation:scale forKey:scale.keyPath];
        alertView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        
        // Fade out the grey overlay
        [UIView animateWithDuration:.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.overlayView.alpha = 0.0f;
            alertView.alpha = 0.0f;
        } completion:NULL];
        
        // Scale-animate in the alert view
        JNWSpringAnimation *scaleAnimation = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.damping = 11;
        scaleAnimation.stiffness = 11;
        scaleAnimation.mass = 1;
        scaleAnimation.fromValue = @(1.0);
        scaleAnimation.toValue = @(0.7);
        
        [alertView.layer addAnimation:scaleAnimation forKey:scaleAnimation.keyPath];
        alertView.transform = CGAffineTransformMakeScale(0.7, 0.7);
        
    });
}

-(void)setUIAlertViewFromBottom {
    CGFloat alertDimension = 250;
    CGRect alertViewFrame = CGRectMake(self.overlayView.bounds.size.width/2 - alertDimension/2, self.overlayView.bounds.size.height/2 - alertDimension/2, alertDimension, alertDimension);
    UIView *alertView = [[UIView alloc] initWithFrame:alertViewFrame];
    alertView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"alert_box"]];
    alertView.alpha = 0.0f;
    CGAffineTransform viewTransform = CGAffineTransformConcat(CGAffineTransformMakeScale(.25, .25),
                                                              CGAffineTransformMakeTranslation(0, 600));
    alertView.transform = viewTransform;
    alertView.layer.cornerRadius = 10;
    alertView.layer.shadowColor = [UIColor blackColor].CGColor;
    alertView.layer.shadowOffset = CGSizeMake(0, 5);
    alertView.layer.shadowOpacity = 0.3f;
    alertView.layer.shadowRadius = 10.0f;
    [self.view addSubview:alertView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        
        // Fade the overlay and alert view together
        [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.overlayView.alpha = 0.2f;
            alertView.alpha = 1.0f;
        } completion:NULL];
        
        // Animate the alert’s scale from .25 up to 1.0
        JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
        scale.damping = 12;
        scale.stiffness = 12;
        scale.mass = 1;
        scale.fromValue = @(.25);
        scale.toValue = @(1.0);
        
        [alertView.layer addAnimation:scale forKey:scale.keyPath];
        alertView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
        
        // Animate the position from the starting Y position of 600 back up to 0
        // which puts it back at the original position
        JNWSpringAnimation *translate = [JNWSpringAnimation animationWithKeyPath:@"transform.translation.y"];
        translate.damping = 15;
        translate.stiffness = 15;
        translate.mass = 1;
        translate.fromValue = @(600);
        translate.toValue = @(0);
        
        [alertView.layer addAnimation:translate forKey:translate.keyPath];
        alertView.transform = CGAffineTransformTranslate(alertView.transform, 0, 0);
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){

        
        [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.overlayView.alpha = 0.0f;
            alertView.alpha = 0.0f;
        } completion:NULL];
        
        JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
        scale.damping = 17;
        scale.stiffness = 17;
        scale.mass = 1;
        scale.fromValue = @(1.0);
        scale.toValue = @(0.5);
        
        [alertView.layer addAnimation:scale forKey:scale.keyPath];
        alertView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5, 0.5);
        
        JNWSpringAnimation *translate = [JNWSpringAnimation animationWithKeyPath:@"transform.translation.y"];
        translate.damping = 4;
        translate.stiffness = 4;
        translate.mass = 1;
        translate.fromValue = @(0);
        translate.toValue = @(600);
        
        [alertView.layer addAnimation:translate forKey:translate.keyPath];
        alertView.transform = CGAffineTransformTranslate(alertView.transform, 0, 600);
    });
}

-(void)setUIAlertViewBounce {
    CGFloat alertDimension = 250;
    CGRect alertViewFrame = CGRectMake(self.overlayView.bounds.size.width/2 - alertDimension/2, self.overlayView.bounds.size.height/2 - alertDimension/2, alertDimension, alertDimension);
    UIView *alertView = [[UIView alloc] initWithFrame:alertViewFrame];
    alertView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"alert_box"]];
    alertView.alpha = 0.0f;
    alertView.transform = CGAffineTransformMakeScale(0, 0);
    alertView.layer.cornerRadius = 10;
    alertView.layer.shadowColor = [UIColor blackColor].CGColor;
    alertView.layer.shadowOffset = CGSizeMake(0, 5);
    alertView.layer.shadowOpacity = 0.3f;
    alertView.layer.shadowRadius = 10.0f;
    [self.view addSubview:alertView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        
        [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.overlayView.alpha = 0.2f;
            alertView.alpha = 1.0f;
        } completion:NULL];
        
        JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
        scale.damping = 32;
        scale.stiffness = 450;
        scale.mass = 2.4;
        scale.fromValue = @(0);
        scale.toValue = @(1.0);
        
        [alertView.layer addAnimation:scale forKey:scale.keyPath];
        alertView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        
        // Fade out the grey overlay
        [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.overlayView.alpha = 0.0f;
            alertView.alpha = 0.0f;
        } completion:NULL];
        
        JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
        scale.damping = 28;
        scale.stiffness = 28;
        scale.mass = 1;
        scale.fromValue = @(1);
        scale.toValue = @(0);
        
        [alertView.layer addAnimation:scale forKey:scale.keyPath];
        alertView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0, 0);
        
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setBackgroundAppImage{
    self.appBackground.translatesAutoresizingMaskIntoConstraints = YES;
    self.appBackground.alpha = 1.0f;
    [self.appBackground setFrame:CGRectMake(0, 20, self.view.bounds.size.width, 548)];
    self.appBackground.image = [UIImage imageNamed:@"app-bg"];
}

-(void)setMapView {
    self.mapView.translatesAutoresizingMaskIntoConstraints = YES;
    self.mapView.alpha = 0.0f;
    [self.mapView setFrame:CGRectMake(0, 62, self.view.bounds.size.width, 458)];
    self.mapView.image = [UIImage imageNamed:@"map-arrow"];
    self.mapView.transform = CGAffineTransformMakeTranslation(0, 30);
    self.mapView.transform = CGAffineTransformScale(self.mapView.transform, 1.1, 1.1);
}

-(void)addMapIcon{
    UIButton *icon = [UIButton buttonWithType:UIButtonTypeCustom];
    [icon setImage:[UIImage imageNamed:@"map-icon"] forState:UIControlStateNormal];
    [icon addTarget:self action:@selector(didTapMapIcon:) forControlEvents:UIControlEventTouchUpInside];
    [icon setFrame:CGRectMake(self.view.bounds.size.width - 49, 19, 49, 44)];
    [self.view addSubview:icon];
}

-(void)didTapMapIcon:(id)sender {
    
    if (self.mapShowing) {
        // Code for when the map is already visible goes here
        self.mapShowing = NO;
        
        /*
         Re-using the same damping and stiffness throughout these animations
         so we’ll capture the value as a CGFloat variable. Notice that this value is
         higher which means the animation will take less time (as is the case with
         spring animations with matching damping and stiffnesses). Less time is good
         because we’re going back to the default state of the interface and at this point
         the user just wants the map to get out of the way.
         */
        CGFloat dampingStiffnessOut = 24.0f;
        
        // Again, it’s important to begin from the current state so that when a user taps
        // on the button a bunch, there are no jerky movements
        [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.appBackground.alpha = 1.0f;
        } completion:NULL];
        
        [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.mapView.alpha = 0.0f;
        } completion:NULL];
        
        // Map gets 2 separate animations, one for position and the other for scale.
        // We are accessing the @"transform.scale" current, in-flight values via the
        // presentationLayer just like in the previous example
        JNWSpringAnimation *mapScale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
        mapScale.damping = dampingStiffnessOut;
        mapScale.stiffness = dampingStiffnessOut;
        mapScale.mass = 1;
        mapScale.fromValue = @([[self.mapView.layer.presentationLayer valueForKeyPath:mapScale.keyPath] floatValue]);
        mapScale.toValue = @(1.1);
        
        [self.mapView.layer addAnimation:mapScale forKey:mapScale.keyPath];
        self.mapView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        
        JNWSpringAnimation *mapTranslate = [JNWSpringAnimation animationWithKeyPath:@"transform.translation.y"];
        mapTranslate.damping = dampingStiffnessOut;
        mapTranslate.stiffness = dampingStiffnessOut;
        mapTranslate.mass = 1;
        mapTranslate.fromValue = @([[self.mapView.layer.presentationLayer valueForKeyPath:mapTranslate.keyPath] floatValue]);
        mapTranslate.toValue = @(30);
        
        [self.mapView.layer addAnimation:mapTranslate forKey:mapTranslate.keyPath];
        self.mapView.transform = CGAffineTransformTranslate(self.mapView.transform, 0, 30);
        
        // Scale animation for the main app background. We animate it back to a 1.0 scale
        JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
        scale.damping = dampingStiffnessOut;
        scale.stiffness = dampingStiffnessOut;
        scale.mass = 1;
        scale.fromValue = @([[self.appBackground.layer.presentationLayer valueForKeyPath:@"transform.scale.x"] floatValue]);
        scale.toValue = @(1.0);
        
        [self.appBackground.layer addAnimation:scale forKey:scale.keyPath];
        self.appBackground.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
    }
    else {
        // Code for when the map is not visible yet goes here
        self.mapShowing = YES;
        CGFloat dampingStiffness = 16.0f;
        
        [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.appBackground.alpha = 0.3f;
        } completion:NULL];
    
        [UIView animateWithDuration:.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.mapView.alpha = 1.0f;
        } completion:NULL];
        
        // Map gets 2 separate animations, one for position and the other for scale
        JNWSpringAnimation *mapScale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
        mapScale.damping = dampingStiffness;
        mapScale.stiffness = dampingStiffness;
        mapScale.mass = 1;
        mapScale.fromValue = @([[self.mapView.layer.presentationLayer valueForKeyPath:mapScale.keyPath] floatValue]);
        mapScale.toValue = @(1.0);
        
        [self.mapView.layer addAnimation:mapScale forKey:mapScale.keyPath];
        self.mapView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
        
        JNWSpringAnimation *mapTranslate = [JNWSpringAnimation animationWithKeyPath:@"transform.translation.y"];
        mapTranslate.damping = dampingStiffness;
        mapTranslate.stiffness = dampingStiffness;
        mapTranslate.mass = 1;
        mapTranslate.fromValue = @([[self.mapView.layer.presentationLayer valueForKeyPath:mapTranslate.keyPath] floatValue]);
        mapTranslate.toValue = @(0);
        
        [self.mapView.layer addAnimation:mapTranslate forKey:mapTranslate.keyPath];
        self.mapView.transform = CGAffineTransformTranslate(self.mapView.transform, 0, 0);
        
        // Scale animation for the main app background
        JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
        scale.damping = dampingStiffness;
        scale.stiffness = dampingStiffness;
        scale.mass = 1;
        scale.fromValue = @([[self.appBackground.layer.presentationLayer valueForKeyPath:scale.keyPath] floatValue]);
        scale.toValue = @(0.9);
        
        [self.appBackground.layer addAnimation:scale forKey:scale.keyPath];
        self.appBackground.transform = CGAffineTransformScale(CGAffineTransformIdentity, .9, .9);
    }
}

-(void)delayedMusicPlayerAnimation {
    CGFloat windowWidth = self.view.bounds.size.width;
    
    // Add the background to the window
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backgroundView.image = [UIImage imageNamed:@"background"];
    [self.view addSubview:backgroundView];
    
    // Add the arrow and top label
    UIImageView *arrowView = [[UIImageView alloc] initWithFrame:CGRectMake(windowWidth, 0, windowWidth, 45)];
    arrowView.image = [UIImage imageNamed:@"arrow"];
    [self.view addSubview:arrowView];
    
    // Ministry of Fun image
    UIImageView *ministryView = [[UIImageView alloc] initWithFrame:CGRectMake(windowWidth, 57, windowWidth, 28)];
    ministryView.image = [UIImage imageNamed:@"ministry"];
    [self.view addSubview:ministryView];
    
    // Add a Song button
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [addButton setImage:[UIImage imageNamed:@"add-button"] forState:UIControlStateNormal];
    [addButton setImage:[UIImage imageNamed:@"add-button-pressed"] forState:UIControlStateHighlighted];
    [addButton setFrame:CGRectMake(windowWidth, 102, windowWidth, 45)];
    [self.view addSubview:addButton];
    
    // Katy Perry row
    UIImageView *firstRow = [[UIImageView alloc] initWithFrame:CGRectMake(windowWidth, 170, windowWidth, 80)];
    firstRow.image = [UIImage imageNamed:@"1st-row"];
    [self.view addSubview:firstRow];
    
    // Shakira row
    UIImageView *secondRow = [[UIImageView alloc] initWithFrame:CGRectMake(windowWidth, 170+80, windowWidth, 80)];
    secondRow.image = [UIImage imageNamed:@"2nd-row"];
    [self.view addSubview:secondRow];
    
    // Pitbull row
    UIImageView *thirdRow = [[UIImageView alloc] initWithFrame:CGRectMake(windowWidth, 170+160, windowWidth, 80)];
    thirdRow.image = [UIImage imageNamed:@"3rd-row"];
    [self.view addSubview:thirdRow];
    
    // Lana del Rey row
    UIImageView *fourthRow = [[UIImageView alloc] initWithFrame:CGRectMake(windowWidth, 170+240, windowWidth, 80)];
    fourthRow.image = [UIImage imageNamed:@"4th-row"];
    [self.view addSubview:fourthRow];
    
    // HEX row
    UIImageView *fifthRow = [[UIImageView alloc] initWithFrame:CGRectMake(windowWidth, 170+320, windowWidth, 80)];
    fifthRow.image = [UIImage imageNamed:@"5th-row"];
    [self.view addSubview:fifthRow];
    
    //Animations
    
    CGFloat initialDelay = 1.0f;
    CGFloat stutter = 0.06f;
    CGFloat durationLength = 2.1;
    
    //The way that Apple has built this method, the damping has to be a value between 0 and 1, and the closer to 0 it is, the springier the spring motion. The closer to 1 it gets, the fewer bounces until it doesn’t bounce it all and gradually eases to the final value.
    // Animate the top arrow image
    [UIView animateWithDuration:durationLength delay:initialDelay usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
        [arrowView setFrame:CGRectMake(0, 0, windowWidth, 45)];
    } completion:NULL];
    
    // Animate the image label Ministry of Fun
    [UIView animateWithDuration:durationLength delay:initialDelay + (1 * stutter) usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
        [ministryView setFrame:CGRectMake(0, 57, windowWidth, 28)];
    } completion:NULL];
    
    [UIView animateWithDuration:durationLength delay:initialDelay + (2 * stutter) usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
        [addButton setFrame:CGRectMake(0, 102, windowWidth, 45)];
    } completion:NULL];
    
    [UIView animateWithDuration:durationLength delay:initialDelay + (3 * stutter) usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
        [firstRow setFrame:CGRectMake(0, 170, windowWidth, 80)];
    } completion:NULL];
    
    [UIView animateWithDuration:durationLength delay:initialDelay + (4 * stutter) usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
        [secondRow setFrame:CGRectMake(0, 170+80, windowWidth, 80)];
    } completion:NULL];
    
    [UIView animateWithDuration:durationLength delay:initialDelay + (5 * stutter) usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
        [thirdRow setFrame:CGRectMake(0, 170+160, windowWidth, 80)];
    } completion:NULL];
    
    [UIView animateWithDuration:durationLength delay:initialDelay + (6 * stutter) usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
        [fourthRow setFrame:CGRectMake(0, 170+240, windowWidth, 80)];
    } completion:NULL];
    
    [UIView animateWithDuration:durationLength delay:initialDelay + (7 * stutter) usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
        [fifthRow setFrame:CGRectMake(0, 170+320, windowWidth, 80)];
    } completion:NULL];
}


//-(void)animateTableViewRowsIntoPosition {
//    // Make the table invisible, then reload its data
//    self.tableView.alpha = 0.0f;
//    [self.tableView reloadData];
//
//    // Store a delta timing variable so I can tweak the timing delay
//    // between each row’s animation and some additional
//    CGFloat diff = .05;
//    CGFloat tableHeight = self.tableView.bounds.size.height;
//    NSArray *cells = [self.tableView visibleCells];
//
//    // Iterate across the rows and translate them down off the screen
//    for (NSUInteger a = 0; a < [cells count]; a++) {
//        UITableViewCell *cell = [cells objectAtIndex:a];
//        if ([cell isKindOfClass:[UITableViewCell class]]) {
//
//            // Move each cell off the bottom of the screen by translating its Y position
//            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight);
//        }
//    }
//
//    // Now that all rows are off the screen, make the tableview opaque again
//    self.tableView.alpha = 1.0f;
//
//    // Animate each row back into place
//    for (NSUInteger b = 0; b < [cells count]; b++) {
//        UITableViewCell *cell = [cells objectAtIndex:b];
//
//        [UIView animateWithDuration:1.6 delay:diff*b usingSpringWithDamping:0.77
//              initialSpringVelocity:0 options:0 animations:^{
//                  cell.transform = CGAffineTransformMakeTranslation(0, 0);
//              } completion:NULL];
//    }
/*
 If you notice in the 2nd for loop, in the animation block, my delay value is set to diff * b. Because I’m in a loop, I can use the loop’s counter variable b to keep the animation timing in sync, by just multiplying it by the time difference between each row I’m animating. That will insure that there’s the same time difference between each row’s animation which will generate the nice, wave-like pattern. And that’s all there is to it!
 */
//}

-(void)popAnimationSimple {

    CGFloat windowWidth = self.view.bounds.size.width;
    
    UIView *redBall = [[UIView alloc] initWithFrame:CGRectMake(windowWidth/2, 300, 75, 75)];
    redBall.backgroundColor = [UIColor redColor];
    redBall.layer.cornerRadius = 75/2;
    [self.view addSubview:redBall];
    
    POPSpringAnimation *scale = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    scale.toValue = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
    scale.springBounciness = 20.0f; // Between 0-20
    scale.springSpeed = 1.0f; // Between 0-20
//    scale.dynamicsFriction = 20;
//    scale.dynamicsMass = 1;
//    scale.dynamicsTension = 300;
    [redBall pop_addAnimation:scale forKey:@"scaleAnimation"];
    
    /*
    kPOPViewAlpha — The opacity of a view
    kPOPViewFrame — The overall frame of a view
    kPOPViewScaleXY — The scale (both X and Y axis) of a view
    kPOPViewBackgroundColor — The background color of a view
    kPOPLayerCornerRadius — The corner radius of a layer
    kPOPLayerRotation — The rotation of a layer
    kPOPLayerShadowRadius — The size of a layer’s drop shadow
    */
}

-(void)popAnimationMultiple {
    CGFloat windowWidth = self.view.bounds.size.width;
    // Add our pink square to the interface
    UIView *orangeSquare = [[UIView alloc] initWithFrame:CGRectMake(windowWidth/10, 200, 50, 50)];
    orangeSquare.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:orangeSquare];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        POPSpringAnimation *scale = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scale.toValue = [NSValue valueWithCGPoint:CGPointMake(1.5, 1.5)];
        scale.springBounciness = 15;
        scale.springSpeed = 5.0f;
        [orangeSquare pop_addAnimation:scale forKey:@"scale"];
        
        POPSpringAnimation *move = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
        move.toValue = @(windowWidth-100);
        move.springBounciness = 15;
        move.springSpeed = 5.0f;
        [orangeSquare.layer pop_addAnimation:move forKey:@"position"];
        
        POPSpringAnimation *spin = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
        spin.toValue = @(M_PI*4);
        spin.springBounciness = 15;
        spin.springSpeed = 5.0f;
        [orangeSquare.layer pop_addAnimation:spin forKey:@"spin"];
        
        POPSpringAnimation *color = [POPSpringAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
        color.toValue = [UIColor greenColor];
        color.springBounciness = 15;
        color.springSpeed = 5.0f;
        [orangeSquare pop_addAnimation:color forKey:@"colorChange"];
    });
}

-(void)popAnimationBounciness {
    // Add our red ball to the interface
    UIView *redBall = [[UIView alloc] initWithFrame:CGRectMake(150, 200, 75, 75)];
    redBall.backgroundColor = [UIColor redColor];
    redBall.layer.cornerRadius = 75/2; // Half the width
    [self.view addSubview:redBall];
    
    // Add a blue ball
    UIView *blueBall = [[UIView alloc] initWithFrame:CGRectMake(350, 200, 75, 75)];
    blueBall.backgroundColor = [UIColor blueColor];
    blueBall.layer.cornerRadius = 75/2; // Half the width
    [self.view addSubview:blueBall];
    
    UIView *greenBall = [[UIView alloc] initWithFrame:CGRectMake(550, 200, 75, 75)];
    greenBall.backgroundColor = [UIColor greenColor];
    greenBall.layer.cornerRadius = 75/2; // Half the width
    [self.view addSubview:greenBall];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 7 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        POPSpringAnimation *scale = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scale.toValue = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        scale.springBounciness = 5; // Between 0-20
        scale.springSpeed = 10.0f; // Between 0-20
        [redBall pop_addAnimation:scale forKey:@"scale"];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 7.8 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        POPSpringAnimation *scale = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scale.toValue = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        scale.springBounciness = 12; // Between 0-20
        scale.springSpeed = 10.0f; // Between 0-20
        [blueBall pop_addAnimation:scale forKey:@"scale"];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 8.6 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        POPSpringAnimation *scale = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scale.toValue = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        scale.springBounciness = 20; // Between 0-20
        scale.springSpeed = 10.0f; // Between 0-20
        [greenBall pop_addAnimation:scale forKey:@"scale"];
    });
}

-(void)animatedTestButtonAnimation {
    CGFloat windowWidth = self.view.bounds.size.width;
    DTCTestButton *button = [DTCTestButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"gear"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"gear"] forState:UIControlStateHighlighted];
    [button setFrame:CGRectMake(windowWidth/2, 100, 50, 50)];
    [self.view addSubview:button];
}

-(void)animatedHamburgerButtonAnimation {
    // Add the main hamburger button
    CGFloat windowWidth = self.view.bounds.size.width;
    self.hamburgerButton = [DTCHamburgerButton buttonWithType:UIButtonTypeCustom];
    [self.hamburgerButton addTarget:self action:@selector(didTapHamburgerButton:) forControlEvents:UIControlEventTouchUpInside];
    self.hamburgerButton.backgroundColor = [UIColor blackColor];
    [self.hamburgerButton setFrame:CGRectMake(windowWidth/4, 200, 150, 150)];
    self.hamburgerButton.layer.cornerRadius = 75;
    [self.view addSubview:self.hamburgerButton];
    
    CGFloat sectionWidth = 80;
    CGFloat sectionHeight = 11;
    
    // Add the top, middle and bottom hamburger pieces
    self.top = [[UIView alloc] initWithFrame:CGRectMake(self.hamburgerButton.bounds.size.width/2 - sectionWidth/2,
                                                        40, sectionWidth, sectionHeight)];
    self.top.backgroundColor = [UIColor whiteColor];
    self.top.userInteractionEnabled = NO;
    self.top.layer.cornerRadius = sectionHeight/2;
    [self.hamburgerButton addSubview:self.top];
    
    self.middle = [[UIView alloc] initWithFrame:CGRectMake(self.hamburgerButton.bounds.size.width/2 - sectionWidth/2,
                                                           69, sectionWidth, sectionHeight)];
    self.middle.backgroundColor = [UIColor whiteColor];
    self.middle.userInteractionEnabled = NO;
    self.middle.layer.cornerRadius = sectionHeight/2;
    [self.hamburgerButton addSubview:self.middle];
    
    self.bottom = [[UIView alloc] initWithFrame:CGRectMake(self.hamburgerButton.bounds.size.width/2 - sectionWidth/2,
                                                           99, sectionWidth, sectionHeight)];
    self.bottom.backgroundColor = [UIColor whiteColor];
    self.bottom.userInteractionEnabled = NO;
    self.bottom.layer.cornerRadius = sectionHeight/2;
    [self.hamburgerButton addSubview:self.bottom];
}

-(void)didTapHamburgerButton:(id)sender {
    if (self.hamburgerOpen) {
        self.hamburgerOpen = NO;
        
        // Fade in the center line
        [UIView animateWithDuration:0.2 animations:^{
            self.middle.alpha = 1.0f;
        }];
        
        // Rotate the top bar to form an X
        POPSpringAnimation *topRotate = [self.top.layer pop_animationForKey:@"topRotate"];
        
        if (topRotate) {
            topRotate.toValue = @(0);
        } else {
            topRotate = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
            topRotate.toValue = @(0);
            topRotate.springBounciness = 11;
            topRotate.springSpeed = 18.0f;
            [self.top.layer pop_addAnimation:topRotate forKey:@"topRotate"];
        }
        
        // Rotate the bottom bar to form an X
        POPSpringAnimation *bottomRotate = [self.bottom.layer pop_animationForKey:@"bottomRotate"];
        
        if (bottomRotate) {
            bottomRotate.toValue = @(0);
        } else {
            bottomRotate = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
            bottomRotate.toValue = @(0);
            bottomRotate.springBounciness = 11;
            bottomRotate.springSpeed = 18.0f;
            [self.bottom.layer pop_addAnimation:bottomRotate forKey:@"bottomRotate"];
        }
        
        // Re-position the top bar to be in the middle of the button
        POPSpringAnimation *topPosition = [self.top.layer pop_animationForKey:@"topPosition"];
        
        if (topPosition) {
            topPosition.toValue = @(0);
        } else {
            topPosition = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationY];
            topPosition.toValue = @(0);
            topPosition.springBounciness = 0;
            topPosition.springSpeed = 18.0f;
            [self.top.layer pop_addAnimation:topPosition forKey:@"topPosition"];
        }
        
        // Re-position the bototm bar to be in the middle of the button
        POPSpringAnimation *bottomPosition = [self.bottom.layer pop_animationForKey:@"bottomPosition"];
        
        if (bottomPosition) {
            bottomPosition.toValue = @(0);
        } else {
            bottomPosition = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationY];
            bottomPosition.toValue = @(0);
            bottomPosition.springBounciness = 0;
            bottomPosition.springSpeed = 18.0f;
            [self.bottom.layer pop_addAnimation:bottomPosition forKey:@"bottomPosition"];
        }
        
        // Change the color of the top and bottom lines to red
        POPSpringAnimation *topColor = [self.top pop_animationForKey:@"topColor"];
        
        if (topColor) {
            topColor.toValue = [UIColor whiteColor];
        } else {
            topColor = [POPSpringAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
            topColor.toValue = [UIColor whiteColor];
            topColor.springBounciness = 0;
            topColor.springSpeed = 18.0f;
            [self.top pop_addAnimation:topColor forKey:@"topColor"];
        }
        
        POPSpringAnimation *bottomColor = [self.bottom pop_animationForKey:@"bottomColor"];
        
        if (bottomColor) {
            bottomColor.toValue = [UIColor whiteColor];
        } else {
            bottomColor = [POPSpringAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
            bottomColor.toValue = [UIColor whiteColor];
            bottomColor.springBounciness = 0;
            bottomColor.springSpeed = 18.0f;
            [self.bottom pop_addAnimation:bottomColor forKey:@"bottomColor"];
        }
    }
    else {
        self.hamburgerOpen = YES;
        //Add animations for changing the three lines to an X
        
        // Fade out the center line
        [UIView animateWithDuration:0.2 animations:^{
            self.middle.alpha = 0.0f;
        }];
        
        // Rotate the top bar to form an X
        POPSpringAnimation *topRotate = [self.top.layer pop_animationForKey:@"topRotate"];
        
        if (topRotate) {
            topRotate.toValue = @(-M_PI/4);
        } else {
            topRotate = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
            topRotate.toValue = @(-M_PI/4);
            topRotate.springBounciness = 11;
            topRotate.springSpeed = 18.0f;
            [self.top.layer pop_addAnimation:topRotate forKey:@"topRotate"];
        }
        
        // Rotate the bottom bar to form an X
        POPSpringAnimation *bottomRotate = [self.bottom.layer pop_animationForKey:@"bottomRotate"];
        
        if (bottomRotate) {
            bottomRotate.toValue = @(M_PI/4);
        } else {
            bottomRotate = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
            bottomRotate.toValue = @(M_PI/4);
            bottomRotate.springBounciness = 11;
            bottomRotate.springSpeed = 18.0f;
            [self.bottom.layer pop_addAnimation:bottomRotate forKey:@"bottomRotate"];
        }
        
        // Re-position the top bar to be in the middle of the button
        POPSpringAnimation *topPosition =
        [self.top.layer pop_animationForKey:@"topPosition"];
        
        if (topPosition) {
            topPosition.toValue = @(29);
        } else {
            topPosition =
            [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationY];
            topPosition.toValue = @(29);
            topPosition.springBounciness = 0;
            topPosition.springSpeed = 18.0f;
            [self.top.layer pop_addAnimation:topPosition forKey:@"topPosition"];
        }
        
        // Re-position the bototm bar to be in the middle of the button
        POPSpringAnimation *bottomPosition =
        [self.bottom.layer pop_animationForKey:@"bottomPosition"];
        
        if (bottomPosition) {
            bottomPosition.toValue = @(-29);
        } else {
            bottomPosition =
            [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationY];
            bottomPosition.toValue = @(-29);
            bottomPosition.springBounciness = 0;
            bottomPosition.springSpeed = 18.0f;
            [self.bottom.layer pop_addAnimation:bottomPosition forKey:@"bottomPosition"];
        }
        
        // Change the color of the top and bottom lines to red
        POPSpringAnimation *topColor = [self.top pop_animationForKey:@"topColor"];
        
        if (topColor) {
            topColor.toValue = [UIColor redColor];
        } else {
            topColor = [POPSpringAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
            topColor.toValue = [UIColor redColor];
            topColor.springBounciness = 0;
            topColor.springSpeed = 18.0f;
            [self.top pop_addAnimation:topColor forKey:@"topColor"];
        }
        
        POPSpringAnimation *bottomColor = [self.bottom pop_animationForKey:@"bottomColor"];
        
        if (bottomColor) {
            bottomColor.toValue = [UIColor redColor];
        } else {
            bottomColor = [POPSpringAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
            bottomColor.toValue = [UIColor redColor];
            bottomColor.springBounciness = 0;
            bottomColor.springSpeed = 18.0f;
            [self.bottom pop_addAnimation:bottomColor forKey:@"bottomColor"];
        }
    }
}

@end

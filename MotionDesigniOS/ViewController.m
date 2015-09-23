//
//  ViewController.m
//  MotionDesigniOS
//
//  Created by Kavan Brandon on 9/23/15.
//  Copyright © 2015 Kavan Brandon. All rights reserved.
//

#import "ViewController.h"
#import "JNWSpringAnimation.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *designView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    //Do any additional setup after loading the view, typically from a nib.
//
//    [self basicScaleAnimation];
//    [self animateWithConcat];
//    [self animateWithDampingSpring];
    
    /* To start, we defined our JNWSpringAnimation object, a new instance of an animation, and named it scale. We used the designated initializer and passed in a key path of “transform.scale”, but what does that really mean? The key path is simply the property or value which we want to be animated. It’s a property of the view’s underlying CALayer object, which is the thing we’re actually going to be animating here since we’re using a keyframe animation.
     */
//    [self animateScaleWithJNWSpringAnimation];
//    [self animateRotationWithJNWSpringAnimation];
//    [self animateDampnessAndStiffnessWithJNWSpringAnimation];
//    [self animateScaleAndRotationJNWSpringAnimation];
}

-(void)basicScaleAnimation {
    self.designView.backgroundColor = [UIColor redColor];
    self.designView.layer.cornerRadius = 50;
    [UIView animateWithDuration:.5 delay:0
                        options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            self.designView.transform = CGAffineTransformMakeScale(2.0, 2.0);
                        } completion:NULL];
}

-(void)animateWithConcat {
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

-(void)animateRotationWithJNWSpringAnimation {
    //Using JNWSpringAnimation to perform rotation.
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

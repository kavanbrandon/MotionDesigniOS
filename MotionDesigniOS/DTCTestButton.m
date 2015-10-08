//
//  DTCTestButton.m
//  MotionDesigniOS
//
//  Created by Kavan Brandon on 10/7/15.
//  Copyright © 2015 Kavan Brandon. All rights reserved.
//

#import "DTCTestButton.h"
#import "Pop.h"

@implementation DTCTestButton

#pragma mark -
#pragma mark Handle touches ourselves so we can animate a nice interaction

// Called as soon as the user starts to tap
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // Custom code goes here for when the button is first pressed
    // See if either animation is already added to the view or the layer
    POPSpringAnimation *scale = [self pop_animationForKey:@"scale"];
    POPSpringAnimation *rotate = [self.layer pop_animationForKey:@"rotate"];
    
    // If the scale animation exists, just set the toValue
    if (scale) {
        scale.toValue = [NSValue valueWithCGPoint:CGPointMake(0.8, 0.8)];
    }
    else {
        // If it doesn’t, create it and add it
        scale = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scale.toValue = [NSValue valueWithCGPoint:CGPointMake(0.8, 0.8)];
        scale.springBounciness = 20;
        scale.springSpeed = 18.0f;
        [self pop_addAnimation:scale forKey:@"scale"];
    }
    
    // If the rotation animation exists, just set the toValue
    if (rotate) {
        rotate.toValue = @(M_PI/6); // Rotate to 1/6th π radians
    } else {
        // The rotation animation is on the layer so we add it to the layer down below
        rotate = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
        rotate.toValue = @(M_PI/6);
        rotate.springBounciness = 20;
        rotate.springSpeed = 18.0f;
        
        // Add it to the layer, not the view
        [self.layer pop_addAnimation:rotate forKey:@"rotate"];
    }
    
    [super touchesBegan:touches withEvent:event];
}

// Called as soon as the user lifts their finger
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // Custom code goes here for when the button is no longer pressed
    // See if either animation exists (since this is when the user releases, it
    // most surely will already exist.)
    POPSpringAnimation *scale = [self pop_animationForKey:@"scale"];
    POPSpringAnimation *rotate = [self pop_animationForKey:@"rotate"];
    
    if (scale) {
        // Scale it back to 1.0 which is full size
        scale.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
    }
    else {
        scale = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scale.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
        scale.springBounciness = 20;
        scale.springSpeed = 18.0f;
        [self pop_addAnimation:scale forKey:@"scale"];
    }
    
    if (rotate) {
        // Rotate it back to 0 radians which is the normal position
        rotate.toValue = @(0);
    } else {
        rotate = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
        rotate.toValue = @(0);
        rotate.springBounciness = 20;
        rotate.springSpeed = 18.0f;
        
        // Again, make sure to add your layer animation to the layer. I’ve messed
        // this up a few times and it makes for a fun bug to try and find :)
        [self.layer pop_addAnimation:rotate forKey:@"rotate"];
    }
    
    [super touchesEnded:touches withEvent:event];
}

@end

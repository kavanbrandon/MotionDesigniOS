//
//  DTCHamburgerButton.m
//  MotionDesigniOS
//
//  Created by Kavan Brandon on 10/8/15.
//  Copyright © 2015 Kavan Brandon. All rights reserved.
//

#import "DTCHamburgerButton.h"
#import "Pop.h"

@implementation DTCHamburgerButton

#pragma mark -
#pragma mark Handle touches ourselves so we can animate a nice interaction

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    POPSpringAnimation *scale = [self pop_animationForKey:@"scale"];
    
    if (scale) {
        scale.toValue = [NSValue valueWithCGPoint:CGPointMake(0.8, 0.8)];
    } else {
        scale = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scale.toValue = [NSValue valueWithCGPoint:CGPointMake(0.8, 0.8)];
        scale.springBounciness = 20;
        scale.springSpeed = 18.0f;
        [self pop_addAnimation:scale forKey:@"scale"];
    }
    
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    POPSpringAnimation *scale = [self pop_animationForKey:@"scale"];
    
    if (scale) {
        scale.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
    } else {
        scale = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scale.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
        scale.springBounciness = 20;
        scale.springSpeed = 18.0f;
        [self pop_addAnimation:scale forKey:@"scale"];
    }
    
    [super touchesEnded:touches withEvent:event];
}


@end

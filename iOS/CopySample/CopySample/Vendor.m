//
//  Vendor.m
//  CopySample
//
//  Created by Rayan Sequeira on 24/07/17.
//  Copyright © 2017 Rayan Sequeira. All rights reserved.
//

#import "Vendor.h"

@implementation ChildVendor

-(id) copyWithZone:(NSZone *)zone {
    ChildVendor *objectToReturn = [super copyWithZone:zone];
    
    if (objectToReturn) {
        objectToReturn.childName = _childName;
    }
    
    return objectToReturn;
}

@end

@implementation Vendor

-(void) forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"%@ is the invocation", NSStringFromSelector(anInvocation.selector));
    [super forwardInvocation:anInvocation];
}

- (id) copyWithZone:(NSZone *)zone {
    Vendor *object = [[[self class] allocWithZone:zone] init];
    
    if (object) {
        object.atAirport = _atAirport;
        object.vendorID = _vendorID;
    }
    return object;
}


@end

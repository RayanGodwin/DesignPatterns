//
//  Vendor.h
//  CopySample
//
//  Created by Rayan Sequeira on 24/07/17.
//  Copyright © 2017 Rayan Sequeira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vendor : NSObject <NSCopying>

@property (nonatomic, retain) NSString *vendorID;
@property (nonatomic, assign) BOOL atAirport;

@end

@interface ChildVendor : Vendor

@property (nonatomic, retain) NSString *childName;

@end


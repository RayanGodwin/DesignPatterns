//
//  ViewController.m
//  CopySample
//
//  Created by Rayan Sequeira on 24/07/17.
//  Copyright © 2017 Rayan Sequeira. All rights reserved.
//

#import "ViewController.h"
#import "Vendor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Vendor *object1 = [[Vendor alloc] init];
    object1.vendorID = @"1234";
    object1.atAirport = true;
    
    Vendor *object2 = [object1 copy];
    NSLog(@"%@ is the vendor ID", object2.vendorID);
    
    ChildVendor *chVendor = [[ChildVendor alloc] init];
    chVendor.atAirport = false;
    chVendor.vendorID = @"4321";
    chVendor.childName = @"Rayan";
    
    ChildVendor *copiedVendor = [chVendor copy];
    copiedVendor.atAirport = true;
    copiedVendor.vendorID = @"5432";
    
    NSLog(@"%@ is the child vendorID", copiedVendor.vendorID);
    NSLog(@"%@ is the child name", copiedVendor.childName);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

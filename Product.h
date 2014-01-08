//
//  Product.h
//  TableViewCustomCell
//
//  Created by Lee HyunYoung on 2014. 1. 7..
//  Copyright (c) 2014년 Lee HyunYoung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *price;
@property (strong,nonatomic) NSString *imageName;

+ (id)product:(NSString *)name price:(NSString *)price image:(NSString *)image;

@end
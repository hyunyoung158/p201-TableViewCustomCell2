//
//  ProductCell.m
//  TableViewCustomCell2
//
//  Created by SDT-1 on 2014. 1. 8..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ProductCell.h"
@interface ProductCell()

@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UIImageView *productImage;

@end

@implementation ProductCell

//제품정보를 셀로 반영
- (void)setProductInfo:(Product *)item {
    _productName.text = item.name;
    _productPrice.text = item.name;
    _productImage.image = [UIImage imageNamed:item.imageName];
}

//카트에 제품 추가
- (IBAction)addCart:(id)sender {
    //셀 객체로 제품 식별
    [self.delegate addItem:self];
}
@end

//
//  ViewController.m
//  TableViewCustomCell2
//
//  Created by SDT-1 on 2014. 1. 8..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "ProductCell.h"
#import "Product.h"
#import "CartDelegate.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, CartDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController {
    NSArray *_data;
    NSMutableArray *_cart;
}

- (void)addItem:(id)sender {
    //제품찾기 - 셀객체로 indexPath얻기
    UITableViewCell *cell = (UITableViewCell *)sender;
    NSIndexPath *indexPath = [self.table indexPathForCell:cell];
    Product *item = _data[indexPath.row];
    
    //카드에 상품추가
    [_cart addObject:item];
    
    //테이블 카트 섹션 리로드
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [_table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section) {
        return [_data count];
    }else {
        return [_cart count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return (0 == section) ? @"상품목록" : @"카트";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL" forIndexPath:indexPath];
        
        //셀 내용 갱신
        Product *item = _data[indexPath.row];
        [cell setProductInfo:item];
        
        //뷰 컨트롤러가 셀의 델리게이트 역할을 수행한다
        cell.delegate = self;
        
        return cell;
    }else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL" forIndexPath:indexPath];
        
        Product *item = _cart[indexPath.row];
        cell.textLabel.text = item.name;
        
        return cell;
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _data = @[[Product product:@"Baseball" price:@"100" image:@"ball1.jpg"],
              [Product product:@"Basketball" price:@"200" image:@"ball2.jpg"],
              [Product product:@"Volleyvall" price:@"300" image:@"ball3.jpg"]];
    
    _cart = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

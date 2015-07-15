//
//  ViewController.m
//  pop
//
//  Created by amssy on 15/7/13.
//  Copyright (c) 2015年 liusui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSArray *titleArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.titleArray=@[@"按钮",@"图片",@"弹框"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.titleArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier=@"popcell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    cell.textLabel.font = [UIFont fontWithName:@"Avenir-Light" size:20];
    cell.textLabel.text=[self.titleArray objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [self performSegueWithIdentifier:@"goto:button" sender:self];
            break;
        case 1:
            [self performSegueWithIdentifier:@"goto:imageVC" sender:self];
            break;
        case 2:
            [self performSegueWithIdentifier:@"goto:alertVC" sender:self];
            break;
        default:
            break;
    }
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  MenuViewController.m
//  pop
//
//  Created by amssy on 15/7/15.
//  Copyright (c) 2015年 liusui. All rights reserved.
//

#import "MenuViewController.h"
#import <pop/POP.h>

@interface MenuViewController ()
{
    BOOL _isOpen;
    CGRect _hidePosition;
    CGRect _showPostion;
}
@property (weak, nonatomic) IBOutlet UIView *popView;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStyleDone target:self action:@selector(showPop)];
    _isOpen=NO;
    _hidePosition=CGRectMake(320, 64, 0, 0);
    _showPostion=CGRectMake(251, 64, 69, 181);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showPop{
    if (_isOpen==YES) {
        [self hidePop];
        return;
    }
    _isOpen=YES;
    POPSpringAnimation *springAnimation=[POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    springAnimation.fromValue=[NSValue valueWithCGRect:_hidePosition];
    springAnimation.toValue=[NSValue valueWithCGRect:_showPostion];
    springAnimation.springBounciness=15;
    springAnimation.springBounciness=20;
    [self.popView pop_addAnimation:springAnimation forKey:@"springAnimation"];
}

-(void)hidePop{
    _isOpen=NO;
    POPBasicAnimation *basicAnimation=[POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
    basicAnimation.fromValue=[NSValue valueWithCGRect:_showPostion];
    basicAnimation.toValue=[NSValue valueWithCGRect:_hidePosition];
    [self.popView pop_addAnimation:basicAnimation forKey:@"springAnimation"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

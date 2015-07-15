//
//  AlertViewController.m
//  pop
//
//  Created by amssy on 15/7/15.
//  Copyright (c) 2015年 liusui. All rights reserved.
//

#import "AlertViewController.h"
#import <pop/POP.h>

@interface AlertViewController ()
@property (weak, nonatomic) IBOutlet UIView *alertView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *pullButtonitem;

@end

@implementation AlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem=self.pullButtonitem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pullAction:(id)sender {
    [self showAlert];
}

-(void)showAlert{
    POPSpringAnimation *springAnimation=[POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    CGPoint point=self.alertView.center;
    if (point.y==275) {
        springAnimation.toValue=[NSValue valueWithCGSize:CGSizeMake(point.x, -230)];
    }else{
        springAnimation.toValue=[NSValue valueWithCGSize:CGSizeMake(point.x, 275)];
    }
    springAnimation.springSpeed=20.0;
    springAnimation.springBounciness=20;
    [self.alertView pop_addAnimation:springAnimation forKey:@"springAnimation"];
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

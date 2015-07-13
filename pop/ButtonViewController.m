//
//  ButtonViewController.m
//  pop
//
//  Created by amssy on 15/7/13.
//  Copyright (c) 2015年 liusui. All rights reserved.
//

#import "ButtonViewController.h"
#import <pop/POP.h>

@interface ButtonViewController ()
@property (weak, nonatomic) IBOutlet UIButton *shakeButton;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@end

@implementation ButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    self.errorLabel.hidden=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginAction:(id)sender {
    [self shakeButton1];
    if (self.shakeButton.selected) {
        [self hideLabel];
        return;
    }
    [self showLabel];
}

-(void)shakeButton1{
    POPSpringAnimation *shakeAnimation=[POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    shakeAnimation.velocity=@2000;
    shakeAnimation.springBounciness=20;
    [shakeAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
        self.shakeButton.userInteractionEnabled=YES;
    }];
    [self.shakeButton pop_addAnimation:shakeAnimation forKey:@"shakeAnimation"];
}

-(void)showLabel{
    self.shakeButton.selected=YES;
    self.errorLabel.hidden=NO;
    self.errorLabel.layer.opacity=1.0;
    POPSpringAnimation *layerScaleAnimation=[POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    layerScaleAnimation.springBounciness=18;
    layerScaleAnimation.toValue=[NSValue valueWithCGSize:CGSizeMake(1.0f, 1.0f)];
    [self.errorLabel.layer pop_addAnimation:layerScaleAnimation forKey:@"labelScaleAnimation"];
    
    POPSpringAnimation *layerPositionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    layerPositionAnimation.toValue = @(self.shakeButton.layer.position.y + self.shakeButton.intrinsicContentSize.height);
    layerPositionAnimation.springBounciness = 12;
    [self.errorLabel.layer pop_addAnimation:layerPositionAnimation forKey:@"layerPositionAnimation"];
}

-(void)hideLabel{
    POPSpringAnimation *layerScaleAnimation=[POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    layerScaleAnimation.toValue=[NSValue valueWithCGSize:CGSizeMake(0.5f, 0.5f)];
    [self.errorLabel.layer pop_addAnimation:layerScaleAnimation forKey:@"layerScaleAnimation"];
    
    POPBasicAnimation *layerPositionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    layerPositionAnimation.toValue = @(self.shakeButton.layer.position.y);
    [self.errorLabel.layer pop_addAnimation:layerPositionAnimation forKey:@"layerPositionAnimation"];
    self.errorLabel.hidden=YES;
    self.shakeButton.selected=NO;
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

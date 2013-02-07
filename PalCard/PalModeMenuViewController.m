//
//  PalModeMenuViewController.m
//  PalCard
//
//  Created by FlyinGeek on 13-2-1.
//  Copyright (c) 2013年 FlyinGeek. All rights reserved.
//

#import "PalModeMenuViewController.h"
#import "PalViewController.h"
#import "MCSoundBoard.h"

#define _BGPIC "UIimages/main_bg.jpg"
#define _BGPIC2 "UIimages/cloud-front.png"

#define DEVICE_IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.height == 568)

@interface PalModeMenuViewController (){
    bool _soundOff;
}

@property (copy, nonatomic) NSString *mode;
@property (strong, nonatomic) IBOutlet UIImageView *bgPic;
@property (strong, nonatomic) IBOutlet UIImageView *bgPic2;
@property (strong, nonatomic) IBOutlet UIImageView *blackBG;
@property (strong, nonatomic) IBOutlet UIButton *easyButton;
@property (strong, nonatomic) IBOutlet UIButton *normalButton;
@property (strong, nonatomic) IBOutlet UIButton *hardButton;
@property (strong, nonatomic) IBOutlet UIButton *returnButton;
@property (strong, nonatomic) IBOutlet UIImageView *cloud1;
@property (strong, nonatomic) IBOutlet UIImageView *cloud2;
@property (strong, nonatomic) IBOutlet UIImageView *cloud3;
@property (strong, nonatomic) IBOutlet UIImageView *difChoice;

@end

@implementation PalModeMenuViewController



- (void)prepare
{
    
    self.blackBG.alpha = 1.0;
    
    self.bgPic.image  = [UIImage imageNamed:@_BGPIC];
    self.bgPic2.image = [UIImage imageNamed:@_BGPIC2];
    
    self.bgPic2.alpha = 0.7;
    
    
    CGRect frame = self.bgPic.frame;
    frame.origin.x = 0;
    self.bgPic.frame = frame;
    
    [UIView beginAnimations:@"testAnimation" context:NULL];
    [UIView setAnimationDuration:20.0];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationRepeatCount:9999];
    
    frame = self.bgPic.frame;
    frame.origin.x = -frame.size.width + 320;
    self.bgPic.frame = frame;
    
    [UIView commitAnimations];
    
    // cloud
    
    CGRect frame2 = self.bgPic2.frame;
    frame2.origin.x = 0;
    self.bgPic2.frame = frame2;
    
    [UIView beginAnimations:@"testAnimation2" context:NULL];
    [UIView setAnimationDuration:8.0];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationRepeatCount:9999];
    
    frame2 = self.bgPic2.frame;
    frame2.origin.x = -frame2.size.width + 285;
    self.bgPic2.frame = frame2;
    
    [UIView commitAnimations];
    
    
    [UIView beginAnimations:@"fadeIn" context:nil];
    [UIView setAnimationDuration:0.5];
    self.blackBG.alpha = 0.0f;
    [UIView commitAnimations];
    
    
}

- (void) refresh{
    
    [self prepare];
    //NSLog(@"trigger event when will enter foreground.");
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresh) name:UIApplicationWillEnterForegroundNotification object:nil];
    
	[self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
    
	[self.navigationController setNavigationBarHidden:NO animated:NO];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self prepare];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (!DEVICE_IS_IPHONE5) {
        
        [self.difChoice setFrame:CGRectMake(40, 0, 240, 128)];
        
        [self.easyButton setFrame:CGRectMake(95, 120, 130, 78)];
        
        [self.normalButton setFrame:CGRectMake(95, 215, 130, 78)];
        
        [self.hardButton setFrame:CGRectMake(95, 310, 130, 78)];
        
        [self.cloud1 setFrame:CGRectMake(70, 95, 180, 120)];
        
        [self.cloud2 setFrame:CGRectMake(70, 195, 180, 120)];
        
        [self.cloud3 setFrame:CGRectMake(70, 290, 180, 120)];
        
        [self.returnButton setFrame:CGRectMake(250, 425, 50, 30)];
    }
    
    self.difChoice.image = [UIImage imageNamed:@"UIimages/difficulty_choice.png"];
    
    
    
    
    [self prepare];
    
    [self.easyButton setBackgroundImage:[UIImage imageNamed:@"UIimages/easy.png"] forState:UIControlStateNormal];
    
    [self.easyButton setBackgroundImage:[UIImage imageNamed:@"UIimages/easy_push.png"] forState:UIControlStateHighlighted];

    [self.normalButton setBackgroundImage:[UIImage imageNamed:@"UIimages/normal.png"] forState:UIControlStateNormal];
    
    [self.normalButton setBackgroundImage:[UIImage imageNamed:@"UIimages/normal_push.png"] forState:UIControlStateHighlighted];
    
    [self.hardButton setBackgroundImage:[UIImage imageNamed:@"UIimages/hard.png"] forState:UIControlStateNormal];
    
    [self.hardButton setBackgroundImage:[UIImage imageNamed:@"UIimages/hard_push.png"] forState:UIControlStateHighlighted];
    
    [self.returnButton setBackgroundImage:[UIImage imageNamed:@"UIimages/back.png"] forState:UIControlStateNormal];
    
    [self.returnButton setBackgroundImage:[UIImage imageNamed:@"UIimages/back_push.png"] forState:UIControlStateHighlighted];
    
    /*
    [self.easyBotton.titleLabel setFont:[UIFont fontWithName:@"DuanNing-XIng" size:35]];
    
    self.easyBotton.titleLabel.text = @"简单模式";
    
    [self.normalBotton.titleLabel setFont:[UIFont fontWithName:@"DuanNing-XIng" size:35]];
    
    self.normalBotton.titleLabel.text = @"普通模式";
    
    [self.hardBotton.titleLabel setFont:[UIFont fontWithName:@"DuanNing-XIng" size:35]];
    
    self.hardBotton.titleLabel.text = @"困难模式";
    
    [self.returnBotton.titleLabel setFont:[UIFont fontWithName:@"DuanNing-XIng" size:30]];
    
    self.returnBotton.titleLabel.text = @"返回";
     */
    
    NSString *turnOffSound = [[NSUserDefaults standardUserDefaults] valueForKey:@"turnOffSound"];
    
    if (turnOffSound) {
        
        if ([turnOffSound isEqualToString:@"YES"]) {
            _soundOff = YES;
        }
        else if ([turnOffSound isEqualToString:@"NO"]) {
            _soundOff = NO;
        }
    }
    else {
        _soundOff = NO;
    }
    
    if (!_soundOff) {
        [MCSoundBoard addSoundAtPath:[[NSBundle mainBundle] pathForResource:@"selected.wav" ofType:nil] forKey:@"selected"];
        [MCSoundBoard addSoundAtPath:[[NSBundle mainBundle] pathForResource:@"button_pressed.wav" ofType:nil] forKey:@"button"];
    }
    
    
    self.blackBG.alpha = 1.0;
    [UIView beginAnimations:@"fadeIn" context:nil];
    [UIView setAnimationDuration:0.5];
    self.blackBG.alpha = 0.0f;
    [UIView commitAnimations];
    
    self.bgPic.image  = [UIImage imageNamed:@_BGPIC];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if (!_soundOff) {
        AVAudioPlayer *player = [MCSoundBoard audioPlayerForKey:@"MainBGM"];
        [player stop];
    }

    PalViewController *palVC = segue.destinationViewController;
    palVC.mode = self.mode;
    
    //[self.navigationController presentViewController:palVC animated:NO completion:nil];
    
}

- (IBAction)easyModeButtonPressed:(UIButton *)sender {
    
    if (!_soundOff) {
        [MCSoundBoard playSoundForKey:@"selected"];
    }
    self.mode = @"easy";
}

- (IBAction)normalModeButtonPressed:(UIButton *)sender {
    
    if (!_soundOff) {
        [MCSoundBoard playSoundForKey:@"selected"];
    }
    self.mode = @"normal";
}

- (IBAction)hardModeButtonPressed:(UIButton *)sender {
    
    if (!_soundOff) {
        [MCSoundBoard playSoundForKey:@"selected"];
    }
    self.mode = @"hard";
}


- (IBAction)returnButtonPressed:(UIButton *)sender {
    
    if (!_soundOff) {
        [MCSoundBoard playSoundForKey:@"botton"];
    }
    [self.navigationController dismissViewControllerAnimated:NO completion:nil];
}




- (void)viewDidUnload {
    [self setDifChoice:nil];
    [super viewDidUnload];
}
@end

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
    CGRect frameGauge;
}

@property (nonatomic, retain) NSTimer *timer;

@property (nonatomic, retain) IBOutlet UIView *viewGauge;
@property (nonatomic, retain) IBOutlet UILabel *labelLeft;
@property (nonatomic, retain) IBOutlet UILabel *labelSpan;
@property (nonatomic, retain) IBOutlet UILabel *labelClock;

- (IBAction)showInfo:(id)sender;
- (void)processSeconds:(NSTimer*)timer;

@end

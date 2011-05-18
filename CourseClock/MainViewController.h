@interface MainViewController : UIViewController {
    CGRect frameGauge;
}

@property (nonatomic, retain) NSTimer *timer;

@property (nonatomic, retain) IBOutlet UIView *viewGauge;
@property (nonatomic, retain) IBOutlet UILabel *labelLeft;
@property (nonatomic, retain) IBOutlet UILabel *labelSpan;
@property (nonatomic, retain) IBOutlet UILabel *labelClock;

- (void)processSeconds:(NSTimer*)timer;

@end

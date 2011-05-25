#import <QuartzCore/QuartzCore.h>
#import "MainViewController.h"

@implementation MainViewController

@synthesize timer = _timer;
@synthesize viewGauge = _viewGauge;
@synthesize labelLeft = _labelLeft;
@synthesize labelSpan = _labelSpan;
@synthesize labelClock = _labelClock;

- (void)viewDidLoad
{
    [super viewDidLoad];
    frameGauge = self.viewGauge.frame;
    [self processSeconds:nil];
    self.viewGauge.layer.cornerRadius = 8;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(processSeconds:) userInfo:nil repeats:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.timer = nil;
}


- (void)dealloc
{
    [super dealloc];
}

#pragma mark - Interval Function

- (void)processSeconds:(NSTimer *)timer
{
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:(NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:[NSDate date]];
    
    int secs = ([comp hour] * 60 + [comp minute]) * 60 + [comp second];
    
    if ([comp hour] < 13) {
        secs -= (10 * 60 + 30) * 60;
    } else {
        secs -= (13 * 60 + 30) * 60;
    }
    
    int left = 60 * 60 - secs % (70 * 60);
    if (left > 0) {
        self.labelLeft.text = [NSString stringWithFormat:@"%2d:%02d", left / 60, left % 60];
        
        float gauge = 1.0 / (60 * 60) * left;
        CGRect rect = frameGauge;
        rect.origin.y += rect.size.height * (1.0 - gauge);
        rect.size.height *= gauge;
        self.viewGauge.frame = rect;
        self.viewGauge.backgroundColor = [UIColor redColor];
    } else {
        left += 10 * 60;
        self.labelLeft.text = [NSString stringWithFormat:@"%2d:%02d", left / 60, left % 60];

        float gauge = 1.0 - 1.0 / (10 * 60) * left;
        CGRect rect = frameGauge;
        rect.origin.y += rect.size.height * (1.0 - gauge);
        rect.size.height *= gauge;
        self.viewGauge.frame = rect;
        self.viewGauge.backgroundColor = [UIColor blueColor];
    }

    self.labelClock.text = [NSString stringWithFormat:@"%2d:%02d", [comp hour], [comp minute]];
}

@end

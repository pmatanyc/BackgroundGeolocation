//
//  PMViewController.m
//  BackgroundGeolocation
//
//  Created by Paola Mata Maldonado on 8/4/14.
//
//

#import "PMViewController.h"

@interface PMViewController ()

@end

@implementation PMViewController
@synthesize locationManager;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (locationManager == nil)
        locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    
    if([CLLocationManager locationServicesEnabled]==FALSE||
                                       [CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied)
    {
        UIAlertView *servicesDisabledAlert = [[UIAlertView alloc] initWithTitle:@"Location Services Disabled" message:@"Location Services Disabled. Turn On Location Services from iPhone Settings." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [servicesDisabledAlert show];
    }
    else
    {
        
        [self.locationManager startUpdatingLocation];
        
    }
    
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    
    CLLocation *newLocation = [locations lastObject];
    
    if(!self.deferringUpdates){
        
        if (UIApplication.sharedApplication.applicationState == UIApplicationStateActive)
        {
            NSLog(@"LOCATION UPDATE: latitude %+.6f, longitude %+.6f\n", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
            
            self.latitudeLabel.text = [NSString stringWithFormat:@"Lat: %+.6f", newLocation.coordinate.latitude];
            self.longitudeLabel.text = [NSString stringWithFormat:@"Long: %+.6f", newLocation.coordinate.longitude];
            //both arguments are optional. Use CLLocationDistanceMax or CLTimeIntervalMax
            [self.locationManager allowDeferredLocationUpdatesUntilTraveled:CLLocationDistanceMax timeout:60];
            
        }
        else
        {
            NSLog(@"BACKGROUND UPDATE: latitude %+.6f, longitude %+.6f\n", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
            //both arguments are optional. Use CLLocationDistanceMax or CLTimeIntervalMax
            [self.locationManager allowDeferredLocationUpdatesUntilTraveled:CLLocationDistanceMax timeout:180];
        }
        
        self.deferringUpdates = YES;
    }

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  PMViewController.h
//  BackgroundGeolocation
//
//  Created by Paola Mata Maldonado on 8/4/14.
//
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface PMViewController : UIViewController<CLLocationManagerDelegate>

@property (nonatomic)CLLocationManager *locationManager;

@property(nonatomic) BOOL deferringUpdates;

@property (strong, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *longitudeLabel;

@end

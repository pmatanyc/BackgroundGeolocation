//
//  PMAppDelegate.h
//  BackgroundGeolocation
//
//  Created by Paola Mata Maldonado on 8/4/14.
//
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#import "PMViewController.h"

@interface PMAppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic) CLLocationManager *locationManager;

@end

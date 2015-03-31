//
//  MapViewViewController.h
//  FavoritePhotos
//
//  Created by Ronald Hernandez on 3/30/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "IGImage.h"

@interface MapViewViewController : UIViewController
@property  IGImage *bikeStation;
@property CLLocation *currentLocation;

@end

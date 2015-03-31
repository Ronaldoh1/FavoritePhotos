//
//  MapViewViewController.m
//  FavoritePhotos
//
//  Created by Ronald Hernandez on 3/30/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import "MapViewViewController.h"
#import <MapKit/MapKit.h>

@interface MapViewViewController ()<MKMapViewDelegate, CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;


@end

@implementation MapViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    //show user's current location.
    self.mapView.showsUserLocation = true;


}

@end

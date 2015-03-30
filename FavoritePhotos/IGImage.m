//
//  IGImage.m
//  FavoritePhotos
//
//  Created by Ronald Hernandez on 3/30/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import "IGImage.h"

@implementation IGImage

-(instancetype)initWithMediaDictionary:(NSDictionary *)dictionary{
    self = [super init];


    //get the image URL
    NSDictionary *someDictionary = [dictionary objectForKey:@"images"];
    NSDictionary *someInnerDictionary = [someDictionary objectForKey:@"standard_resolution"];

    self.imageURL = [NSURL URLWithString:[someInnerDictionary objectForKey:@"url"]];
    //get the image
    self.imageToDisplay = [UIImage imageWithData: [NSData dataWithContentsOfURL:self.imageURL]];

    //ONlY SET THE LATITUDE AND LONGITUDE IF IT THEY EXIST
    if(!([dictionary objectForKey:@"location"] == [NSNull null])){
        //getTheCoordinates
        NSDictionary *someDictionary2 = [dictionary objectForKey:@"location"];
        self.latitude = [[someDictionary2 objectForKey:@"latitude"] doubleValue];

        self.longitude = [[someDictionary2 objectForKey:@"longitude"] doubleValue];

        NSLog(@"latitude is %f and longitude is %f", self.latitude, self.longitude);

    }
    NSLog(@"latitude is %f and longitude is %f", self.latitude, self.longitude);
    return self;
}

@end
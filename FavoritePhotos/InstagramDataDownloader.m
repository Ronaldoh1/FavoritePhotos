//
//  InstagramDataDownloader.m
//  FavoritePhotos
//
//  Created by Ronald Hernandez on 3/30/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import "InstagramDataDownloader.h"

@implementation InstagramDataDownloader

//pull the IGImages information - need to store in an aray - then notify and provide the ParentVC with the images.

-(void)pullImagesFromIGAPI{

    NSString *tempURLStr = [NSString stringWithFormat:@"https://api.instagram.com/v1/tags/%@/media/recent?access_token=18177908.1fb234f.7b96c1e301b74ec8bffcf3550a2fde49", self.searchTag];
    //Step 1. Create the URL
    NSURL *url = [NSURL URLWithString:tempURLStr];
    //Step 2. Create a request.
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    //Step 3. Create the connection and pull data.

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        [self downloadcomplete:data];
    }];

}

-(void)downloadcomplete:(NSData *)data{
    //Store all of the data in an array.

    NSDictionary *rawData = [NSJSONSerialization JSONObjectWithData:data
                                                            options:NSJSONReadingAllowFragments
                                                              error:nil];
    NSArray *results = [rawData objectForKey:@"data"];
    [self.parentVC gotIgRawData:results];
}


@end

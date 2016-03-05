//
//  TauYouTubeEntriesCollectionViewController.h
//  Tau4Mac
//
//  Created by Tong G. on 3/3/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

// TauYouTubeEntriesCollectionViewController class
@interface TauYouTubeEntriesCollectionViewController : NSViewController

#pragma mark - Initializations

- ( instancetype ) initWithGTLCollectionObject: ( GTLCollectionObject* )_CollectionObject ticket: ( GTLServiceTicket* )_Ticket;

#pragma mark - Properties

@property ( strong, readwrite ) GTLCollectionObject* collectionObject;
@property ( strong, readwrite ) GTLServiceTicket* ticket;

@end // TauYouTubeEntriesCollectionViewController class
//
//  TauSearchPanelBaseViewController.m
//  Tau4Mac
//
//  Created by Tong G. on 3/5/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "TauSearchPanelBaseViewController.h"
#import "TauResultCollectionPanelViewController.h"
#import "TauSearchPanelStackViewController.h"

// Private Interfaces
@interface TauSearchPanelBaseViewController ()

@end // Private Interfaces

// TauSearchPanelBaseViewController class
@implementation TauSearchPanelBaseViewController
    {
@private
    GTLServiceTicket __strong* ytSearchListTicket_;
    }

#pragma mark - IBActions

- ( IBAction ) searchUserInputAction: ( id )_Sender
    {
    NSString* userInput = self.searchField.stringValue;
    if ( userInput.length > 0 )
        {
        GTLQueryYouTube* ytSearchListQuery = [ GTLQueryYouTube queryForSearchListWithPart: @"snippet" ];
        [ ytSearchListQuery setQ: userInput ];
        [ ytSearchListQuery setMaxResults: 20 ];
//        [ ytSearchListQuery setType: @"playlist" ];

        if ( ytSearchListTicket_ )
            [ ytSearchListTicket_ cancelTicket ];

        ytSearchListTicket_ = [ [ TauDataService sharedService ].ytService executeQuery: ytSearchListQuery
                                                                      completionHandler:
        ^( GTLServiceTicket* _Ticket, GTLYouTubeSearchListResponse* _SearchListResp, NSError* _Error )
            {
            if ( !_Error )
                {
                TauResultCollectionPanelViewController* contentPanelViewController =
                    [ [ TauResultCollectionPanelViewController alloc ] initWithGTLCollectionObject: _SearchListResp ticket: _Ticket ];

                [ contentPanelViewController setHostStack: self.hostStack ];
                [ self.hostStack pushView: contentPanelViewController ];

                DDLogInfo( @"%@", ytSearchListTicket_ );
                }
            else
                DDLogError( @"%@", _Error );
            } ];
        }
    }

@end // TauSearchPanelBaseViewController class
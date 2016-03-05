//
//  TauResultCollectionPanelTitleView.m
//  Tau4Mac
//
//  Created by Tong G. on 3/5/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "TauResultCollectionPanelTitleView.h"

@implementation TauResultCollectionPanelTitleView
    {
    NSDictionary __strong* sumDrawingAttrs_;
    NSDictionary __strong* countDrawingAttrs_;
    }

#pragma mark - Drawing

- ( void ) drawRect: ( NSRect )_DirtyRect
    {
    [ super drawRect: _DirtyRect ];

    NSString* summaryText = NSLocalizedString( @"Search Results", nil );
    NSString* countText = [ NSString stringWithFormat: NSLocalizedString( @"About %@ results", nil ), @( 200042 ) ];

    NSString* fontName = @"Helvetica";
    if ( !sumDrawingAttrs_ )
        {
        sumDrawingAttrs_ =
            @{ NSForegroundColorAttributeName : [ NSColor whiteColor ]
             , NSFontAttributeName : [ NSFont fontWithName: fontName size: 15 ]
             };
        }

    if ( !countDrawingAttrs_ )
        {
        countDrawingAttrs_ =
            @{ NSForegroundColorAttributeName : [ NSColor lightGrayColor ]
             , NSFontAttributeName : [ NSFont fontWithName: fontName size: 13 ]
             };
        }

    NSSize sumSize = [ summaryText sizeWithAttributes: sumDrawingAttrs_ ];
    NSSize countSize = [ countText sizeWithAttributes: countDrawingAttrs_ ];

    NSSize totalSize = sumSize;
    totalSize.width += ( 5.f + countSize.width );

    NSPoint sumTextDrawingPoint =
        NSMakePoint( ( NSWidth( self.bounds ) - totalSize.width ) / 2.f
                   , ( NSHeight( self.bounds ) - totalSize.height ) / 2.f
                   );

    NSPoint countTextDrawingPoint = sumTextDrawingPoint;
    countTextDrawingPoint.x = ( sumTextDrawingPoint.x + sumSize.width + 5 );
    countTextDrawingPoint.y = ( NSHeight( self.bounds ) - countSize.height ) / 2.f;

    [ summaryText drawAtPoint: sumTextDrawingPoint withAttributes: sumDrawingAttrs_ ];
    [ countText drawAtPoint: countTextDrawingPoint withAttributes: countDrawingAttrs_ ];
    }

@end
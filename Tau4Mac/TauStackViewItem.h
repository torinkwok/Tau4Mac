//
//  TauStackViewItem.h
//  Tau4Mac
//
//  Created by Tong G. on 3/5/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class TauSearchPanelStackViewController;

@interface TauStackViewItem : NSViewController

@property ( weak, readwrite ) TauSearchPanelStackViewController* hostStack;

@end
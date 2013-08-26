//
//  StickyNote.h
//  SampleCoreDataProject
//
//  Created by Matt on 8/26/13.
//  Copyright (c) 2013 Blue Rocket, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <BRFullTextSearch/BRIndexable.h>

extern const BRSearchObjectType kStickyNoteSearchObjectType;

@interface StickyNote : NSManagedObject <BRIndexable>

@property (nonatomic, retain) NSDate * created;
@property (nonatomic, retain) NSString * text;

@end
//
//  StickyNote.m
//  SampleCoreDataProject
//
//  Created by Matt on 8/26/13.
//  Copyright (c) 2013 Blue Rocket, Inc. All rights reserved.
//

#import "StickyNote.h"

#import <BRFullTextSearch/BRFullTextSearch.h>
#import <BRFullTextSearch/NSDate+BRFullTextSearchAdditions.h>

const BRSearchObjectType kStickyNoteSearchObjectType = 'n';

@implementation StickyNote

@dynamic created;
@dynamic text;

#pragma mark - Indexable

- (BRSearchObjectType)indexObjectType {
	return kStickyNoteSearchObjectType;
}

- (NSString *)indexIdentifier {
	return [self.created asIndexTimestampString];
}

- (NSDictionary *)indexFieldsDictionary {
	NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithCapacity:4];
	if ( self.text != nil ) {
		[data setObject:self.text forKey:kBRSearchFieldNameValue];
	}
	[data setObject:[self.created asIndexTimestampString] forKey:kBRSearchFieldNameTimestamp];
	return data;
}

- (BRIndexableIndexType)indexFieldIndexType:(NSString *)fieldName {
	if ( [kBRSearchFieldNameTimestamp isEqualToString:fieldName] ) {
		return BRIndexableIndexTypeUntokenized;
	}
	return BRIndexableIndexTypeTokenized;
}

@end

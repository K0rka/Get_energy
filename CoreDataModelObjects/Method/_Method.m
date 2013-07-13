// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Method.m instead.

#import "_Method.h"

const struct MethodAttributes MethodAttributes = {
	.cost = @"cost",
	.duration = @"duration",
	.methoddescription = @"methoddescription",
	.place = @"place",
	.star = @"star",
	.title = @"title",
};

const struct MethodRelationships MethodRelationships = {
};

const struct MethodFetchedProperties MethodFetchedProperties = {
};

@implementation MethodID
@end

@implementation _Method

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Method" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Method";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Method" inManagedObjectContext:moc_];
}

- (MethodID*)objectID {
	return (MethodID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"costValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"cost"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"durationValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"duration"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"starValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"star"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic cost;



- (int32_t)costValue {
	NSNumber *result = [self cost];
	return [result intValue];
}

- (void)setCostValue:(int32_t)value_ {
	[self setCost:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveCostValue {
	NSNumber *result = [self primitiveCost];
	return [result intValue];
}

- (void)setPrimitiveCostValue:(int32_t)value_ {
	[self setPrimitiveCost:[NSNumber numberWithInt:value_]];
}





@dynamic duration;



- (double)durationValue {
	NSNumber *result = [self duration];
	return [result doubleValue];
}

- (void)setDurationValue:(double)value_ {
	[self setDuration:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveDurationValue {
	NSNumber *result = [self primitiveDuration];
	return [result doubleValue];
}

- (void)setPrimitiveDurationValue:(double)value_ {
	[self setPrimitiveDuration:[NSNumber numberWithDouble:value_]];
}





@dynamic methoddescription;






@dynamic place;






@dynamic star;



- (int32_t)starValue {
	NSNumber *result = [self star];
	return [result intValue];
}

- (void)setStarValue:(int32_t)value_ {
	[self setStar:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveStarValue {
	NSNumber *result = [self primitiveStar];
	return [result intValue];
}

- (void)setPrimitiveStarValue:(int32_t)value_ {
	[self setPrimitiveStar:[NSNumber numberWithInt:value_]];
}





@dynamic title;











@end

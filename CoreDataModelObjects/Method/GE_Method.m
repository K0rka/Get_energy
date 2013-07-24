#import "GE_Method.h"


@interface GE_Method ()

// Private interface goes here.

@end


@implementation GE_Method

//==============================================================================
+ (NSArray *) methodAttributes {
    return  @[@"cost",
              @"duration",
              @"methodDescription",
              @"peopleNumber",
              @"place",
              @"preparedList",
              @"star",
              @"title"];
}

@end

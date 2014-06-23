#import "GE_Method.h"


@interface GE_Method ()

// Private interface goes here.

@end


@implementation GE_Method

//==============================================================================
+ (NSArray *) methodAttributes {
    return  @[@"methodDescription",
              @"title",
              @"cost",
              @"duration",
              @"peopleNumber",
              @"place",
              @"preparedList",
              @"star"
              ];
}

@end

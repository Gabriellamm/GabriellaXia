#import "CryptoManager.h"
#import <CommonCrypto/CommonCrypto.h>
#import "NSString+AESCrypt.h"

typedef enum ShaType : NSUInteger {
    ShaType256,
    ShaType512
} ShaType;


static CryptoManager* instance = nil;

@implementation CryptoManager


+ (CryptoManager*) getInstance{
    @synchronized(instance){
        if(instance == nil){
            instance = [[CryptoManager alloc] init];
        }
    }
    return instance;
}

- (NSString*)encryptDataWithDataString:(NSString*) rawDataStr withSeed:(NSString*) seed{
	NSString *key = [self createSHA256:seed];
    key = [self addLeadingZero:32 source:key];
    key = [key lowercaseString];
    NSString *iv = [self createSHA512:seed];
    iv = [self addLeadingZero:16 source:iv];
    iv = [iv lowercaseString];
	NSString *result = [rawDataStr AES256EncryptWithKey:key iv:iv];

    return result;
}

- (NSString*)decryptDataWithDataString:(NSString*) rawDataStr withSeed:(NSString*) seed{
	NSString *key = [self createSHA256:seed];
    key = [self addLeadingZero:32 source:key];
    key = [key lowercaseString];
    NSString *iv = [self createSHA512:seed];
    iv = [self addLeadingZero:16 source:iv];
    iv = [iv lowercaseString];
    NSString *result = [rawDataStr AES256DecryptWithKey:key iv:iv];

    return result;
}

- (NSString *) createSHA256:(id)src {
    return [self createSHA:src type:ShaType256];
}

- (NSString *) createSHA512:(id)src {
    return [self createSHA:src type:ShaType512];
}

- (NSString *) createSHA:(id)src type:(ShaType)type {
    
    NSString *source = nil;
    if ([src isKindOfClass:[NSNumber class]] == YES) {
        source = [(NSNumber *)src stringValue];
    } else {
        source = (NSString *)src;
    }
    
    const char *s = [source cStringUsingEncoding:NSASCIIStringEncoding];
    NSData *keyData = [NSData dataWithBytes:s length:strlen(s)];
    NSData *out = nil;
    if (type == ShaType256) {
        uint8_t digest[CC_SHA256_DIGEST_LENGTH]={0};
        CC_SHA256(keyData.bytes, keyData.length, digest);
        out=[NSData dataWithBytes:digest length:CC_SHA256_DIGEST_LENGTH];
    } else if (type == ShaType512) {
        uint8_t digest[CC_SHA512_DIGEST_LENGTH] = {0};
        CC_SHA512(keyData.bytes, keyData.length, digest);
        out = [NSData dataWithBytes:digest length:CC_SHA512_DIGEST_LENGTH];
    }
    
    NSString *hash=[out description];
    hash = [hash stringByReplacingOccurrencesOfString:@" " withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@"<" withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@">" withString:@""];
    return hash;
}

- (NSString *)addLeadingZero:(int)digit source:(NSString *)source{
    while (source.length < digit) {
        source = [NSString stringWithFormat:@"0%@",source];
    }
    return [source substringFromIndex:(source.length - digit)];
}

@end
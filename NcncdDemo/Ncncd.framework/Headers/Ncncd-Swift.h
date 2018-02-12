// Generated by Apple Swift version 4.0.3 effective-3.2.3 (swiftlang-900.0.74.1 clang-900.0.39.2)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_attribute(external_source_symbol)
# define SWIFT_STRINGIFY(str) #str
# define SWIFT_MODULE_NAMESPACE_PUSH(module_name) _Pragma(SWIFT_STRINGIFY(clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in=module_name, generated_declaration))), apply_to=any(function, enum, objc_interface, objc_category, objc_protocol))))
# define SWIFT_MODULE_NAMESPACE_POP _Pragma("clang attribute pop")
#else
# define SWIFT_MODULE_NAMESPACE_PUSH(module_name)
# define SWIFT_MODULE_NAMESPACE_POP
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR __attribute__((enum_extensibility(open)))
# else
#  define SWIFT_ENUM_ATTR
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_ATTR SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if __has_feature(modules)
@import ObjectiveC;
@import UIKit;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

SWIFT_MODULE_NAMESPACE_PUSH("Ncncd")

SWIFT_CLASS("_TtC5Ncncd11BloodOxygen")
@interface BloodOxygen : NSObject
@property (nonatomic) float average;
@property (nonatomic) float max;
@property (nonatomic) float min;
@property (nonatomic) NSInteger beginTime;
@property (nonatomic) NSInteger endTime;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd14BloodOxygenApi")
@interface BloodOxygenApi : NSObject
/// 上传血氧数据
/// \param appKey AppKey
///
/// \param appSecret AppSecret
///
/// \param data 血氧数据
///
/// \param telephone 电话
///
+ (void)uploadBloodOxygenWithData:(NSArray<BloodOxygen *> * _Nonnull)data telephone:(NSString * _Nonnull)telephone;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd13BloodPressure")
@interface BloodPressure : NSObject
@property (nonatomic) NSInteger diastolic;
@property (nonatomic) NSInteger systolic;
@property (nonatomic) NSInteger sampleTime;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd16BloodPressureApi")
@interface BloodPressureApi : NSObject
/// 上传血压数据
/// \param appKey AppKey
///
/// \param appSecret AppSecret
///
/// \param data 血压数据
///
/// \param telephone 电话
///
+ (void)uploadBloodPressureWithData:(NSArray<BloodPressure *> * _Nonnull)data telephone:(NSString * _Nonnull)telephone;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd10BloodSugar")
@interface BloodSugar : NSObject
@property (nonatomic) NSInteger type;
@property (nonatomic) float value;
@property (nonatomic) NSInteger sampleTime;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd13BloodSugarApi")
@interface BloodSugarApi : NSObject
/// 上传血糖数据
/// \param appKey AppKey
///
/// \param appSecret AppSecret
///
/// \param data 血糖数据
///
/// \param telephone 电话
///
+ (void)uploadBloodSugarWithData:(NSArray<BloodSugar *> * _Nonnull)data telephone:(NSString * _Nonnull)telephone;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd14Cardiovascular")
@interface Cardiovascular : NSObject
@property (nonatomic) float bloodLipid;
@property (nonatomic) float vascularElasticity;
@property (nonatomic) float coronaryElasticity;
@property (nonatomic) float cerebralVascularElasticity;
@property (nonatomic) float brainSupplyBlood;
@property (nonatomic) float myocardialOxygen;
@property (nonatomic) float cholesterolCrystallization;
@property (nonatomic) float heartbeatOutput;
@property (nonatomic) float minuteOutput;
@property (nonatomic) float myocardialBlood;
@property (nonatomic) float vascularResistance;
@property (nonatomic) float pulmonaryArterialPressure;
@property (nonatomic) NSInteger sampleTime;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd17CardiovascularApi")
@interface CardiovascularApi : NSObject
/// 上传心脑血管数据
/// \param appKey AppKey
///
/// \param appSecret AppSecret
///
/// \param data 心脑血管数据
///
/// \param telephone 电话
///
+ (void)uploadCardiovascularWithData:(NSArray<Cardiovascular *> * _Nonnull)data telephone:(NSString * _Nonnull)telephone;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd11Cholesterol")
@interface Cholesterol : NSObject
@property (nonatomic) float uric;
@property (nonatomic) float totalCholesterol;
@property (nonatomic) float triglycerides;
@property (nonatomic) float highDensityProtein;
@property (nonatomic) float lowDensityProtein;
@property (nonatomic) NSInteger sampleTime;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd14CholesterolApi")
@interface CholesterolApi : NSObject
/// 上传胆固醇数据
/// \param appKey AppKey
///
/// \param appSecret AppSecret
///
/// \param data 胆固醇数据
///
/// \param telephone 电话
///
+ (void)uploadCholesterolWithData:(NSArray<Cholesterol *> * _Nonnull)data telephone:(NSString * _Nonnull)telephone;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd9Digestive")
@interface Digestive : NSObject
@property (nonatomic) float liverRed;
@property (nonatomic) float liverFat;
@property (nonatomic) float proteinMetabolism;
@property (nonatomic) float gastricPeristalsis;
@property (nonatomic) float gastricAbsorption;
@property (nonatomic) float smallIntestinePeristalsis;
@property (nonatomic) float smallIntestineAbsorption;
@property (nonatomic) NSInteger sampleTime;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd12DigestiveApi")
@interface DigestiveApi : NSObject
/// 上传消化系统数据
/// \param appKey AppKey
///
/// \param appSecret AppSecret
///
/// \param data 消化系统数据
///
/// \param telephone 电话
///
+ (void)uploadDigestiveWithData:(NSArray<Digestive *> * _Nonnull)data telephone:(NSString * _Nonnull)telephone;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd9Endocrine")
@interface Endocrine : NSObject
@property (nonatomic) float insulin;
@property (nonatomic) float thyroxine;
@property (nonatomic) float adrenaline;
@property (nonatomic) float pineal;
@property (nonatomic) NSInteger sampleTime;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd12EndocrineApi")
@interface EndocrineApi : NSObject
/// 上传内分泌数据
/// \param appKey AppKey
///
/// \param appSecret AppSecret
///
/// \param data 内分泌数据
///
/// \param telephone 电话
///
+ (void)uploadEndocrineWithData:(NSArray<Endocrine *> * _Nonnull)data telephone:(NSString * _Nonnull)telephone;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd8Eyesight")
@interface Eyesight : NSObject
@property (nonatomic) float leftEye;
@property (nonatomic) float rightEye;
@property (nonatomic) NSInteger sampleTime;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd11EyesightApi")
@interface EyesightApi : NSObject
/// 上传视力数据
/// \param appKey AppKey
///
/// \param appSecret AppSecret
///
/// \param data 视力数据
///
/// \param telephone 电话
///
+ (void)uploadEyesightWithData:(NSArray<Eyesight *> * _Nonnull)data telephone:(NSString * _Nonnull)telephone;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd18FemaleReproductive")
@interface FemaleReproductive : NSObject
@property (nonatomic) float endocrineImbalanceCoefficient;
@property (nonatomic) float vaginitisCoefficient;
@property (nonatomic) float adnexitisCoefficient;
@property (nonatomic) NSInteger sampleTime;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd21FemaleReproductiveApi")
@interface FemaleReproductiveApi : NSObject
/// 上传女性数据
/// \param appKey AppKey
///
/// \param appSecret AppSecret
///
/// \param data 女性数据
///
/// \param telephone 电话
///
+ (void)uploadFemaleReproductiveWithData:(NSArray<FemaleReproductive *> * _Nonnull)data telephone:(NSString * _Nonnull)telephone;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd17HarmfulSubstances")
@interface HarmfulSubstances : NSObject
@property (nonatomic) float heavyMetal;
@property (nonatomic) float pb;
@property (nonatomic) float mercury;
@property (nonatomic) float arsenic;
@property (nonatomic) float electronicRadiation;
@property (nonatomic) float pesticideResidues;
@property (nonatomic) NSInteger sampleTime;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd20HarmfulSubstancesApi")
@interface HarmfulSubstancesApi : NSObject
/// 上传有害物质数据
/// \param appKey AppKey
///
/// \param appSecret AppSecret
///
/// \param data 营养状态数据
///
/// \param telephone 电话
///
+ (void)uploadHarmfulSubstancesWithData:(NSArray<HarmfulSubstances *> * _Nonnull)data telephone:(NSString * _Nonnull)telephone;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd6Health")
@interface Health : NSObject
@property (nonatomic) float bmi;
@property (nonatomic) float bodyFat;
@property (nonatomic) float muscleRate;
@property (nonatomic) float moistureRate;
@property (nonatomic) float bmd;
@property (nonatomic) float bmr;
@property (nonatomic) NSInteger sampleTime;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd9HealthApi")
@interface HealthApi : NSObject
/// 上传健康数据
/// \param appKey AppKey
///
/// \param appSecret AppSecret
///
/// \param data 健康数据
///
/// \param telephone 电话
///
+ (void)uploadHealthWithData:(NSArray<Health *> * _Nonnull)data telephone:(NSString * _Nonnull)telephone;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd9HeartRate")
@interface HeartRate : NSObject
@property (nonatomic) float average;
@property (nonatomic) float max;
@property (nonatomic) float min;
@property (nonatomic) NSInteger beginTime;
@property (nonatomic) NSInteger endTime;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd12HeartRateApi")
@interface HeartRateApi : NSObject
/// 上传心率数据
/// \param appKey AppKey
///
/// \param appSecret AppSecret
///
/// \param data 心率数据
///
/// \param telephone 电话
///
+ (void)uploadHeartRateWithData:(NSArray<HeartRate *> * _Nonnull)data telephone:(NSString * _Nonnull)telephone;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd6Immune")
@interface Immune : NSObject
@property (nonatomic) float lymphIndex;
@property (nonatomic) float spleenIndex;
@property (nonatomic) float immunoglobulinIndex;
@property (nonatomic) float tonsilImmuneIndex;
@property (nonatomic) float digestiveImmuneIndex;
@property (nonatomic) float respiratoryImmuneIndex;
@property (nonatomic) NSInteger sampleTime;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd9ImmuneApi")
@interface ImmuneApi : NSObject
/// 上传免疫数据
/// \param appKey AppKey
///
/// \param appSecret AppSecret
///
/// \param data 免疫数据
///
/// \param telephone 电话
///
+ (void)uploadImmuneWithData:(NSArray<Immune *> * _Nonnull)data telephone:(NSString * _Nonnull)telephone;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd16MaleReproductive")
@interface MaleReproductive : NSObject
@property (nonatomic) float testosterone;
@property (nonatomic) float erectileConductivity;
@property (nonatomic) float gonadotropin;
@property (nonatomic) float prostateHyperplasia;
@property (nonatomic) BOOL prostatitis;
@property (nonatomic) float prostatitisCalcification;
@property (nonatomic) NSInteger sampleTime;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd19MaleReproductiveApi")
@interface MaleReproductiveApi : NSObject
/// 上传男性数据
/// \param appKey AppKey
///
/// \param appSecret AppSecret
///
/// \param data 男性数据
///
/// \param telephone 电话
///
+ (void)uploadMaleReproductiveWithData:(NSArray<MaleReproductive *> * _Nonnull)data telephone:(NSString * _Nonnull)telephone;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd14NcncdConfigure")
@interface NcncdConfigure : NSObject
/// 初始化配置
/// \param appKey appKey
///
/// \param appSecret appSecret
///
+ (void)initConfigureWithAppKey:(NSString * _Nonnull)appKey appSecret:(NSString * _Nonnull)appSecret SWIFT_METHOD_FAMILY(none);
/// 初始化配置
/// \param appKey appKey
///
/// \param appSecret appSecret
///
/// \param httpApi ip:port
///
+ (void)initConfigureWithAppKey:(NSString * _Nonnull)appKey appSecret:(NSString * _Nonnull)appSecret httpApi:(NSString * _Nonnull)httpApi SWIFT_METHOD_FAMILY(none);
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UITouch;
@class UIEvent;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC5Ncncd15NcncdRegisterVC")
@interface NcncdRegisterVC : UIViewController
- (void)viewDidLoad;
/// 回收键盘
/// \param touches 
///
/// \param event 
///
- (void)touchesBegan:(NSSet<UITouch *> * _Nonnull)touches withEvent:(UIEvent * _Nullable)event;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd11Nutritional")
@interface Nutritional : NSObject
@property (nonatomic) float vitaminE;
@property (nonatomic) float vitaminD3;
@property (nonatomic) float vitaminA;
@property (nonatomic) float vitaminC;
@property (nonatomic) float vitaminK;
@property (nonatomic) float vitaminB12;
@property (nonatomic) float vitaminB1;
@property (nonatomic) float vitaminB2;
@property (nonatomic) float vitaminB3;
@property (nonatomic) float vitaminB6;
@property (nonatomic) float calcium;
@property (nonatomic) float iron;
@property (nonatomic) float selenium;
@property (nonatomic) float zinc;
@property (nonatomic) float folate;
@property (nonatomic) float coenzymeQ10;
@property (nonatomic) float amino;
@property (nonatomic) NSInteger sampleTime;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd14NutritionalApi")
@interface NutritionalApi : NSObject
/// 上传营养状态数据
/// \param appKey AppKey
///
/// \param appSecret AppSecret
///
/// \param data 营养状态数据
///
/// \param telephone 电话
///
+ (void)uploadNutritionalWithData:(NSArray<Nutritional *> * _Nonnull)data telephone:(NSString * _Nonnull)telephone;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd11Respiratory")
@interface Respiratory : NSObject
@property (nonatomic) float capacity;
@property (nonatomic) float airwayResistance;
@property (nonatomic) NSInteger sampleTime;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd14RespiratoryApi")
@interface RespiratoryApi : NSObject
/// 上传呼吸系统数据
/// \param appKey AppKey
///
/// \param appSecret AppSecret
///
/// \param data 呼吸系统数据
///
/// \param telephone 电话
///
+ (void)uploadRespiratoryWithData:(NSArray<Respiratory *> * _Nonnull)data telephone:(NSString * _Nonnull)telephone;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd8Skeletal")
@interface Skeletal : NSObject
@property (nonatomic) BOOL osteoporosis;
@property (nonatomic) float calciumLost;
@property (nonatomic) BOOL hyperplasia;
@property (nonatomic) float cervicalCalcification;
@property (nonatomic) float lumbarCalcification;
@property (nonatomic) float rheumatismCoefficient;
@property (nonatomic) float ultrasonicSpeed;
@property (nonatomic) NSInteger boneAge;
@property (nonatomic) float boneDensity;
@property (nonatomic) float fractureRisk;
@property (nonatomic) NSInteger sampleTime;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd11SkeletalApi")
@interface SkeletalApi : NSObject
/// 上传骨骼系统数据
/// \param appKey AppKey
///
/// \param appSecret AppSecret
///
/// \param data 骨骼系统数据
///
/// \param telephone 电话
///
+ (void)uploadSkeletalWithData:(NSArray<Skeletal *> * _Nonnull)data telephone:(NSString * _Nonnull)telephone;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd4Skin")
@interface Skin : NSObject
@property (nonatomic) float collagenIndex;
@property (nonatomic) float oilIndex;
@property (nonatomic) float moistureIndex;
@property (nonatomic) float keratinIndex;
@property (nonatomic) NSInteger sampleTime;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd7SkinApi")
@interface SkinApi : NSObject
/// 上传皮肤数据
/// \param appKey AppKey
///
/// \param appSecret AppSecret
///
/// \param data 皮肤数据
///
/// \param telephone 电话
///
+ (void)uploadSkinWithData:(NSArray<Skin *> * _Nonnull)data telephone:(NSString * _Nonnull)telephone;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd5Sleep")
@interface Sleep : NSObject
@property (nonatomic) NSInteger totalDuration;
@property (nonatomic) NSInteger effectiveDuration;
@property (nonatomic) NSInteger deepDuration;
@property (nonatomic) NSInteger lightDuration;
@property (nonatomic) NSInteger beginTime;
@property (nonatomic) NSInteger endTime;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd8SleepApi")
@interface SleepApi : NSObject
/// 上传睡眠数据
/// \param appKey AppKey
///
/// \param appSecret AppSecret
///
/// \param data 睡眠数据
///
/// \param telephone 电话
///
+ (void)uploadSleepWithData:(NSArray<Sleep *> * _Nonnull)data telephone:(NSString * _Nonnull)telephone;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd5Sport")
@interface Sport : NSObject
@property (nonatomic) NSInteger step;
@property (nonatomic) NSInteger distance;
@property (nonatomic) NSInteger beginTime;
@property (nonatomic) NSInteger endTime;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd8SportApi")
@interface SportApi : NSObject
/// 上传运动数据
/// \param appKey AppKey
///
/// \param appSecret AppSecret
///
/// \param data 运动数据
///
/// \param telephone 电话
///
+ (void)uploadSportWithData:(NSArray<Sport *> * _Nonnull)data telephone:(NSString * _Nonnull)telephone;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd11Temperature")
@interface Temperature : NSObject
@property (nonatomic) float average;
@property (nonatomic) float max;
@property (nonatomic) float min;
@property (nonatomic) NSInteger beginTime;
@property (nonatomic) NSInteger endTime;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd14TemperatureApi")
@interface TemperatureApi : NSObject
/// 上传体温数据
/// \param appKey AppKey
///
/// \param appSecret AppSecret
///
/// \param data 体温数据
///
/// \param telephone 电话
///
+ (void)uploadTemperatureWithData:(NSArray<Temperature *> * _Nonnull)data telephone:(NSString * _Nonnull)telephone;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd4User")
@interface User : NSObject
@property (nonatomic) NSInteger sex;
@property (nonatomic) float weight;
@property (nonatomic) NSInteger height;
@property (nonatomic, copy) NSString * _Nonnull birthday;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Ncncd7UserApi")
@interface UserApi : NSObject
/// 上次用户信息
/// \param data 用户数据
///
/// \param telephone 电话
///
+ (void)uploadUserWithData:(User * _Nonnull)data telephone:(NSString * _Nonnull)telephone;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

SWIFT_MODULE_NAMESPACE_POP
#pragma clang diagnostic pop

//
//  Regular.m
//  huochepiao
//
//  Created by Jie on 14-4-24.
//  Copyright (c) 2014年 huochepiao. All rights reserved.
//

#import "Regular.h"

@implementation Regular

#pragma mark - 正则表达 有以下
/*
    所有涉及的密码在第一个版本里面规则都是六位纯数字
 */
+ (BOOL) password:(NSString*)passw{
    NSString *strRegex = @"[0-9]{6}";
    BOOL rt = [Regular isValidateRegularDestination:passw byExpression:strRegex];
    if (rt) {
        NSLog(@"YES");
    }else{
        NSLog(@"NO");
    }
    return rt;
}
#pragma mark - 匹配18位身份证号
+ (BOOL)id18NumberIsRegular:(NSString *)number
{
    NSString * regex = @"^(\\d{6})(\\d{4})(\\d{2})(\\d{2})(\\d{3})([0-9]|X)$";
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([predicate evaluateWithObject:number] == YES) {
        
        return YES;
    }
    return NO;
}


#pragma mark - 下面是参考demo
+ (BOOL) numberString:(NSString *)numberString IsLength:(int)length//验证numberString是否为length位纯数字
{
    NSString *strRegex = [NSString stringWithFormat:@"^\\d{%d}$",length];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",strRegex];
    if ([predicate evaluateWithObject:numberString] == YES)
    {
        return YES;
    }
    return NO;
}
+ (BOOL) phoneIsRegular:(NSString *)phoneStr
{
    NSString * regex = @"[1][0-9]{10}";
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([predicate evaluateWithObject:phoneStr] == YES) {
        
        return YES;
    }
    return NO;
}
+ (BOOL) isValidateTelNumber:(NSString*)number//电话号码验证
{
    NSString *strRegex = @"[1][0-9]{10}";//@"[0-9]{1,20}";
    BOOL rt = [Regular isValidateRegularDestination:number byExpression:strRegex];
    if (rt) {
        NSLog(@"YES是电话号码");
    }else{
        NSLog(@"NO不是电话号码");
    }
    return rt;

}

+ (BOOL) isYanZhengMa:(NSString*)number//验证码
{
    NSString *strRegex = @"[0-9]{6}";//@"[0-9]{1,20}";
    BOOL rt = [Regular isValidateRegularDestination:number byExpression:strRegex];
    if (rt) {
        NSLog(@"YES");
    }else{
        NSLog(@"NO");
    }
    return rt;
}
+ (BOOL) isZipCode:(NSString*)number//邮编验证
{
    NSString *strRegex = @"[1-9]\\d{5}(?!\\d)";
    BOOL rt = [Regular isValidateRegularDestination:number byExpression:strRegex];
    if (rt) {
        NSLog(@"YES是邮编");
    }else{
        NSLog(@"NO不是邮编");
    }
    return rt;
}
//+ (BOOL) isIds:(NSString*)number//身份证号验证
//{
//    
//    NSString *strRegex = @"[0-9]{6}";
//    BOOL rt = [Regular isValidateRegularDestination:number byExpression:strRegex];
//    if (rt) {
//        NSLog(@"YES是邮编");
//    }else{
//        NSLog(@"NO不是邮编");
//    }
//    return rt;
//}
+ (BOOL) isValidateEmail:(NSString*)email//邮箱验证
{
    NSString *strRegex = @"[A-Z0-9a-z.%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1-5}";
    BOOL rt = [Regular isValidateRegularDestination:email byExpression:strRegex];
    return rt;
}
+ (BOOL) isValidateRegularDestination:(NSString*)strDestination byExpression:(NSString*)strExpression
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",strExpression];
    return [predicate evaluateWithObject:strDestination];
}
+ (BOOL) isZimu:(NSString*)string//字符串首字母是否为字母
{
    NSString * regex = @"[A-Za-z]+";
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:string];
}
+ (BOOL) isZim:(NSString*)string//字符串是否为字母
{
    NSString * regex = @"[A-Za-z]";
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:string];
}
+ (NSArray*) filterArray:(NSArray*)array With:(NSString*)str //对Array进行过滤
{
    NSPredicate *predecate = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@",str];
    NSLog(@"filterArray = %@",[array filteredArrayUsingPredicate:predecate]);
    return [array filteredArrayUsingPredicate:predecate];
}

//邮箱
+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|177[0-9])\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}


//车牌号验证
+ (BOOL) validateCarNo:(NSString *)carNo
{
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:carNo];
}


//车型
+ (BOOL) validateCarType:(NSString *)CarType
{
    NSString *CarTypeRegex = @"^[\u4E00-\u9FFF]+$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CarTypeRegex];
    return [carTest evaluateWithObject:CarType];
}


//用户名
+ (BOOL)validateUserName:(NSString *)name
{
    // 6 － 18 位  大小写字母和数字组成
    NSString *userNameRegex = @"^[A-Za-z0-9]{6,18}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    BOOL B = [userNamePredicate evaluateWithObject:name];
    return B;
}


//密码
+ (BOOL) validatePassword:(NSString *)passWord
{
    NSString *passWordRegex = @"^[0-9]{6,8}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}


//昵称
+ (BOOL) validateNickname:(NSString *)nickname
{
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:nickname];
}

//姓名
+ (BOOL) validateName:(NSString *)name
{
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{2,10}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:name];
}
//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    // NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSString *regex2 = @"^(\\d{17})(\\d|[xX])$";
    //NSString *regex2 = @"^[1-9]\\d{5} [1-2]\\d{3}((0[1-9])|(1[0-2]))((([0][1-9])|([1|2]\\d))|3[0-1])\\d{3}(\\d|X|x)$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}
- (NSString*)FirstName
{

    NSString *string = @"｜张｜张｜张｜张｜张｜张｜张｜";
    return string;
    
}

// 中文
+ (BOOL) isChinaText:(NSString *)chinaStr
{
    NSString * regular = @"^[\u4E00-\u9FA5]+$";
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regular];
    return [predicate evaluateWithObject:chinaStr];
}
/*
 * 身份证15位编码规则：dddddd yymmdd xx p
 * dddddd：6位地区编码
 * yymmdd: 出生年(两位年)月日，如：910215
 * xx: 顺序编码，系统产生，无法确定
 * p: 性别，奇数为男，偶数为女
 *
 * 身份证18位编码规则：dddddd yyyymmdd xxx y
 * dddddd：6位地区编码
 * yyyymmdd: 出生年(四位年)月日，如：19910215
 * xxx：顺序编码，系统产生，无法确定，奇数为男，偶数为女
 * y: 校验码，该位数值可通过前17位计算获得
 *
 * 前17位号码加权因子为 Wi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ]
 * 验证位 Y = [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ]
 * 如果验证码恰好是10，为了保证身份证是十八位，那么第十八位将用X来代替
 * 校验位计算公式：Y_P = mod( ∑(Ai×Wi),11 )
 * i为身份证号码1...17 位; Y_P为校验码Y所在校验码数组位置
 */
//function validateIdCard(idCard)
//+ (BOOL) vlidateIdentityCard: (NSString *)identityCard
//{
//    //15位和18位身份证号码的正则表达式
//    //var regIdCard=/^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
//    NSString *regex2 = @"/^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$/";
//    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
//    //如果通过该验证，说明身份证格式正确，但准确性还需计算
//    if([identityCardPredicate evaluateWithObject:identityCard]){
//        if(identityCard.length==18){
//            var idCardWi=new Array( 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ); //将前17位加权因子保存在数组里
//            var idCardY=new Array( 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ); //这是除以11后，可能产生的11位余数、验证码，也保存成数组
//            var idCardWiSum=0; //用来保存前17位各自乖以加权因子后的总和
//            for(var i=0;i<17;i++){
//                idCardWiSum+=idCard.substring(i,i+1)*idCardWi[i];
//            }
//            
//            var idCardMod=idCardWiSum%11;//计算出校验码所在数组的位置
//            var idCardLast=idCard.substring(17);//得到最后一位身份证号码
//            
//            //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
//            if(idCardMod==2){
//                if(idCardLast=="X"||idCardLast=="x"){
//                    alert("恭喜通过验证啦！");
//                }else{
//                    alert("身份证号码错误！");
//                }
//            }else{
//                //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
//                if(idCardLast==idCardY[idCardMod]){
//                    alert("恭喜通过验证啦！");
//                }else{
//                    alert("身份证号码错误！");
//                }
//            }
//        } 
//    }else{
//        alert("身份证格式不正确!");
//    }
//}


//1、简单的正则表达式：
//
//（1）preg_match("/^(\d{18,18}|\d{15,15}|\d{17,17}x)$/",$id_card)
//（2）preg_match("/^(\d{6})(18|19|20)?(\d{2})([01]\d)([0123]\d)(\d{3})(\d|X)?$/",$id_card)
//（3）preg_match("/(^\d{15}$/)|(\d{17}(?:\d|x|X)$/),$id_card)
//              
//              2、复杂并且严格一些的验证：
//              
//              //这个可以验证15位和18位的身份证，并且包含生日和校验位的验证。
//              //如果有兴趣，还可以加上身份证所在地的验证，就是前6位有些数字合法有些数字不合法。
//              
//              function isIdCardNo(num)
//{
//    num = num.toUpperCase();
//    //身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X。
//    if (!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(num)))
//    {
//        alert('输入的身份证号长度不对，或者号码不符合规定！\n15位号码应全为数字，18位号码末位可以为数字或X。');
//        return false;
//    }
//    //校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
//    //下面分别分析出生日期和校验位
//    var len, re;
//    len = num.length;
//    if (len == 15)
//    {
//        re = new RegExp(/^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/);
//        var arrSplit = num.match(re);
//        
//        //检查生日日期是否正确
//        var dtmBirth = new Date('19' + arrSplit[2] + '/' + arrSplit[3] + '/' + arrSplit[4]);
//        var bGoodDay;
//        bGoodDay = (dtmBirth.getYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4]));
//        if (!bGoodDay)
//        {
//            alert('输入的身份证号里出生日期不对！');
//            return false;
//        }
//        else
//        {
//            //将15位身份证转成18位
//            //校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
//            var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
//            var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
//            var nTemp = 0, i;
//            num = num.substr(0, 6) + '19' + num.substr(6, num.length - 6);
//            for(i = 0; i < 17; i ++)
//            {
//                nTemp += num.substr(i, 1) * arrInt[i];
//            }
//            num += arrCh[nTemp % 11];
//            return num;
//        }
//    }
//    if (len == 18)
//    {
//        re = new RegExp(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/);
//        var arrSplit = num.match(re);
//        
//        //检查生日日期是否正确
//        var dtmBirth = new Date(arrSplit[2] + "/" + arrSplit[3] + "/" + arrSplit[4]);
//        var bGoodDay;
//        bGoodDay = (dtmBirth.getFullYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4]));
//        if (!bGoodDay)
//        {
//            alert(dtmBirth.getYear());
//            alert(arrSplit[2]);
//            alert('输入的身份证号里出生日期不对！');
//            return false;
//        }
//        else
//        {
//            //检验18位身份证的校验码是否正确。
//            //校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
//            var valnum;
//            var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
//            var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
//            var nTemp = 0, i;
//            for(i = 0; i < 17; i ++)
//            {
//                nTemp += num.substr(i, 1) * arrInt[i];
//            }
//            valnum = arrCh[nTemp % 11];
//            if (valnum != num.substr(17, 1))
//            {
//                alert('18位身份证的校验码不正确！应该为：' + valnum);
//                return false;
//            }
//            return num;
//        }
//    }
//    return false;
//}
//              3、严格的验证：
//              
//              <script>
//              var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "}
//              
//              function cidInfo(sId){
//                  var iSum=0
//                  var info=""
//                  if(!/^d{17}(d|x)$/i.test(sId))return false;
//                  sId=sId.replace(/x$/i,"a");
//                  if(aCity[parseInt(sId.substr(0,2))]==null)return "Error:非法地区";
//                  sBirthday=sId.substr(6,4)+"-"+Number(sId.substr(10,2))+"-"+Number(sId.substr(12,2));
//                  var d=new Date(sBirthday.replace(/-/g,"/"))
//                  if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate()))return "Error:非法生日";
//                  for(var i = 17;i>=0;i --) iSum += (Math.pow(2,i) % 11) * parseInt(sId.charAt(17 - i),11)
//                      if(iSum%11!=1)return "Error:非法证号";
//                  return aCity[parseInt(sId.substr(0,2))]+","+sBirthday+","+(sId.substr(16,1)%2?"男":"女")
//              }
//              document.write(cidInfo("380524198002300016"),"<br/>");
//              document.write(cidInfo("340524198002300019"),"<br/>")
//              document.write(cidInfo("340524197711111111"),"<br/>")
//              document.write(cidInfo("34052419800101001x"),"<br/>");
//              </script>
@end

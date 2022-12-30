import '../features/authentication/data/otp/rx.dart';
import '../features/authentication/data/rx_email/rx.dart';
import '../features/authentication/data/rx_forget_pw/rx.dart';
import '../features/authentication/data/rx_login/rx.dart';
import '../features/authentication/data/signup/rx.dart';

import '../features/leaverequest/data/rx_get_leave_type/rx.dart';
import '../features/dashboard/data/rx_post_leave_req/rx.dart';
import '../features/dashboard/data/rx_get_notice_list/rx.dart';
import '../features/leaverequest/data/rx_post_leave_req/rx.dart';
import '../features/notice/data/rx_get_notice_detail/rx.dart';
import '../features/profile/data/rx_get_leave_type/rx.dart';

GetSignUpRX getSignUpRXObj = GetSignUpRX();
VerifyOtpRX getVerifyOtpRXObj = VerifyOtpRX();
GetLoginRX getLoginRXObj = GetLoginRX();
GetNoticeListRX getNoticeRXObj = GetNoticeListRX();

GetLeaveTypeReqRX getLeaveTypeReqRXObj = GetLeaveTypeReqRX();
PostLeaveReqRX postLeaveReqRXObj = PostLeaveReqRX();

PostForgetEmailRX postForgetEmailRXObj = PostForgetEmailRX();
PostForgertPwRX postForgertPwRXObj = PostForgertPwRX();

GetLeaveReqListRX getLeaveReqListRXObj = GetLeaveReqListRX();
GetNoticeDetailRX getNoticeDetailRXObj = GetNoticeDetailRX();
GetProfileReqRX getProfileReqRXObj = GetProfileReqRX();

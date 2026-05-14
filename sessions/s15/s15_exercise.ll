; ModuleID = 's15_exercise.cpp'
source_filename = "s15_exercise.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.50.35729"

%"class.std::basic_ostream" = type { ptr, [4 x i8], i32, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", ptr, ptr, i8 }
%"class.std::ios_base" = type { ptr, i64, i32, i32, i32, i64, i64, ptr, ptr, ptr }
%rtti.TypeDescriptor26 = type { ptr, ptr, [27 x i8] }
%eh.CatchableType = type { i32, i32, i32, i32, i32, i32, i32 }
%rtti.TypeDescriptor22 = type { ptr, ptr, [23 x i8] }
%rtti.TypeDescriptor23 = type { ptr, ptr, [24 x i8] }
%rtti.TypeDescriptor19 = type { ptr, ptr, [20 x i8] }
%eh.CatchableTypeArray.5 = type { i32, [5 x i32] }
%eh.ThrowInfo = type { i32, i32, i32, i32 }
%"union.std::error_category::_Addr_storage" = type { i64 }
%rtti.CompleteObjectLocator = type { i32, i32, i32, i32, i32, i32 }
%rtti.TypeDescriptor35 = type { ptr, ptr, [36 x i8] }
%rtti.ClassHierarchyDescriptor = type { i32, i32, i32, i32 }
%rtti.BaseClassDescriptor = type { i32, i32, i32, i32, i32, i32, i32 }
%rtti.TypeDescriptor24 = type { ptr, ptr, [25 x i8] }
%rtti.TypeDescriptor30 = type { ptr, ptr, [31 x i8] }
%eh.CatchableTypeArray.3 = type { i32, [3 x i32] }
%struct.Task = type { %"struct.std::coroutine_handle" }
%"struct.std::coroutine_handle" = type { ptr }
%"?simple@@YA?AUTask@@XZ.Frame" = type { ptr, ptr, %"struct.Task::promise_type", i64 }
%"struct.Task::promise_type" = type { i8 }
%"class.std::error_code" = type { i32, ptr }
%"class.std::ios_base::failure" = type { %"class.std::system_error" }
%"class.std::system_error" = type { %"class.std::_System_error" }
%"class.std::_System_error" = type { %"class.std::runtime_error", %"class.std::error_code" }
%"class.std::runtime_error" = type { %"class.std::exception" }
%"class.std::exception" = type { ptr, %struct.__std_exception_data }
%struct.__std_exception_data = type { ptr, i8 }
%"class.std::basic_ostream<char>::sentry" = type { %"class.std::basic_ostream<char>::_Sentry_base", i8 }
%"class.std::basic_ostream<char>::_Sentry_base" = type { ptr }
%"class.std::basic_string" = type { %"class.std::_Compressed_pair" }
%"class.std::_Compressed_pair" = type { %"class.std::_String_val" }
%"class.std::_String_val" = type { %"union.std::_String_val<std::_Simple_types<char>>::_Bxty", i64, i64 }
%"union.std::_String_val<std::_Simple_types<char>>::_Bxty" = type { ptr, [8 x i8] }
%"class.std::error_condition" = type { i32, ptr }
%"class.std::bad_array_new_length" = type { %"class.std::bad_alloc" }
%"class.std::bad_alloc" = type { %"class.std::exception" }

$"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z" = comdat any

$"?setstate@?$basic_ios@DU?$char_traits@D@std@@@std@@QEAAXH_N@Z" = comdat any

$"??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ" = comdat any

$"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ" = comdat any

$"??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ" = comdat any

$"??0failure@ios_base@std@@QEAA@PEBDAEBVerror_code@2@@Z" = comdat any

$"??0failure@ios_base@std@@QEAA@AEBV012@@Z" = comdat any

$"??0system_error@std@@QEAA@AEBV01@@Z" = comdat any

$"??0_System_error@std@@QEAA@AEBV01@@Z" = comdat any

$"??0runtime_error@std@@QEAA@AEBV01@@Z" = comdat any

$"??0exception@std@@QEAA@AEBV01@@Z" = comdat any

$"??1exception@std@@UEAA@XZ" = comdat any

$"?name@_Iostream_error_category2@std@@UEBAPEBDXZ" = comdat any

$"?message@_Iostream_error_category2@std@@UEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@H@Z" = comdat any

$"?default_error_condition@error_category@std@@UEBA?AVerror_condition@2@H@Z" = comdat any

$"?equivalent@error_category@std@@UEBA_NAEBVerror_code@2@H@Z" = comdat any

$"?equivalent@error_category@std@@UEBA_NHAEBVerror_condition@2@@Z" = comdat any

$"??_G_Iostream_error_category2@std@@UEAAPEAXI@Z" = comdat any

$"?_Xlen_string@std@@YAXXZ" = comdat any

$"?_Throw_bad_array_new_length@std@@YAXXZ" = comdat any

$"??0bad_array_new_length@std@@QEAA@AEBV01@@Z" = comdat any

$"??0bad_alloc@std@@QEAA@AEBV01@@Z" = comdat any

$"?what@exception@std@@UEBAPEBDXZ" = comdat any

$"??_Gexception@std@@UEAAPEAXI@Z" = comdat any

$"??_Gbad_alloc@std@@UEAAPEAXI@Z" = comdat any

$"??_Gbad_array_new_length@std@@UEAAPEAXI@Z" = comdat any

$"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z" = comdat any

$"??0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z" = comdat any

$"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ" = comdat any

$"?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z" = comdat any

$"??$_Reallocate_grow_by@V<lambda_1>@?0???$_Append@D@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV23@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0???$_Append@D@01@AEAAAEAV01@QEBD0@Z@PEBD_K@Z" = comdat any

$"??_Gruntime_error@std@@UEAAPEAXI@Z" = comdat any

$"??_G_System_error@std@@UEAAPEAXI@Z" = comdat any

$"??_Gsystem_error@std@@UEAAPEAXI@Z" = comdat any

$"??_Gfailure@ios_base@std@@UEAAPEAXI@Z" = comdat any

$"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ" = comdat any

$_Avx2WmemEnabledWeakValue = comdat any

$"??_C@_0BF@HGMNOGKH@simple?$CI?$CJ?5running?4?4?4?6?$AA@" = comdat any

$"??_C@_0BF@MDJKLCPE@Calling?5simple?$CI?$CJ?4?4?4?6?$AA@" = comdat any

$"??_C@_06MJLDIBBJ@Done?4?6?$AA@" = comdat any

$"??_C@_0BF@PHHKMMFD@ios_base?3?3badbit?5set?$AA@" = comdat any

$"??_C@_0BG@FMKFHCIL@ios_base?3?3failbit?5set?$AA@" = comdat any

$"??_C@_0BF@OOHOMBOF@ios_base?3?3eofbit?5set?$AA@" = comdat any

$"??_R0?AVfailure@ios_base@std@@@8" = comdat any

$"_CT??_R0?AVfailure@ios_base@std@@@8??0failure@ios_base@std@@QEAA@AEBV012@@Z40" = comdat any

$"??_R0?AVsystem_error@std@@@8" = comdat any

$"_CT??_R0?AVsystem_error@std@@@8??0system_error@std@@QEAA@AEBV01@@Z40" = comdat any

$"??_R0?AV_System_error@std@@@8" = comdat any

$"_CT??_R0?AV_System_error@std@@@8??0_System_error@std@@QEAA@AEBV01@@Z40" = comdat any

$"??_R0?AVruntime_error@std@@@8" = comdat any

$"_CT??_R0?AVruntime_error@std@@@8??0runtime_error@std@@QEAA@AEBV01@@Z24" = comdat any

$"??_R0?AVexception@std@@@8" = comdat any

$"_CT??_R0?AVexception@std@@@8??0exception@std@@QEAA@AEBV01@@Z24" = comdat any

$"_CTA5?AVfailure@ios_base@std@@" = comdat any

$"_TI5?AVfailure@ios_base@std@@" = comdat any

$"?_Static@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@1@XZ@4V21@B" = comdat any

$"??_7_Iostream_error_category2@std@@6B@" = comdat largest

$"??_R4_Iostream_error_category2@std@@6B@" = comdat any

$"??_R0?AV_Iostream_error_category2@std@@@8" = comdat any

$"??_R3_Iostream_error_category2@std@@8" = comdat any

$"??_R2_Iostream_error_category2@std@@8" = comdat any

$"??_R1A@?0A@EA@_Iostream_error_category2@std@@8" = comdat any

$"??_R1A@?0A@EA@error_category@std@@8" = comdat any

$"??_R0?AVerror_category@std@@@8" = comdat any

$"??_R3error_category@std@@8" = comdat any

$"??_R2error_category@std@@8" = comdat any

$"??_C@_08LLGCOLLL@iostream?$AA@" = comdat any

$"?_Iostream_error@?4??message@_Iostream_error_category2@std@@UEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@3@H@Z@4QBDB" = comdat any

$"??_C@_0BA@JFNIOLAK@string?5too?5long?$AA@" = comdat any

$"??_R0?AVbad_array_new_length@std@@@8" = comdat any

$"_CT??_R0?AVbad_array_new_length@std@@@8??0bad_array_new_length@std@@QEAA@AEBV01@@Z24" = comdat any

$"??_R0?AVbad_alloc@std@@@8" = comdat any

$"_CT??_R0?AVbad_alloc@std@@@8??0bad_alloc@std@@QEAA@AEBV01@@Z24" = comdat any

$"_CTA3?AVbad_array_new_length@std@@" = comdat any

$"_TI3?AVbad_array_new_length@std@@" = comdat any

$"??_C@_0BF@KINCDENJ@bad?5array?5new?5length?$AA@" = comdat any

$"??_7bad_array_new_length@std@@6B@" = comdat largest

$"??_R4bad_array_new_length@std@@6B@" = comdat any

$"??_R3bad_array_new_length@std@@8" = comdat any

$"??_R2bad_array_new_length@std@@8" = comdat any

$"??_R1A@?0A@EA@bad_array_new_length@std@@8" = comdat any

$"??_R1A@?0A@EA@bad_alloc@std@@8" = comdat any

$"??_R3bad_alloc@std@@8" = comdat any

$"??_R2bad_alloc@std@@8" = comdat any

$"??_R1A@?0A@EA@exception@std@@8" = comdat any

$"??_R3exception@std@@8" = comdat any

$"??_R2exception@std@@8" = comdat any

$"??_7bad_alloc@std@@6B@" = comdat largest

$"??_R4bad_alloc@std@@6B@" = comdat any

$"??_7exception@std@@6B@" = comdat largest

$"??_R4exception@std@@6B@" = comdat any

$"??_C@_0BC@EOODALEL@Unknown?5exception?$AA@" = comdat any

$"??_7failure@ios_base@std@@6B@" = comdat largest

$"??_R4failure@ios_base@std@@6B@" = comdat any

$"??_R3failure@ios_base@std@@8" = comdat any

$"??_R2failure@ios_base@std@@8" = comdat any

$"??_R1A@?0A@EA@failure@ios_base@std@@8" = comdat any

$"??_R1A@?0A@EA@system_error@std@@8" = comdat any

$"??_R3system_error@std@@8" = comdat any

$"??_R2system_error@std@@8" = comdat any

$"??_R1A@?0A@EA@_System_error@std@@8" = comdat any

$"??_R3_System_error@std@@8" = comdat any

$"??_R2_System_error@std@@8" = comdat any

$"??_R1A@?0A@EA@runtime_error@std@@8" = comdat any

$"??_R3runtime_error@std@@8" = comdat any

$"??_R2runtime_error@std@@8" = comdat any

$"??_7system_error@std@@6B@" = comdat largest

$"??_R4system_error@std@@6B@" = comdat any

$"??_7_System_error@std@@6B@" = comdat largest

$"??_R4_System_error@std@@6B@" = comdat any

$"??_C@_02LMMGGCAJ@?3?5?$AA@" = comdat any

$"??_7runtime_error@std@@6B@" = comdat largest

$"??_R4runtime_error@std@@6B@" = comdat any

@_Avx2WmemEnabledWeakValue = weak_odr dso_local local_unnamed_addr global i32 0, comdat, align 4
@"?cout@std@@3V?$basic_ostream@DU?$char_traits@D@std@@@1@A" = external dso_local global %"class.std::basic_ostream", align 8
@"??_C@_0BF@HGMNOGKH@simple?$CI?$CJ?5running?4?4?4?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [21 x i8] c"simple() running...\0A\00", comdat, align 1
@"??_C@_0BF@MDJKLCPE@Calling?5simple?$CI?$CJ?4?4?4?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [21 x i8] c"Calling simple()...\0A\00", comdat, align 1
@"??_C@_06MJLDIBBJ@Done?4?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"Done.\0A\00", comdat, align 1
@"??_C@_0BF@PHHKMMFD@ios_base?3?3badbit?5set?$AA@" = linkonce_odr dso_local unnamed_addr constant [21 x i8] c"ios_base::badbit set\00", comdat, align 1
@"??_C@_0BG@FMKFHCIL@ios_base?3?3failbit?5set?$AA@" = linkonce_odr dso_local unnamed_addr constant [22 x i8] c"ios_base::failbit set\00", comdat, align 1
@"??_C@_0BF@OOHOMBOF@ios_base?3?3eofbit?5set?$AA@" = linkonce_odr dso_local unnamed_addr constant [21 x i8] c"ios_base::eofbit set\00", comdat, align 1
@"??_7type_info@@6B@" = external constant ptr
@"??_R0?AVfailure@ios_base@std@@@8" = linkonce_odr global %rtti.TypeDescriptor26 { ptr @"??_7type_info@@6B@", ptr null, [27 x i8] c".?AVfailure@ios_base@std@@\00" }, comdat
@__ImageBase = external dso_local constant i8
@"_CT??_R0?AVfailure@ios_base@std@@@8??0failure@ios_base@std@@QEAA@AEBV012@@Z40" = linkonce_odr unnamed_addr constant %eh.CatchableType { i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVfailure@ios_base@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0, i32 -1, i32 0, i32 40, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??0failure@ios_base@std@@QEAA@AEBV012@@Z" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, section ".xdata", comdat
@"??_R0?AVsystem_error@std@@@8" = linkonce_odr global %rtti.TypeDescriptor22 { ptr @"??_7type_info@@6B@", ptr null, [23 x i8] c".?AVsystem_error@std@@\00" }, comdat
@"_CT??_R0?AVsystem_error@std@@@8??0system_error@std@@QEAA@AEBV01@@Z40" = linkonce_odr unnamed_addr constant %eh.CatchableType { i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVsystem_error@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0, i32 -1, i32 0, i32 40, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??0system_error@std@@QEAA@AEBV01@@Z" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, section ".xdata", comdat
@"??_R0?AV_System_error@std@@@8" = linkonce_odr global %rtti.TypeDescriptor23 { ptr @"??_7type_info@@6B@", ptr null, [24 x i8] c".?AV_System_error@std@@\00" }, comdat
@"_CT??_R0?AV_System_error@std@@@8??0_System_error@std@@QEAA@AEBV01@@Z40" = linkonce_odr unnamed_addr constant %eh.CatchableType { i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AV_System_error@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0, i32 -1, i32 0, i32 40, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??0_System_error@std@@QEAA@AEBV01@@Z" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, section ".xdata", comdat
@"??_R0?AVruntime_error@std@@@8" = linkonce_odr global %rtti.TypeDescriptor23 { ptr @"??_7type_info@@6B@", ptr null, [24 x i8] c".?AVruntime_error@std@@\00" }, comdat
@"_CT??_R0?AVruntime_error@std@@@8??0runtime_error@std@@QEAA@AEBV01@@Z24" = linkonce_odr unnamed_addr constant %eh.CatchableType { i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVruntime_error@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0, i32 -1, i32 0, i32 24, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??0runtime_error@std@@QEAA@AEBV01@@Z" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, section ".xdata", comdat
@"??_R0?AVexception@std@@@8" = linkonce_odr global %rtti.TypeDescriptor19 { ptr @"??_7type_info@@6B@", ptr null, [20 x i8] c".?AVexception@std@@\00" }, comdat
@"_CT??_R0?AVexception@std@@@8??0exception@std@@QEAA@AEBV01@@Z24" = linkonce_odr unnamed_addr constant %eh.CatchableType { i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVexception@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0, i32 -1, i32 0, i32 24, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??0exception@std@@QEAA@AEBV01@@Z" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, section ".xdata", comdat
@"_CTA5?AVfailure@ios_base@std@@" = linkonce_odr unnamed_addr constant %eh.CatchableTypeArray.5 { i32 5, [5 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"_CT??_R0?AVfailure@ios_base@std@@@8??0failure@ios_base@std@@QEAA@AEBV012@@Z40" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"_CT??_R0?AVsystem_error@std@@@8??0system_error@std@@QEAA@AEBV01@@Z40" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"_CT??_R0?AV_System_error@std@@@8??0_System_error@std@@QEAA@AEBV01@@Z40" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"_CT??_R0?AVruntime_error@std@@@8??0runtime_error@std@@QEAA@AEBV01@@Z24" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"_CT??_R0?AVexception@std@@@8??0exception@std@@QEAA@AEBV01@@Z24" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32)] }, section ".xdata", comdat
@"_TI5?AVfailure@ios_base@std@@" = linkonce_odr unnamed_addr constant %eh.ThrowInfo { i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??1exception@std@@UEAA@XZ" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"_CTA5?AVfailure@ios_base@std@@" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, section ".xdata", comdat
@"?_Static@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@1@XZ@4V21@B" = linkonce_odr dso_local constant { ptr, %"union.std::error_category::_Addr_storage" } { ptr @"??_7_Iostream_error_category2@std@@6B@", %"union.std::error_category::_Addr_storage" { i64 5 } }, comdat, align 8
@0 = private unnamed_addr constant { [7 x ptr] } { [7 x ptr] [ptr @"??_R4_Iostream_error_category2@std@@6B@", ptr @"??_E_Iostream_error_category2@std@@UEAAPEAXI@Z", ptr @"?name@_Iostream_error_category2@std@@UEBAPEBDXZ", ptr @"?message@_Iostream_error_category2@std@@UEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@H@Z", ptr @"?default_error_condition@error_category@std@@UEBA?AVerror_condition@2@H@Z", ptr @"?equivalent@error_category@std@@UEBA_NAEBVerror_code@2@H@Z", ptr @"?equivalent@error_category@std@@UEBA_NHAEBVerror_condition@2@@Z"] }, comdat($"??_7_Iostream_error_category2@std@@6B@")
@"??_R4_Iostream_error_category2@std@@6B@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 0, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AV_Iostream_error_category2@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3_Iostream_error_category2@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R4_Iostream_error_category2@std@@6B@" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R0?AV_Iostream_error_category2@std@@@8" = linkonce_odr global %rtti.TypeDescriptor35 { ptr @"??_7type_info@@6B@", ptr null, [36 x i8] c".?AV_Iostream_error_category2@std@@\00" }, comdat
@"??_R3_Iostream_error_category2@std@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 0, i32 2, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R2_Iostream_error_category2@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R2_Iostream_error_category2@std@@8" = linkonce_odr constant [3 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@_Iostream_error_category2@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@error_category@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0], comdat
@"??_R1A@?0A@EA@_Iostream_error_category2@std@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AV_Iostream_error_category2@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 1, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3_Iostream_error_category2@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R1A@?0A@EA@error_category@std@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVerror_category@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3error_category@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R0?AVerror_category@std@@@8" = linkonce_odr global %rtti.TypeDescriptor24 { ptr @"??_7type_info@@6B@", ptr null, [25 x i8] c".?AVerror_category@std@@\00" }, comdat
@"??_R3error_category@std@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 0, i32 1, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R2error_category@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R2error_category@std@@8" = linkonce_odr constant [2 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@error_category@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0], comdat
@"??_C@_08LLGCOLLL@iostream?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"iostream\00", comdat, align 1
@"?_Iostream_error@?4??message@_Iostream_error_category2@std@@UEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@3@H@Z@4QBDB" = linkonce_odr dso_local local_unnamed_addr constant [22 x i8] c"iostream stream error\00", comdat, align 16
@"??_C@_0BA@JFNIOLAK@string?5too?5long?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"string too long\00", comdat, align 1
@"??_R0?AVbad_array_new_length@std@@@8" = linkonce_odr global %rtti.TypeDescriptor30 { ptr @"??_7type_info@@6B@", ptr null, [31 x i8] c".?AVbad_array_new_length@std@@\00" }, comdat
@"_CT??_R0?AVbad_array_new_length@std@@@8??0bad_array_new_length@std@@QEAA@AEBV01@@Z24" = linkonce_odr unnamed_addr constant %eh.CatchableType { i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVbad_array_new_length@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0, i32 -1, i32 0, i32 24, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??0bad_array_new_length@std@@QEAA@AEBV01@@Z" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, section ".xdata", comdat
@"??_R0?AVbad_alloc@std@@@8" = linkonce_odr global %rtti.TypeDescriptor19 { ptr @"??_7type_info@@6B@", ptr null, [20 x i8] c".?AVbad_alloc@std@@\00" }, comdat
@"_CT??_R0?AVbad_alloc@std@@@8??0bad_alloc@std@@QEAA@AEBV01@@Z24" = linkonce_odr unnamed_addr constant %eh.CatchableType { i32 16, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVbad_alloc@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0, i32 -1, i32 0, i32 24, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??0bad_alloc@std@@QEAA@AEBV01@@Z" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, section ".xdata", comdat
@"_CTA3?AVbad_array_new_length@std@@" = linkonce_odr unnamed_addr constant %eh.CatchableTypeArray.3 { i32 3, [3 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"_CT??_R0?AVbad_array_new_length@std@@@8??0bad_array_new_length@std@@QEAA@AEBV01@@Z24" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"_CT??_R0?AVbad_alloc@std@@@8??0bad_alloc@std@@QEAA@AEBV01@@Z24" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"_CT??_R0?AVexception@std@@@8??0exception@std@@QEAA@AEBV01@@Z24" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32)] }, section ".xdata", comdat
@"_TI3?AVbad_array_new_length@std@@" = linkonce_odr unnamed_addr constant %eh.ThrowInfo { i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??1exception@std@@UEAA@XZ" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"_CTA3?AVbad_array_new_length@std@@" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, section ".xdata", comdat
@"??_C@_0BF@KINCDENJ@bad?5array?5new?5length?$AA@" = linkonce_odr dso_local unnamed_addr constant [21 x i8] c"bad array new length\00", comdat, align 1
@1 = private unnamed_addr constant { [3 x ptr] } { [3 x ptr] [ptr @"??_R4bad_array_new_length@std@@6B@", ptr @"??_Ebad_array_new_length@std@@UEAAPEAXI@Z", ptr @"?what@exception@std@@UEBAPEBDXZ"] }, comdat($"??_7bad_array_new_length@std@@6B@")
@"??_R4bad_array_new_length@std@@6B@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 0, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVbad_array_new_length@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3bad_array_new_length@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R4bad_array_new_length@std@@6B@" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R3bad_array_new_length@std@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 0, i32 3, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R2bad_array_new_length@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R2bad_array_new_length@std@@8" = linkonce_odr constant [4 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@bad_array_new_length@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@bad_alloc@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@exception@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0], comdat
@"??_R1A@?0A@EA@bad_array_new_length@std@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVbad_array_new_length@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 2, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3bad_array_new_length@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R1A@?0A@EA@bad_alloc@std@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVbad_alloc@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 1, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3bad_alloc@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R3bad_alloc@std@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 0, i32 2, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R2bad_alloc@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R2bad_alloc@std@@8" = linkonce_odr constant [3 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@bad_alloc@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@exception@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0], comdat
@"??_R1A@?0A@EA@exception@std@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVexception@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3exception@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R3exception@std@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 0, i32 1, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R2exception@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R2exception@std@@8" = linkonce_odr constant [2 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@exception@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0], comdat
@2 = private unnamed_addr constant { [3 x ptr] } { [3 x ptr] [ptr @"??_R4bad_alloc@std@@6B@", ptr @"??_Ebad_alloc@std@@UEAAPEAXI@Z", ptr @"?what@exception@std@@UEBAPEBDXZ"] }, comdat($"??_7bad_alloc@std@@6B@")
@"??_R4bad_alloc@std@@6B@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 0, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVbad_alloc@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3bad_alloc@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R4bad_alloc@std@@6B@" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@3 = private unnamed_addr constant { [3 x ptr] } { [3 x ptr] [ptr @"??_R4exception@std@@6B@", ptr @"??_Eexception@std@@UEAAPEAXI@Z", ptr @"?what@exception@std@@UEBAPEBDXZ"] }, comdat($"??_7exception@std@@6B@")
@"??_R4exception@std@@6B@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 0, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVexception@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3exception@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R4exception@std@@6B@" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_C@_0BC@EOODALEL@Unknown?5exception?$AA@" = linkonce_odr dso_local unnamed_addr constant [18 x i8] c"Unknown exception\00", comdat, align 1
@4 = private unnamed_addr constant { [3 x ptr] } { [3 x ptr] [ptr @"??_R4failure@ios_base@std@@6B@", ptr @"??_Efailure@ios_base@std@@UEAAPEAXI@Z", ptr @"?what@exception@std@@UEBAPEBDXZ"] }, comdat($"??_7failure@ios_base@std@@6B@")
@"??_R4failure@ios_base@std@@6B@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 0, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVfailure@ios_base@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3failure@ios_base@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R4failure@ios_base@std@@6B@" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R3failure@ios_base@std@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 0, i32 5, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R2failure@ios_base@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R2failure@ios_base@std@@8" = linkonce_odr constant [6 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@failure@ios_base@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@system_error@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@_System_error@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@runtime_error@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@exception@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0], comdat
@"??_R1A@?0A@EA@failure@ios_base@std@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVfailure@ios_base@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 4, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3failure@ios_base@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R1A@?0A@EA@system_error@std@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVsystem_error@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 3, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3system_error@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R3system_error@std@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 0, i32 4, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R2system_error@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R2system_error@std@@8" = linkonce_odr constant [5 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@system_error@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@_System_error@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@runtime_error@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@exception@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0], comdat
@"??_R1A@?0A@EA@_System_error@std@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AV_System_error@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 2, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3_System_error@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R3_System_error@std@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 0, i32 3, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R2_System_error@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R2_System_error@std@@8" = linkonce_odr constant [4 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@_System_error@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@runtime_error@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@exception@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0], comdat
@"??_R1A@?0A@EA@runtime_error@std@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVruntime_error@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 1, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3runtime_error@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R3runtime_error@std@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 0, i32 2, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R2runtime_error@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R2runtime_error@std@@8" = linkonce_odr constant [3 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@runtime_error@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@exception@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0], comdat
@5 = private unnamed_addr constant { [3 x ptr] } { [3 x ptr] [ptr @"??_R4system_error@std@@6B@", ptr @"??_Esystem_error@std@@UEAAPEAXI@Z", ptr @"?what@exception@std@@UEBAPEBDXZ"] }, comdat($"??_7system_error@std@@6B@")
@"??_R4system_error@std@@6B@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 0, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVsystem_error@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3system_error@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R4system_error@std@@6B@" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@6 = private unnamed_addr constant { [3 x ptr] } { [3 x ptr] [ptr @"??_R4_System_error@std@@6B@", ptr @"??_E_System_error@std@@UEAAPEAXI@Z", ptr @"?what@exception@std@@UEBAPEBDXZ"] }, comdat($"??_7_System_error@std@@6B@")
@"??_R4_System_error@std@@6B@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 0, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AV_System_error@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3_System_error@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R4_System_error@std@@6B@" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_C@_02LMMGGCAJ@?3?5?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c": \00", comdat, align 1
@7 = private unnamed_addr constant { [3 x ptr] } { [3 x ptr] [ptr @"??_R4runtime_error@std@@6B@", ptr @"??_Eruntime_error@std@@UEAAPEAXI@Z", ptr @"?what@exception@std@@UEBAPEBDXZ"] }, comdat($"??_7runtime_error@std@@6B@")
@"??_R4runtime_error@std@@6B@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 0, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVruntime_error@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3runtime_error@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R4runtime_error@std@@6B@" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat

@"??_7_Iostream_error_category2@std@@6B@" = unnamed_addr alias ptr, getelementptr inbounds ({ [7 x ptr] }, ptr @0, i32 0, i32 0, i32 1)
@"??_E_Iostream_error_category2@std@@UEAAPEAXI@Z" = weak dso_local unnamed_addr alias ptr (ptr, i32), ptr @"??_G_Iostream_error_category2@std@@UEAAPEAXI@Z"
@"??_7bad_array_new_length@std@@6B@" = unnamed_addr alias ptr, getelementptr inbounds ({ [3 x ptr] }, ptr @1, i32 0, i32 0, i32 1)
@"??_7bad_alloc@std@@6B@" = unnamed_addr alias ptr, getelementptr inbounds ({ [3 x ptr] }, ptr @2, i32 0, i32 0, i32 1)
@"??_7exception@std@@6B@" = unnamed_addr alias ptr, getelementptr inbounds ({ [3 x ptr] }, ptr @3, i32 0, i32 0, i32 1)
@"??_Eexception@std@@UEAAPEAXI@Z" = weak dso_local unnamed_addr alias ptr (ptr, i32), ptr @"??_Gexception@std@@UEAAPEAXI@Z"
@"??_Ebad_alloc@std@@UEAAPEAXI@Z" = weak dso_local unnamed_addr alias ptr (ptr, i32), ptr @"??_Gbad_alloc@std@@UEAAPEAXI@Z"
@"??_Ebad_array_new_length@std@@UEAAPEAXI@Z" = weak dso_local unnamed_addr alias ptr (ptr, i32), ptr @"??_Gbad_array_new_length@std@@UEAAPEAXI@Z"
@"??_7failure@ios_base@std@@6B@" = unnamed_addr alias ptr, getelementptr inbounds ({ [3 x ptr] }, ptr @4, i32 0, i32 0, i32 1)
@"??_7system_error@std@@6B@" = unnamed_addr alias ptr, getelementptr inbounds ({ [3 x ptr] }, ptr @5, i32 0, i32 0, i32 1)
@"??_7_System_error@std@@6B@" = unnamed_addr alias ptr, getelementptr inbounds ({ [3 x ptr] }, ptr @6, i32 0, i32 0, i32 1)
@"??_7runtime_error@std@@6B@" = unnamed_addr alias ptr, getelementptr inbounds ({ [3 x ptr] }, ptr @7, i32 0, i32 0, i32 1)
@"??_Eruntime_error@std@@UEAAPEAXI@Z" = weak dso_local unnamed_addr alias ptr (ptr, i32), ptr @"??_Gruntime_error@std@@UEAAPEAXI@Z"
@"??_E_System_error@std@@UEAAPEAXI@Z" = weak dso_local unnamed_addr alias ptr (ptr, i32), ptr @"??_G_System_error@std@@UEAAPEAXI@Z"
@"??_Esystem_error@std@@UEAAPEAXI@Z" = weak dso_local unnamed_addr alias ptr (ptr, i32), ptr @"??_Gsystem_error@std@@UEAAPEAXI@Z"
@"??_Efailure@ios_base@std@@UEAAPEAXI@Z" = weak dso_local unnamed_addr alias ptr (ptr, i32), ptr @"??_Gfailure@ios_base@std@@UEAAPEAXI@Z"

; Function Attrs: mustprogress uwtable
define dso_local void @"?simple@@YA?AUTask@@XZ"(ptr dead_on_unwind writable sret(%struct.Task) align 8 %0) local_unnamed_addr #0 personality ptr @__CxxFrameHandler3 {
  %2 = alloca %"?simple@@YA?AUTask@@XZ.Frame", align 8
  store ptr %2, ptr %0, align 8, !alias.scope !17
  %3 = invoke noundef nonnull align 8 dereferenceable(8) ptr @"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"(ptr noundef nonnull align 8 dereferenceable(8) @"?cout@std@@3V?$basic_ostream@DU?$char_traits@D@std@@@1@A", ptr noundef nonnull @"??_C@_0BF@HGMNOGKH@simple?$CI?$CJ?5running?4?4?4?6?$AA@")
          to label %8 unwind label %4

4:                                                ; preds = %1
  %5 = catchswitch within none [label %6] unwind to caller

6:                                                ; preds = %4
  %7 = catchpad within %5 [ptr null, i32 64, ptr null]
  call void @terminate() #17 [ "funclet"(token %7) ]
  unreachable

8:                                                ; preds = %1
  ret void
}

; Function Attrs: nobuiltin allocsize(0)
declare dso_local noundef nonnull ptr @"??2@YAPEAX_K@Z"(i64 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

declare dso_local i32 @__CxxFrameHandler3(...)

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(8) ptr @"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef %1) local_unnamed_addr #0 comdat personality ptr @__CxxFrameHandler3 {
  %3 = alloca %"class.std::error_code", align 8
  %4 = alloca %"class.std::ios_base::failure", align 8
  %5 = alloca %"class.std::basic_ostream<char>::sentry", align 8
  %6 = tail call noundef i64 @strlen(ptr noundef nonnull dereferenceable(1) %1) #18
  %7 = load ptr, ptr %0, align 8
  %8 = getelementptr inbounds nuw i8, ptr %7, i64 4
  %9 = load i32, ptr %8, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds i8, ptr %0, i64 %10
  %12 = getelementptr inbounds nuw i8, ptr %11, i64 40
  %13 = load i64, ptr %12, align 8
  %14 = icmp sgt i64 %13, 0
  %15 = icmp sgt i64 %13, %6
  %16 = and i1 %14, %15
  %17 = sub nsw i64 %13, %6
  %18 = select i1 %16, i64 %17, i64 0
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #18
  store ptr %0, ptr %5, align 8
  %19 = getelementptr inbounds nuw i8, ptr %11, i64 72
  %20 = load ptr, ptr %19, align 8
  %21 = icmp eq ptr %20, null
  br i1 %21, label %30, label %22

22:                                               ; preds = %2
  %23 = load ptr, ptr %20, align 8
  %24 = getelementptr inbounds nuw i8, ptr %23, i64 8
  %25 = load ptr, ptr %24, align 8
  tail call void %25(ptr noundef nonnull align 8 dereferenceable(104) %20)
  %26 = load ptr, ptr %0, align 8
  %27 = getelementptr inbounds nuw i8, ptr %26, i64 4
  %28 = load i32, ptr %27, align 4
  %29 = sext i32 %28 to i64
  br label %30

30:                                               ; preds = %22, %2
  %31 = phi ptr [ %7, %2 ], [ %26, %22 ]
  %32 = phi i64 [ %10, %2 ], [ %29, %22 ]
  %33 = getelementptr inbounds i8, ptr %0, i64 %32
  %34 = getelementptr inbounds nuw i8, ptr %33, i64 16
  %35 = load i32, ptr %34, align 8
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %39, label %37

37:                                               ; preds = %30
  %38 = getelementptr inbounds nuw i8, ptr %5, i64 8
  store i8 0, ptr %38, align 8
  br label %185

39:                                               ; preds = %30
  %40 = getelementptr inbounds nuw i8, ptr %33, i64 80
  %41 = load ptr, ptr %40, align 8
  %42 = icmp eq ptr %41, null
  %43 = icmp eq ptr %41, %0
  %44 = or i1 %42, %43
  br i1 %44, label %45, label %47

45:                                               ; preds = %39
  %46 = getelementptr inbounds nuw i8, ptr %5, i64 8
  store i8 1, ptr %46, align 8
  br label %62

47:                                               ; preds = %39
  %48 = invoke noundef nonnull align 8 dereferenceable(8) ptr @"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ"(ptr noundef nonnull align 8 dereferenceable(8) %41)
          to label %51 unwind label %49

49:                                               ; preds = %47
  %50 = cleanuppad within none []
  call void @"??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(16) %5) #18 [ "funclet"(token %50) ]
  cleanupret from %50 unwind to caller

51:                                               ; preds = %47
  %52 = load ptr, ptr %0, align 8
  %53 = getelementptr inbounds nuw i8, ptr %52, i64 4
  %54 = load i32, ptr %53, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i8, ptr %0, i64 %55
  %57 = getelementptr inbounds nuw i8, ptr %56, i64 16
  %58 = load i32, ptr %57, align 8
  %59 = icmp eq i32 %58, 0
  %60 = getelementptr inbounds nuw i8, ptr %5, i64 8
  %61 = zext i1 %59 to i8
  store i8 %61, ptr %60, align 8
  br i1 %59, label %62, label %185

62:                                               ; preds = %45, %51
  %63 = phi ptr [ %31, %45 ], [ %52, %51 ]
  %64 = getelementptr inbounds nuw i8, ptr %63, i64 4
  %65 = load i32, ptr %64, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, ptr %0, i64 %66
  %68 = getelementptr inbounds nuw i8, ptr %67, i64 24
  %69 = load i32, ptr %68, align 8
  %70 = and i32 %69, 448
  %71 = icmp ne i32 %70, 64
  %72 = icmp sgt i64 %18, 0
  %73 = select i1 %71, i1 %72, i1 false
  br i1 %73, label %74, label %115

74:                                               ; preds = %62, %107
  %75 = phi i64 [ %108, %107 ], [ %17, %62 ]
  %76 = load ptr, ptr %0, align 8
  %77 = getelementptr inbounds nuw i8, ptr %76, i64 4
  %78 = load i32, ptr %77, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i8, ptr %0, i64 %79
  %81 = getelementptr inbounds nuw i8, ptr %80, i64 72
  %82 = load ptr, ptr %81, align 8
  %83 = getelementptr inbounds nuw i8, ptr %80, i64 88
  %84 = load i8, ptr %83, align 8
  %85 = getelementptr inbounds nuw i8, ptr %82, i64 64
  %86 = load ptr, ptr %85, align 8
  %87 = load ptr, ptr %86, align 8
  %88 = icmp eq ptr %87, null
  br i1 %88, label %99, label %89

89:                                               ; preds = %74
  %90 = getelementptr inbounds nuw i8, ptr %82, i64 88
  %91 = load ptr, ptr %90, align 8
  %92 = load i32, ptr %91, align 4
  %93 = icmp sgt i32 %92, 0
  br i1 %93, label %94, label %99

94:                                               ; preds = %89
  %95 = add nsw i32 %92, -1
  store i32 %95, ptr %91, align 4
  %96 = load ptr, ptr %85, align 8
  %97 = load ptr, ptr %96, align 8
  %98 = getelementptr inbounds nuw i8, ptr %97, i64 1
  store ptr %98, ptr %96, align 8
  store i8 %84, ptr %97, align 1
  br label %107

99:                                               ; preds = %89, %74
  %100 = zext i8 %84 to i32
  %101 = load ptr, ptr %82, align 8
  %102 = getelementptr inbounds nuw i8, ptr %101, i64 24
  %103 = load ptr, ptr %102, align 8
  %104 = invoke noundef i32 %103(ptr noundef nonnull align 8 dereferenceable(104) %82, i32 noundef %100)
          to label %105 unwind label %161

105:                                              ; preds = %99
  %106 = icmp eq i32 %104, -1
  br i1 %106, label %177, label %107

107:                                              ; preds = %94, %105
  %108 = add nsw i64 %75, -1
  %109 = icmp sgt i64 %75, 1
  br i1 %109, label %74, label %110

110:                                              ; preds = %107
  %111 = load ptr, ptr %0, align 8
  %112 = getelementptr inbounds nuw i8, ptr %111, i64 4
  %113 = load i32, ptr %112, align 4
  %114 = sext i32 %113 to i64
  br label %115

115:                                              ; preds = %110, %62
  %116 = phi i64 [ %114, %110 ], [ %66, %62 ]
  %117 = phi i64 [ 0, %110 ], [ %18, %62 ]
  %118 = getelementptr inbounds i8, ptr %0, i64 %116
  %119 = getelementptr inbounds nuw i8, ptr %118, i64 72
  %120 = load ptr, ptr %119, align 8
  %121 = load ptr, ptr %120, align 8
  %122 = getelementptr inbounds nuw i8, ptr %121, i64 72
  %123 = load ptr, ptr %122, align 8
  %124 = invoke noundef i64 %123(ptr noundef nonnull align 8 dereferenceable(104) %120, ptr noundef nonnull %1, i64 noundef %6)
          to label %125 unwind label %161

125:                                              ; preds = %115
  %126 = icmp eq i64 %124, %6
  %127 = select i1 %126, i32 0, i32 4
  %128 = icmp sgt i64 %117, 0
  %129 = select i1 %126, i1 %128, i1 false
  br i1 %129, label %130, label %177

130:                                              ; preds = %125, %174
  %131 = phi i64 [ %175, %174 ], [ %117, %125 ]
  %132 = load ptr, ptr %0, align 8
  %133 = getelementptr inbounds nuw i8, ptr %132, i64 4
  %134 = load i32, ptr %133, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i8, ptr %0, i64 %135
  %137 = getelementptr inbounds nuw i8, ptr %136, i64 72
  %138 = load ptr, ptr %137, align 8
  %139 = getelementptr inbounds nuw i8, ptr %136, i64 88
  %140 = load i8, ptr %139, align 8
  %141 = getelementptr inbounds nuw i8, ptr %138, i64 64
  %142 = load ptr, ptr %141, align 8
  %143 = load ptr, ptr %142, align 8
  %144 = icmp eq ptr %143, null
  br i1 %144, label %155, label %145

145:                                              ; preds = %130
  %146 = getelementptr inbounds nuw i8, ptr %138, i64 88
  %147 = load ptr, ptr %146, align 8
  %148 = load i32, ptr %147, align 4
  %149 = icmp sgt i32 %148, 0
  br i1 %149, label %150, label %155

150:                                              ; preds = %145
  %151 = add nsw i32 %148, -1
  store i32 %151, ptr %147, align 4
  %152 = load ptr, ptr %141, align 8
  %153 = load ptr, ptr %152, align 8
  %154 = getelementptr inbounds nuw i8, ptr %153, i64 1
  store ptr %154, ptr %152, align 8
  store i8 %140, ptr %153, align 1
  br label %174

155:                                              ; preds = %145, %130
  %156 = zext i8 %140 to i32
  %157 = load ptr, ptr %138, align 8
  %158 = getelementptr inbounds nuw i8, ptr %157, i64 24
  %159 = load ptr, ptr %158, align 8
  %160 = invoke noundef i32 %159(ptr noundef nonnull align 8 dereferenceable(104) %138, i32 noundef %156)
          to label %172 unwind label %161

161:                                              ; preds = %155, %115, %99
  %162 = phi i32 [ %127, %155 ], [ 0, %115 ], [ 0, %99 ]
  %163 = catchswitch within none [label %164] unwind label %237

164:                                              ; preds = %161
  %165 = catchpad within %163 [ptr null, i32 64, ptr null]
  %166 = load ptr, ptr %0, align 8
  %167 = getelementptr inbounds nuw i8, ptr %166, i64 4
  %168 = load i32, ptr %167, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds i8, ptr %0, i64 %169
  invoke void @"?setstate@?$basic_ios@DU?$char_traits@D@std@@@std@@QEAAXH_N@Z"(ptr noundef nonnull align 8 dereferenceable(96) %170, i32 noundef 4, i1 noundef zeroext true) [ "funclet"(token %165) ]
          to label %171 unwind label %237

171:                                              ; preds = %164
  catchret from %165 to label %185

172:                                              ; preds = %155
  %173 = icmp eq i32 %160, -1
  br i1 %173, label %177, label %174

174:                                              ; preds = %150, %172
  %175 = add nsw i64 %131, -1
  %176 = icmp sgt i64 %131, 1
  br i1 %176, label %130, label %177

177:                                              ; preds = %105, %172, %174, %125
  %178 = phi i32 [ %127, %125 ], [ %127, %174 ], [ 4, %172 ], [ 4, %105 ]
  %179 = load ptr, ptr %0, align 8
  %180 = getelementptr inbounds nuw i8, ptr %179, i64 4
  %181 = load i32, ptr %180, align 4
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i8, ptr %0, i64 %182
  %184 = getelementptr inbounds nuw i8, ptr %183, i64 40
  store i64 0, ptr %184, align 8
  br label %185

185:                                              ; preds = %37, %51, %177, %171
  %186 = phi i32 [ %178, %177 ], [ %162, %171 ], [ 4, %51 ], [ 4, %37 ]
  %187 = load ptr, ptr %0, align 8
  %188 = getelementptr inbounds nuw i8, ptr %187, i64 4
  %189 = load i32, ptr %188, align 4
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds i8, ptr %0, i64 %190
  %192 = getelementptr inbounds nuw i8, ptr %191, i64 16
  %193 = load i32, ptr %192, align 8
  %194 = or i32 %193, %186
  %195 = getelementptr inbounds nuw i8, ptr %191, i64 72
  %196 = load ptr, ptr %195, align 8
  %197 = icmp eq ptr %196, null
  %198 = select i1 %197, i32 4, i32 0
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  %199 = and i32 %194, 23
  %200 = or i32 %198, %199
  store i32 %200, ptr %192, align 8
  %201 = getelementptr inbounds nuw i8, ptr %191, i64 20
  %202 = load i32, ptr %201, align 4
  %203 = and i32 %202, %200
  %204 = icmp eq i32 %203, 0
  br i1 %204, label %216, label %205

205:                                              ; preds = %185
  %206 = and i32 %203, 4
  %207 = icmp eq i32 %206, 0
  %208 = and i32 %203, 2
  %209 = icmp eq i32 %208, 0
  %210 = select i1 %209, ptr @"??_C@_0BF@OOHOMBOF@ios_base?3?3eofbit?5set?$AA@", ptr @"??_C@_0BG@FMKFHCIL@ios_base?3?3failbit?5set?$AA@"
  %211 = select i1 %207, ptr %210, ptr @"??_C@_0BF@PHHKMMFD@ios_base?3?3badbit?5set?$AA@"
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store i32 1, ptr %3, align 8
  %212 = getelementptr inbounds nuw i8, ptr %3, i64 8
  store ptr @"?_Static@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@1@XZ@4V21@B", ptr %212, align 8
  %213 = invoke noundef ptr @"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z"(ptr noundef nonnull align 8 dereferenceable(40) %4, ptr dead_on_return noundef nonnull %3, ptr noundef nonnull %211)
          to label %214 unwind label %237

214:                                              ; preds = %205
  store ptr @"??_7failure@ios_base@std@@6B@", ptr %4, align 8
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  invoke void @_CxxThrowException(ptr nonnull %4, ptr nonnull @"_TI5?AVfailure@ios_base@std@@") #19
          to label %215 unwind label %237

215:                                              ; preds = %214
  unreachable

216:                                              ; preds = %185
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  %217 = tail call noundef i32 @"?uncaught_exceptions@std@@YAHXZ"() #18
  %218 = icmp eq i32 %217, 0
  %219 = load ptr, ptr %5, align 8
  br i1 %218, label %220, label %221

220:                                              ; preds = %216
  tail call void @"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ"(ptr noundef nonnull align 8 dereferenceable(8) %219) #18
  br label %221

221:                                              ; preds = %220, %216
  %222 = load ptr, ptr %219, align 8
  %223 = getelementptr inbounds nuw i8, ptr %222, i64 4
  %224 = load i32, ptr %223, align 4
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds i8, ptr %219, i64 %225
  %227 = getelementptr inbounds nuw i8, ptr %226, i64 72
  %228 = load ptr, ptr %227, align 8
  %229 = icmp eq ptr %228, null
  br i1 %229, label %236, label %230

230:                                              ; preds = %221
  %231 = load ptr, ptr %228, align 8
  %232 = getelementptr inbounds nuw i8, ptr %231, i64 16
  %233 = load ptr, ptr %232, align 8
  invoke void %233(ptr noundef nonnull align 8 dereferenceable(104) %228)
          to label %236 unwind label %234

234:                                              ; preds = %230
  %235 = cleanuppad within none []
  call void @__std_terminate() #17 [ "funclet"(token %235) ]
  unreachable

236:                                              ; preds = %221, %230
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #18
  ret ptr %0

237:                                              ; preds = %205, %214, %164, %161
  %238 = cleanuppad within none []
  call void @"??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(16) %5) #18 [ "funclet"(token %238) ]
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #18
  cleanupret from %238 unwind to caller
}

; Function Attrs: nobuiltin nounwind
declare dso_local void @"??3@YAXPEAX_K@Z"(ptr noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main() local_unnamed_addr #4 personality ptr @__CxxFrameHandler3 {
  %1 = tail call noundef nonnull align 8 dereferenceable(8) ptr @"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"(ptr noundef nonnull align 8 dereferenceable(8) @"?cout@std@@3V?$basic_ostream@DU?$char_traits@D@std@@@1@A", ptr noundef nonnull @"??_C@_0BF@MDJKLCPE@Calling?5simple?$CI?$CJ?4?4?4?6?$AA@")
  %2 = invoke noundef nonnull align 8 dereferenceable(8) ptr @"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"(ptr noundef nonnull align 8 dereferenceable(8) @"?cout@std@@3V?$basic_ostream@DU?$char_traits@D@std@@@1@A", ptr noundef nonnull @"??_C@_0BF@HGMNOGKH@simple?$CI?$CJ?5running?4?4?4?6?$AA@")
          to label %7 unwind label %3

3:                                                ; preds = %0
  %4 = catchswitch within none [label %5] unwind to caller

5:                                                ; preds = %3
  %6 = catchpad within %4 [ptr null, i32 64, ptr null]
  call void @terminate() #17 [ "funclet"(token %6) ]
  unreachable

7:                                                ; preds = %0
  %8 = tail call noundef nonnull align 8 dereferenceable(8) ptr @"??$?6U?$char_traits@D@std@@@std@@YAAEAV?$basic_ostream@DU?$char_traits@D@std@@@0@AEAV10@PEBD@Z"(ptr noundef nonnull align 8 dereferenceable(8) @"?cout@std@@3V?$basic_ostream@DU?$char_traits@D@std@@@1@A", ptr noundef nonnull @"??_C@_06MJLDIBBJ@Done?4?6?$AA@")
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #5

; Function Attrs: noreturn nounwind
declare dso_local void @terminate() local_unnamed_addr #6

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local void @"?setstate@?$basic_ios@DU?$char_traits@D@std@@@std@@QEAAXH_N@Z"(ptr noundef nonnull align 8 dereferenceable(96) %0, i32 noundef %1, i1 noundef zeroext %2) local_unnamed_addr #0 comdat align 2 {
  %4 = alloca %"class.std::ios_base::failure", align 8
  %5 = alloca %"class.std::error_code", align 8
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %7 = load i32, ptr %6, align 8
  %8 = or i32 %7, %1
  %9 = getelementptr inbounds nuw i8, ptr %0, i64 72
  %10 = load ptr, ptr %9, align 8
  %11 = icmp eq ptr %10, null
  %12 = select i1 %11, i32 4, i32 0
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  %13 = and i32 %8, 23
  %14 = or i32 %12, %13
  store i32 %14, ptr %6, align 8
  %15 = getelementptr inbounds nuw i8, ptr %0, i64 20
  %16 = load i32, ptr %15, align 4
  %17 = and i32 %16, %14
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %30, label %19

19:                                               ; preds = %3
  br i1 %2, label %20, label %21

20:                                               ; preds = %19
  tail call void @_CxxThrowException(ptr null, ptr null) #19
  unreachable

21:                                               ; preds = %19
  %22 = and i32 %17, 4
  %23 = icmp eq i32 %22, 0
  %24 = and i32 %17, 2
  %25 = icmp eq i32 %24, 0
  %26 = select i1 %25, ptr @"??_C@_0BF@OOHOMBOF@ios_base?3?3eofbit?5set?$AA@", ptr @"??_C@_0BG@FMKFHCIL@ios_base?3?3failbit?5set?$AA@"
  %27 = select i1 %23, ptr %26, ptr @"??_C@_0BF@PHHKMMFD@ios_base?3?3badbit?5set?$AA@"
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #18
  store i32 1, ptr %5, align 8, !alias.scope !20
  %28 = getelementptr inbounds nuw i8, ptr %5, i64 8
  store ptr @"?_Static@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@1@XZ@4V21@B", ptr %28, align 8, !alias.scope !20
  %29 = call noundef ptr @"??0failure@ios_base@std@@QEAA@PEBDAEBVerror_code@2@@Z"(ptr noundef nonnull align 8 dereferenceable(40) %4, ptr noundef nonnull %27, ptr noundef nonnull align 8 dereferenceable(16) %5)
  call void @_CxxThrowException(ptr nonnull %4, ptr nonnull @"_TI5?AVfailure@ios_base@std@@") #19
  unreachable

30:                                               ; preds = %3
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  ret void
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local void @"??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(16) %0) unnamed_addr #7 comdat align 2 personality ptr @__CxxFrameHandler3 {
  %2 = tail call noundef i32 @"?uncaught_exceptions@std@@YAHXZ"() #18
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = load ptr, ptr %0, align 8, !nonnull !23, !align !24
  tail call void @"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ"(ptr noundef nonnull align 8 dereferenceable(8) %5) #18
  br label %6

6:                                                ; preds = %4, %1
  %7 = load ptr, ptr %0, align 8, !nonnull !23, !align !24
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds nuw i8, ptr %8, i64 4
  %10 = load i32, ptr %9, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i8, ptr %7, i64 %11
  %13 = getelementptr inbounds nuw i8, ptr %12, i64 72
  %14 = load ptr, ptr %13, align 8
  %15 = icmp eq ptr %14, null
  br i1 %15, label %22, label %16

16:                                               ; preds = %6
  %17 = load ptr, ptr %14, align 8
  %18 = getelementptr inbounds nuw i8, ptr %17, i64 16
  %19 = load ptr, ptr %18, align 8
  invoke void %19(ptr noundef nonnull align 8 dereferenceable(104) %14)
          to label %22 unwind label %20

20:                                               ; preds = %16
  %21 = cleanuppad within none []
  call void @__std_terminate() #17 [ "funclet"(token %21) ]
  unreachable

22:                                               ; preds = %6, %16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i64 @strlen(ptr noundef captures(none)) local_unnamed_addr #8

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(8) ptr @"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ"(ptr noundef nonnull align 8 dereferenceable(8) %0) local_unnamed_addr #0 comdat align 2 personality ptr @__CxxFrameHandler3 {
  %2 = alloca %"class.std::error_code", align 8
  %3 = alloca %"class.std::ios_base::failure", align 8
  %4 = alloca %"class.std::basic_ostream<char>::sentry", align 8
  %5 = load ptr, ptr %0, align 8
  %6 = getelementptr inbounds nuw i8, ptr %5, i64 4
  %7 = load i32, ptr %6, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds i8, ptr %0, i64 %8
  %10 = getelementptr inbounds nuw i8, ptr %9, i64 72
  %11 = load ptr, ptr %10, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %124, label %13

13:                                               ; preds = %1
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #18
  store ptr %0, ptr %4, align 8
  %14 = load ptr, ptr %11, align 8
  %15 = getelementptr inbounds nuw i8, ptr %14, i64 8
  %16 = load ptr, ptr %15, align 8
  tail call void %16(ptr noundef nonnull align 8 dereferenceable(104) %11)
  %17 = load ptr, ptr %0, align 8
  %18 = getelementptr inbounds nuw i8, ptr %17, i64 4
  %19 = load i32, ptr %18, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i8, ptr %0, i64 %20
  %22 = getelementptr inbounds nuw i8, ptr %21, i64 16
  %23 = load i32, ptr %22, align 8
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %27, label %25

25:                                               ; preds = %13
  %26 = getelementptr inbounds nuw i8, ptr %4, i64 8
  store i8 0, ptr %26, align 8
  br label %103

27:                                               ; preds = %13
  %28 = getelementptr inbounds i8, ptr %0, i64 %20
  %29 = getelementptr inbounds nuw i8, ptr %28, i64 80
  %30 = load ptr, ptr %29, align 8
  %31 = icmp eq ptr %30, null
  %32 = icmp eq ptr %30, %0
  %33 = or i1 %31, %32
  br i1 %33, label %34, label %36

34:                                               ; preds = %27
  %35 = getelementptr inbounds nuw i8, ptr %4, i64 8
  store i8 1, ptr %35, align 8
  br label %51

36:                                               ; preds = %27
  %37 = invoke noundef nonnull align 8 dereferenceable(8) ptr @"?flush@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAAEAV12@XZ"(ptr noundef nonnull align 8 dereferenceable(8) %30)
          to label %40 unwind label %38

38:                                               ; preds = %36
  %39 = cleanuppad within none []
  call void @"??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(16) %4) #18 [ "funclet"(token %39) ]
  cleanupret from %39 unwind to caller

40:                                               ; preds = %36
  %41 = load ptr, ptr %0, align 8
  %42 = getelementptr inbounds nuw i8, ptr %41, i64 4
  %43 = load i32, ptr %42, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8, ptr %0, i64 %44
  %46 = getelementptr inbounds nuw i8, ptr %45, i64 16
  %47 = load i32, ptr %46, align 8
  %48 = icmp eq i32 %47, 0
  %49 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %50 = zext i1 %48 to i8
  store i8 %50, ptr %49, align 8
  br i1 %48, label %51, label %103

51:                                               ; preds = %34, %40
  %52 = load ptr, ptr %11, align 8
  %53 = getelementptr inbounds nuw i8, ptr %52, i64 104
  %54 = load ptr, ptr %53, align 8
  %55 = invoke noundef i32 %54(ptr noundef nonnull align 8 dereferenceable(104) %11)
          to label %98 unwind label %56

56:                                               ; preds = %51
  %57 = catchswitch within none [label %58] unwind label %101

58:                                               ; preds = %56
  %59 = catchpad within %57 [ptr null, i32 64, ptr null]
  %60 = load ptr, ptr %0, align 8
  %61 = getelementptr inbounds nuw i8, ptr %60, i64 4
  %62 = load i32, ptr %61, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, ptr %0, i64 %63
  invoke void @"?setstate@?$basic_ios@DU?$char_traits@D@std@@@std@@QEAAXH_N@Z"(ptr noundef nonnull align 8 dereferenceable(96) %64, i32 noundef 4, i1 noundef zeroext true) [ "funclet"(token %59) ]
          to label %65 unwind label %101

65:                                               ; preds = %58
  catchret from %59 to label %66

66:                                               ; preds = %98, %65
  %67 = phi i32 [ 0, %65 ], [ %100, %98 ]
  %68 = load ptr, ptr %0, align 8
  %69 = getelementptr inbounds nuw i8, ptr %68, i64 4
  %70 = load i32, ptr %69, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i8, ptr %0, i64 %71
  %73 = getelementptr inbounds nuw i8, ptr %72, i64 16
  %74 = load i32, ptr %73, align 8
  %75 = getelementptr inbounds nuw i8, ptr %72, i64 72
  %76 = load ptr, ptr %75, align 8
  %77 = icmp eq ptr %76, null
  %78 = select i1 %77, i32 4, i32 0
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  %79 = and i32 %74, 23
  %80 = or i32 %79, %67
  %81 = or i32 %80, %78
  store i32 %81, ptr %73, align 8
  %82 = getelementptr inbounds nuw i8, ptr %72, i64 20
  %83 = load i32, ptr %82, align 4
  %84 = and i32 %83, %81
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %97, label %86

86:                                               ; preds = %66
  %87 = and i32 %84, 4
  %88 = icmp eq i32 %87, 0
  %89 = and i32 %84, 2
  %90 = icmp eq i32 %89, 0
  %91 = select i1 %90, ptr @"??_C@_0BF@OOHOMBOF@ios_base?3?3eofbit?5set?$AA@", ptr @"??_C@_0BG@FMKFHCIL@ios_base?3?3failbit?5set?$AA@"
  %92 = select i1 %88, ptr %91, ptr @"??_C@_0BF@PHHKMMFD@ios_base?3?3badbit?5set?$AA@"
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store i32 1, ptr %2, align 8
  %93 = getelementptr inbounds nuw i8, ptr %2, i64 8
  store ptr @"?_Static@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@1@XZ@4V21@B", ptr %93, align 8
  %94 = invoke noundef ptr @"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z"(ptr noundef nonnull align 8 dereferenceable(40) %3, ptr dead_on_return noundef nonnull %2, ptr noundef nonnull %92)
          to label %95 unwind label %101

95:                                               ; preds = %86
  store ptr @"??_7failure@ios_base@std@@6B@", ptr %3, align 8
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  invoke void @_CxxThrowException(ptr nonnull %3, ptr nonnull @"_TI5?AVfailure@ios_base@std@@") #19
          to label %96 unwind label %101

96:                                               ; preds = %95
  unreachable

97:                                               ; preds = %66
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  br label %103

98:                                               ; preds = %51
  %99 = icmp eq i32 %55, -1
  %100 = select i1 %99, i32 4, i32 0
  br label %66

101:                                              ; preds = %86, %95, %58, %56
  %102 = cleanuppad within none []
  call void @"??1sentry@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(16) %4) #18 [ "funclet"(token %102) ]
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #18
  cleanupret from %102 unwind to caller

103:                                              ; preds = %25, %97, %40
  %104 = tail call noundef i32 @"?uncaught_exceptions@std@@YAHXZ"() #18
  %105 = icmp eq i32 %104, 0
  %106 = load ptr, ptr %4, align 8
  br i1 %105, label %107, label %108

107:                                              ; preds = %103
  tail call void @"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ"(ptr noundef nonnull align 8 dereferenceable(8) %106) #18
  br label %108

108:                                              ; preds = %107, %103
  %109 = load ptr, ptr %106, align 8
  %110 = getelementptr inbounds nuw i8, ptr %109, i64 4
  %111 = load i32, ptr %110, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i8, ptr %106, i64 %112
  %114 = getelementptr inbounds nuw i8, ptr %113, i64 72
  %115 = load ptr, ptr %114, align 8
  %116 = icmp eq ptr %115, null
  br i1 %116, label %123, label %117

117:                                              ; preds = %108
  %118 = load ptr, ptr %115, align 8
  %119 = getelementptr inbounds nuw i8, ptr %118, i64 16
  %120 = load ptr, ptr %119, align 8
  invoke void %120(ptr noundef nonnull align 8 dereferenceable(104) %115)
          to label %123 unwind label %121

121:                                              ; preds = %117
  %122 = cleanuppad within none []
  call void @__std_terminate() #17 [ "funclet"(token %122) ]
  unreachable

123:                                              ; preds = %108, %117
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #18
  br label %124

124:                                              ; preds = %123, %1
  ret ptr %0
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local void @"??1_Sentry_base@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #7 comdat align 2 personality ptr @__CxxFrameHandler3 {
  %2 = load ptr, ptr %0, align 8, !nonnull !23, !align !24
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw i8, ptr %3, i64 4
  %5 = load i32, ptr %4, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i8, ptr %2, i64 %6
  %8 = getelementptr inbounds nuw i8, ptr %7, i64 72
  %9 = load ptr, ptr %8, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %15, label %11

11:                                               ; preds = %1
  %12 = load ptr, ptr %9, align 8
  %13 = getelementptr inbounds nuw i8, ptr %12, i64 16
  %14 = load ptr, ptr %13, align 8
  invoke void %14(ptr noundef nonnull align 8 dereferenceable(104) %9)
          to label %15 unwind label %16

15:                                               ; preds = %11, %1
  ret void

16:                                               ; preds = %11
  %17 = cleanuppad within none []
  call void @__std_terminate() #17 [ "funclet"(token %17) ]
  unreachable
}

declare dso_local void @__std_terminate() local_unnamed_addr

declare dso_local void @_CxxThrowException(ptr, ptr) local_unnamed_addr

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local noundef ptr @"??0failure@ios_base@std@@QEAA@PEBDAEBVerror_code@2@@Z"(ptr noundef nonnull returned align 8 dereferenceable(40) %0, ptr noundef %1, ptr noundef nonnull align 8 dereferenceable(16) %2) unnamed_addr #0 comdat align 2 {
  %4 = alloca %"class.std::error_code", align 8
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %4, ptr noundef nonnull align 8 dereferenceable(16) %2, i64 16, i1 false)
  %5 = call noundef ptr @"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z"(ptr noundef nonnull align 8 dereferenceable(40) %0, ptr dead_on_return noundef nonnull %4, ptr noundef %1)
  store ptr @"??_7failure@ios_base@std@@6B@", ptr %0, align 8
  ret ptr %0
}

; Function Attrs: inlinehint mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @"??0failure@ios_base@std@@QEAA@AEBV012@@Z"(ptr noundef nonnull returned align 8 dereferenceable(40) %0, ptr noundef nonnull align 8 dereferenceable(40) %1) unnamed_addr #9 comdat align 2 personality ptr @__CxxFrameHandler3 {
  store ptr @"??_7exception@std@@6B@", ptr %0, align 8
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 8
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %3, i8 0, i64 16, i1 false)
  %4 = getelementptr inbounds nuw i8, ptr %1, i64 8
  invoke void @__std_exception_copy(ptr noundef nonnull %4, ptr noundef nonnull %3)
          to label %7 unwind label %5

5:                                                ; preds = %2
  %6 = cleanuppad within none []
  call void @__std_terminate() #17 [ "funclet"(token %6) ]
  unreachable

7:                                                ; preds = %2
  store ptr @"??_7_System_error@std@@6B@", ptr %0, align 8
  %8 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %9 = getelementptr inbounds nuw i8, ptr %1, i64 24
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %8, ptr noundef nonnull align 8 dereferenceable(16) %9, i64 16, i1 false)
  store ptr @"??_7failure@ios_base@std@@6B@", ptr %0, align 8
  ret ptr %0
}

; Function Attrs: inlinehint mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @"??0system_error@std@@QEAA@AEBV01@@Z"(ptr noundef nonnull returned align 8 dereferenceable(40) %0, ptr noundef nonnull align 8 dereferenceable(40) %1) unnamed_addr #9 comdat align 2 personality ptr @__CxxFrameHandler3 {
  store ptr @"??_7exception@std@@6B@", ptr %0, align 8
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 8
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %3, i8 0, i64 16, i1 false)
  %4 = getelementptr inbounds nuw i8, ptr %1, i64 8
  invoke void @__std_exception_copy(ptr noundef nonnull %4, ptr noundef nonnull %3)
          to label %7 unwind label %5

5:                                                ; preds = %2
  %6 = cleanuppad within none []
  call void @__std_terminate() #17 [ "funclet"(token %6) ]
  unreachable

7:                                                ; preds = %2
  store ptr @"??_7_System_error@std@@6B@", ptr %0, align 8
  %8 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %9 = getelementptr inbounds nuw i8, ptr %1, i64 24
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %8, ptr noundef nonnull align 8 dereferenceable(16) %9, i64 16, i1 false)
  store ptr @"??_7system_error@std@@6B@", ptr %0, align 8
  ret ptr %0
}

; Function Attrs: inlinehint mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @"??0_System_error@std@@QEAA@AEBV01@@Z"(ptr noundef nonnull returned align 8 dereferenceable(40) %0, ptr noundef nonnull align 8 dereferenceable(40) %1) unnamed_addr #9 comdat align 2 personality ptr @__CxxFrameHandler3 {
  store ptr @"??_7exception@std@@6B@", ptr %0, align 8
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 8
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %3, i8 0, i64 16, i1 false)
  %4 = getelementptr inbounds nuw i8, ptr %1, i64 8
  invoke void @__std_exception_copy(ptr noundef nonnull %4, ptr noundef nonnull %3)
          to label %7 unwind label %5

5:                                                ; preds = %2
  %6 = cleanuppad within none []
  call void @__std_terminate() #17 [ "funclet"(token %6) ]
  unreachable

7:                                                ; preds = %2
  store ptr @"??_7_System_error@std@@6B@", ptr %0, align 8
  %8 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %9 = getelementptr inbounds nuw i8, ptr %1, i64 24
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %8, ptr noundef nonnull align 8 dereferenceable(16) %9, i64 16, i1 false)
  ret ptr %0
}

; Function Attrs: inlinehint mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @"??0runtime_error@std@@QEAA@AEBV01@@Z"(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #9 comdat align 2 personality ptr @__CxxFrameHandler3 {
  store ptr @"??_7exception@std@@6B@", ptr %0, align 8
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 8
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %3, i8 0, i64 16, i1 false)
  %4 = getelementptr inbounds nuw i8, ptr %1, i64 8
  invoke void @__std_exception_copy(ptr noundef nonnull %4, ptr noundef nonnull %3)
          to label %7 unwind label %5

5:                                                ; preds = %2
  %6 = cleanuppad within none []
  call void @__std_terminate() #17 [ "funclet"(token %6) ]
  unreachable

7:                                                ; preds = %2
  store ptr @"??_7runtime_error@std@@6B@", ptr %0, align 8
  ret ptr %0
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @"??0exception@std@@QEAA@AEBV01@@Z"(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #7 comdat align 2 personality ptr @__CxxFrameHandler3 {
  store ptr @"??_7exception@std@@6B@", ptr %0, align 8
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 8
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %3, i8 0, i64 16, i1 false)
  %4 = getelementptr inbounds nuw i8, ptr %1, i64 8
  invoke void @__std_exception_copy(ptr noundef nonnull %4, ptr noundef nonnull %3)
          to label %5 unwind label %6

5:                                                ; preds = %2
  ret ptr %0

6:                                                ; preds = %2
  %7 = cleanuppad within none []
  call void @__std_terminate() #17 [ "funclet"(token %7) ]
  unreachable
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local void @"??1exception@std@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #7 comdat align 2 personality ptr @__CxxFrameHandler3 {
  store ptr @"??_7exception@std@@6B@", ptr %0, align 8
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 8
  invoke void @__std_exception_destroy(ptr noundef nonnull %2)
          to label %3 unwind label %4

3:                                                ; preds = %1
  ret void

4:                                                ; preds = %1
  %5 = cleanuppad within none []
  call void @__std_terminate() #17 [ "funclet"(token %5) ]
  unreachable
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @"?name@_Iostream_error_category2@std@@UEBAPEBDXZ"(ptr noundef nonnull align 8 dereferenceable(16) %0) unnamed_addr #7 comdat align 2 {
  ret ptr @"??_C@_08LLGCOLLL@iostream?$AA@"
}

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local void @"?message@_Iostream_error_category2@std@@UEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@H@Z"(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr dead_on_unwind noalias writable sret(%"class.std::basic_string") align 8 %1, i32 noundef %2) unnamed_addr #0 comdat align 2 personality ptr @__CxxFrameHandler3 {
  %4 = icmp eq i32 %2, 1
  br i1 %4, label %5, label %11

5:                                                ; preds = %3
  %6 = getelementptr inbounds nuw i8, ptr %1, i64 8
  store i64 0, ptr %6, align 8
  %7 = tail call noalias noundef nonnull dereferenceable(32) ptr @"??2@YAPEAX_K@Z"(i64 noundef 32) #20
  store ptr %7, ptr %1, align 8
  %8 = getelementptr inbounds nuw i8, ptr %1, i64 16
  store i64 21, ptr %8, align 8
  %9 = getelementptr inbounds nuw i8, ptr %1, i64 24
  store i64 31, ptr %9, align 8
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(21) %7, ptr noundef nonnull align 16 dereferenceable(21) @"?_Iostream_error@?4??message@_Iostream_error_category2@std@@UEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@3@H@Z@4QBDB", i64 21, i1 false)
  %10 = getelementptr inbounds nuw i8, ptr %7, i64 21
  store i8 0, ptr %10, align 1
  br label %41

11:                                               ; preds = %3
  %12 = tail call noundef ptr @"?_Syserror_map@std@@YAPEBDH@Z"(i32 noundef %2)
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %1, i8 0, i64 16, i1 false)
  %13 = tail call noundef i64 @strlen(ptr noundef nonnull dereferenceable(1) %12) #18
  %14 = icmp slt i64 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %11
  tail call void @"?_Xlen_string@std@@YAXXZ"() #19
  unreachable

16:                                               ; preds = %11
  %17 = icmp samesign ult i64 %13, 16
  br i1 %17, label %35, label %18

18:                                               ; preds = %16
  %19 = or i64 %13, 15
  %20 = tail call i64 @llvm.umax.i64(i64 %19, i64 22)
  %21 = icmp samesign ugt i64 %19, 4094
  br i1 %21, label %22, label %30

22:                                               ; preds = %18
  %23 = add nuw i64 %20, 40
  %24 = tail call noalias noundef nonnull ptr @"??2@YAPEAX_K@Z"(i64 noundef %23) #20
  %25 = ptrtoint ptr %24 to i64
  %26 = add i64 %25, 39
  %27 = and i64 %26, -32
  %28 = inttoptr i64 %27 to ptr
  %29 = getelementptr inbounds i8, ptr %28, i64 -8
  store i64 %25, ptr %29, align 8
  br label %33

30:                                               ; preds = %18
  %31 = add nuw nsw i64 %20, 1
  %32 = tail call noalias noundef nonnull ptr @"??2@YAPEAX_K@Z"(i64 noundef %31) #20
  br label %33

33:                                               ; preds = %30, %22
  %34 = phi ptr [ %28, %22 ], [ %32, %30 ]
  store ptr %34, ptr %1, align 8
  br label %35

35:                                               ; preds = %16, %33
  %36 = phi i64 [ %20, %33 ], [ 15, %16 ]
  %37 = phi ptr [ %34, %33 ], [ %1, %16 ]
  %38 = getelementptr inbounds nuw i8, ptr %1, i64 16
  store i64 %13, ptr %38, align 8
  %39 = getelementptr inbounds nuw i8, ptr %1, i64 24
  store i64 %36, ptr %39, align 8
  tail call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 1 %37, ptr nonnull align 1 %12, i64 %13, i1 false)
  %40 = getelementptr inbounds nuw i8, ptr %37, i64 %13
  store i8 0, ptr %40, align 1
  br label %41

41:                                               ; preds = %35, %5
  ret void
}

; Function Attrs: inlinehint mustprogress nounwind uwtable
define linkonce_odr dso_local void @"?default_error_condition@error_category@std@@UEBA?AVerror_condition@2@H@Z"(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr dead_on_unwind noalias writable sret(%"class.std::error_condition") align 8 %1, i32 noundef %2) unnamed_addr #9 comdat align 2 {
  store i32 %2, ptr %1, align 8
  %4 = getelementptr inbounds nuw i8, ptr %1, i64 8
  store ptr %0, ptr %4, align 8
  ret void
}

; Function Attrs: inlinehint mustprogress nounwind uwtable
define linkonce_odr dso_local noundef zeroext i1 @"?equivalent@error_category@std@@UEBA_NAEBVerror_code@2@H@Z"(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(16) %1, i32 noundef %2) unnamed_addr #9 comdat align 2 {
  %4 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %7 = load i64, ptr %6, align 8
  %8 = getelementptr inbounds nuw i8, ptr %5, i64 8
  %9 = load i64, ptr %8, align 8
  %10 = icmp eq i64 %7, %9
  %11 = load i32, ptr %1, align 8
  %12 = icmp eq i32 %11, %2
  %13 = select i1 %10, i1 %12, i1 false
  ret i1 %13
}

; Function Attrs: inlinehint mustprogress nounwind uwtable
define linkonce_odr dso_local noundef zeroext i1 @"?equivalent@error_category@std@@UEBA_NHAEBVerror_condition@2@@Z"(ptr noundef nonnull align 8 dereferenceable(16) %0, i32 noundef %1, ptr noundef nonnull align 8 dereferenceable(16) %2) unnamed_addr #9 comdat align 2 {
  %4 = alloca %"class.std::error_condition", align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #18
  %5 = load ptr, ptr %0, align 8
  %6 = getelementptr inbounds nuw i8, ptr %5, i64 24
  %7 = load ptr, ptr %6, align 8
  call void %7(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr dead_on_unwind nonnull writable sret(%"class.std::error_condition") align 8 %4, i32 noundef %1) #18
  %8 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %9 = load ptr, ptr %8, align 8
  %10 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds nuw i8, ptr %9, i64 8
  %13 = load i64, ptr %12, align 8
  %14 = getelementptr inbounds nuw i8, ptr %11, i64 8
  %15 = load i64, ptr %14, align 8
  %16 = icmp eq i64 %13, %15
  %17 = load i32, ptr %4, align 8
  %18 = load i32, ptr %2, align 8
  %19 = icmp eq i32 %17, %18
  %20 = select i1 %16, i1 %19, i1 false
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #18
  ret i1 %20
}

; Function Attrs: inlinehint mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @"??_G_Iostream_error_category2@std@@UEAAPEAXI@Z"(ptr noundef nonnull align 8 dereferenceable(16) %0, i32 noundef %1) unnamed_addr #9 comdat align 2 {
  %3 = and i32 %1, 1
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %6, label %5

5:                                                ; preds = %2
  tail call void @"??3@YAXPEAX_K@Z"(ptr noundef nonnull %0, i64 noundef 16) #21
  br label %6

6:                                                ; preds = %5, %2
  ret ptr %0
}

declare dso_local noundef ptr @"?_Syserror_map@std@@YAPEBDH@Z"(i32 noundef) local_unnamed_addr #10

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #11

; Function Attrs: inlinehint mustprogress noreturn uwtable
define linkonce_odr dso_local void @"?_Xlen_string@std@@YAXXZ"() local_unnamed_addr #12 comdat {
  tail call void @"?_Xlength_error@std@@YAXPEBD@Z"(ptr noundef nonnull @"??_C@_0BA@JFNIOLAK@string?5too?5long?$AA@") #19
  unreachable
}

; Function Attrs: noreturn
declare dso_local void @"?_Xlength_error@std@@YAXPEBD@Z"(ptr noundef) local_unnamed_addr #13

; Function Attrs: inlinehint mustprogress noreturn uwtable
define linkonce_odr dso_local void @"?_Throw_bad_array_new_length@std@@YAXXZ"() local_unnamed_addr #12 comdat {
  %1 = alloca %"class.std::bad_array_new_length", align 8
  %2 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %3 = getelementptr inbounds nuw i8, ptr %1, i64 16
  store i64 0, ptr %3, align 8
  store ptr @"??_C@_0BF@KINCDENJ@bad?5array?5new?5length?$AA@", ptr %2, align 8
  store ptr @"??_7bad_array_new_length@std@@6B@", ptr %1, align 8
  call void @_CxxThrowException(ptr nonnull %1, ptr nonnull @"_TI3?AVbad_array_new_length@std@@") #19
  unreachable
}

; Function Attrs: cold noreturn nounwind memory(inaccessiblemem: write)
declare void @llvm.trap() #14

; Function Attrs: inlinehint mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @"??0bad_array_new_length@std@@QEAA@AEBV01@@Z"(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #9 comdat align 2 personality ptr @__CxxFrameHandler3 {
  store ptr @"??_7exception@std@@6B@", ptr %0, align 8
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 8
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %3, i8 0, i64 16, i1 false)
  %4 = getelementptr inbounds nuw i8, ptr %1, i64 8
  invoke void @__std_exception_copy(ptr noundef nonnull %4, ptr noundef nonnull %3)
          to label %7 unwind label %5

5:                                                ; preds = %2
  %6 = cleanuppad within none []
  call void @__std_terminate() #17 [ "funclet"(token %6) ]
  unreachable

7:                                                ; preds = %2
  store ptr @"??_7bad_array_new_length@std@@6B@", ptr %0, align 8
  ret ptr %0
}

; Function Attrs: inlinehint mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @"??0bad_alloc@std@@QEAA@AEBV01@@Z"(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #9 comdat align 2 personality ptr @__CxxFrameHandler3 {
  store ptr @"??_7exception@std@@6B@", ptr %0, align 8
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 8
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %3, i8 0, i64 16, i1 false)
  %4 = getelementptr inbounds nuw i8, ptr %1, i64 8
  invoke void @__std_exception_copy(ptr noundef nonnull %4, ptr noundef nonnull %3)
          to label %7 unwind label %5

5:                                                ; preds = %2
  %6 = cleanuppad within none []
  call void @__std_terminate() #17 [ "funclet"(token %6) ]
  unreachable

7:                                                ; preds = %2
  store ptr @"??_7bad_alloc@std@@6B@", ptr %0, align 8
  ret ptr %0
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @"?what@exception@std@@UEBAPEBDXZ"(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #7 comdat align 2 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %3 = load ptr, ptr %2, align 8
  %4 = icmp eq ptr %3, null
  %5 = select i1 %4, ptr @"??_C@_0BC@EOODALEL@Unknown?5exception?$AA@", ptr %3
  ret ptr %5
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @"??_Gexception@std@@UEAAPEAXI@Z"(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef %1) unnamed_addr #7 comdat align 2 personality ptr @__CxxFrameHandler3 {
  store ptr @"??_7exception@std@@6B@", ptr %0, align 8
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 8
  invoke void @__std_exception_destroy(ptr noundef nonnull %3)
          to label %6 unwind label %4

4:                                                ; preds = %2
  %5 = cleanuppad within none []
  call void @__std_terminate() #17 [ "funclet"(token %5) ]
  unreachable

6:                                                ; preds = %2
  %7 = and i32 %1, 1
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %6
  tail call void @"??3@YAXPEAX_K@Z"(ptr noundef nonnull %0, i64 noundef 24) #21
  br label %10

10:                                               ; preds = %9, %6
  ret ptr %0
}

declare dso_local void @__std_exception_destroy(ptr noundef) local_unnamed_addr #10

; Function Attrs: inlinehint mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @"??_Gbad_alloc@std@@UEAAPEAXI@Z"(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef %1) unnamed_addr #9 comdat align 2 personality ptr @__CxxFrameHandler3 {
  store ptr @"??_7exception@std@@6B@", ptr %0, align 8
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 8
  invoke void @__std_exception_destroy(ptr noundef nonnull %3)
          to label %6 unwind label %4

4:                                                ; preds = %2
  %5 = cleanuppad within none []
  call void @__std_terminate() #17 [ "funclet"(token %5) ]
  unreachable

6:                                                ; preds = %2
  %7 = and i32 %1, 1
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %6
  tail call void @"??3@YAXPEAX_K@Z"(ptr noundef nonnull %0, i64 noundef 24) #21
  br label %10

10:                                               ; preds = %9, %6
  ret ptr %0
}

; Function Attrs: inlinehint mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @"??_Gbad_array_new_length@std@@UEAAPEAXI@Z"(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef %1) unnamed_addr #9 comdat align 2 personality ptr @__CxxFrameHandler3 {
  store ptr @"??_7exception@std@@6B@", ptr %0, align 8
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 8
  invoke void @__std_exception_destroy(ptr noundef nonnull %3)
          to label %6 unwind label %4

4:                                                ; preds = %2
  %5 = cleanuppad within none []
  call void @__std_terminate() #17 [ "funclet"(token %5) ]
  unreachable

6:                                                ; preds = %2
  %7 = and i32 %1, 1
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %6
  tail call void @"??3@YAXPEAX_K@Z"(ptr noundef nonnull %0, i64 noundef 24) #21
  br label %10

10:                                               ; preds = %9, %6
  ret ptr %0
}

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local noundef ptr @"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z"(ptr noundef nonnull returned align 8 dereferenceable(40) %0, ptr dead_on_return noundef %1, ptr noundef %2) unnamed_addr #0 comdat align 2 personality ptr @__CxxFrameHandler3 {
  %4 = alloca %"class.std::basic_string", align 8
  %5 = alloca %"class.std::error_code", align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #18
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %4, i8 0, i64 16, i1 false)
  %6 = tail call noundef i64 @strlen(ptr noundef nonnull dereferenceable(1) %2) #18
  %7 = icmp slt i64 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %3
  tail call void @"?_Xlen_string@std@@YAXXZ"() #19
  unreachable

9:                                                ; preds = %3
  %10 = icmp samesign ult i64 %6, 16
  br i1 %10, label %28, label %11

11:                                               ; preds = %9
  %12 = or i64 %6, 15
  %13 = tail call i64 @llvm.umax.i64(i64 %12, i64 22)
  %14 = icmp samesign ugt i64 %12, 4094
  br i1 %14, label %15, label %23

15:                                               ; preds = %11
  %16 = add nuw i64 %13, 40
  %17 = tail call noalias noundef nonnull ptr @"??2@YAPEAX_K@Z"(i64 noundef %16) #20
  %18 = ptrtoint ptr %17 to i64
  %19 = add i64 %18, 39
  %20 = and i64 %19, -32
  %21 = inttoptr i64 %20 to ptr
  %22 = getelementptr inbounds i8, ptr %21, i64 -8
  store i64 %18, ptr %22, align 8
  br label %26

23:                                               ; preds = %11
  %24 = add nuw nsw i64 %13, 1
  %25 = tail call noalias noundef nonnull ptr @"??2@YAPEAX_K@Z"(i64 noundef %24) #20
  br label %26

26:                                               ; preds = %23, %15
  %27 = phi ptr [ %21, %15 ], [ %25, %23 ]
  store ptr %27, ptr %4, align 8
  br label %28

28:                                               ; preds = %9, %26
  %29 = phi i64 [ %13, %26 ], [ 15, %9 ]
  %30 = phi ptr [ %27, %26 ], [ %4, %9 ]
  %31 = getelementptr inbounds nuw i8, ptr %4, i64 16
  store i64 %6, ptr %31, align 8
  %32 = getelementptr inbounds nuw i8, ptr %4, i64 24
  store i64 %29, ptr %32, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 1 %30, ptr nonnull align 1 %2, i64 %6, i1 false)
  %33 = getelementptr inbounds nuw i8, ptr %30, i64 %6
  store i8 0, ptr %33, align 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef nonnull align 8 dereferenceable(16) %1, i64 16, i1 false)
  %34 = invoke noundef ptr @"??0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z"(ptr noundef nonnull align 8 dereferenceable(40) %0, ptr dead_on_return noundef nonnull %5, ptr noundef nonnull align 8 dereferenceable(32) %4)
          to label %35 unwind label %57

35:                                               ; preds = %28
  %36 = load i64, ptr %32, align 8
  %37 = icmp ugt i64 %36, 15
  br i1 %37, label %38, label %56

38:                                               ; preds = %35
  %39 = load ptr, ptr %4, align 8
  %40 = add i64 %36, 1
  %41 = icmp ugt i64 %40, 4095
  br i1 %41, label %42, label %53

42:                                               ; preds = %38
  %43 = getelementptr inbounds i8, ptr %39, i64 -8
  %44 = load i64, ptr %43, align 8
  %45 = ptrtoint ptr %39 to i64
  %46 = add i64 %45, -8
  %47 = sub i64 %46, %44
  %48 = icmp ult i64 %47, 32
  br i1 %48, label %50, label %49

49:                                               ; preds = %42
  call void @llvm.trap()
  unreachable

50:                                               ; preds = %42
  %51 = add i64 %36, 40
  %52 = inttoptr i64 %44 to ptr
  br label %53

53:                                               ; preds = %50, %38
  %54 = phi i64 [ %51, %50 ], [ %40, %38 ]
  %55 = phi ptr [ %52, %50 ], [ %39, %38 ]
  call void @"??3@YAXPEAX_K@Z"(ptr noundef %55, i64 noundef %54) #18
  br label %56

56:                                               ; preds = %35, %53
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #18
  store ptr @"??_7system_error@std@@6B@", ptr %0, align 8
  ret ptr %0

57:                                               ; preds = %28
  %58 = cleanuppad within none []
  call void @"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(32) %4) #18 [ "funclet"(token %58) ]
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #18
  cleanupret from %58 unwind to caller
}

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local noundef ptr @"??0_System_error@std@@IEAA@Verror_code@1@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@1@@Z"(ptr noundef nonnull returned align 8 dereferenceable(40) %0, ptr dead_on_return noundef %1, ptr noundef nonnull align 8 dereferenceable(32) %2) unnamed_addr #0 comdat align 2 personality ptr @__CxxFrameHandler3 {
  %4 = alloca %struct.__std_exception_data, align 8
  %5 = alloca %"class.std::basic_string", align 8
  %6 = alloca %"class.std::basic_string", align 8
  %7 = alloca %"class.std::error_code", align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #18
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %6, i8 0, i64 32, i1 false)
  %8 = getelementptr inbounds nuw i8, ptr %2, i64 16
  %9 = load i64, ptr %8, align 8
  %10 = getelementptr inbounds nuw i8, ptr %2, i64 24
  %11 = load i64, ptr %10, align 8
  %12 = icmp ugt i64 %11, 15
  %13 = load ptr, ptr %2, align 8
  %14 = select i1 %12, ptr %13, ptr %2
  %15 = icmp slt i64 %9, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %3
  tail call void @"?_Xlen_string@std@@YAXXZ"() #19
  unreachable

17:                                               ; preds = %3
  %18 = icmp samesign ult i64 %9, 16
  br i1 %18, label %19, label %22

19:                                               ; preds = %17
  %20 = getelementptr inbounds nuw i8, ptr %6, i64 16
  store i64 %9, ptr %20, align 8
  %21 = getelementptr inbounds nuw i8, ptr %6, i64 24
  store i64 15, ptr %21, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %6, ptr noundef nonnull align 1 dereferenceable(16) %14, i64 16, i1 false)
  br label %42

22:                                               ; preds = %17
  %23 = or i64 %9, 15
  %24 = tail call i64 @llvm.umax.i64(i64 %23, i64 22)
  %25 = icmp samesign ugt i64 %23, 4094
  br i1 %25, label %26, label %34

26:                                               ; preds = %22
  %27 = add nuw i64 %24, 40
  %28 = tail call noalias noundef nonnull ptr @"??2@YAPEAX_K@Z"(i64 noundef %27) #20
  %29 = ptrtoint ptr %28 to i64
  %30 = add i64 %29, 39
  %31 = and i64 %30, -32
  %32 = inttoptr i64 %31 to ptr
  %33 = getelementptr inbounds i8, ptr %32, i64 -8
  store i64 %29, ptr %33, align 8
  br label %37

34:                                               ; preds = %22
  %35 = add nuw nsw i64 %24, 1
  %36 = tail call noalias noundef nonnull ptr @"??2@YAPEAX_K@Z"(i64 noundef %35) #20
  br label %37

37:                                               ; preds = %34, %26
  %38 = phi ptr [ %32, %26 ], [ %36, %34 ]
  store ptr %38, ptr %6, align 8
  %39 = getelementptr inbounds nuw i8, ptr %6, i64 16
  store i64 %9, ptr %39, align 8
  %40 = getelementptr inbounds nuw i8, ptr %6, i64 24
  store i64 %24, ptr %40, align 8
  %41 = add nuw i64 %9, 1
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(1) %38, ptr noundef nonnull align 1 dereferenceable(1) %14, i64 %41, i1 false)
  br label %42

42:                                               ; preds = %19, %37
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %7, ptr noundef nonnull align 8 dereferenceable(16) %1, i64 16, i1 false)
  call void @"?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z"(ptr dead_on_unwind nonnull writable sret(%"class.std::basic_string") align 8 %5, ptr dead_on_return noundef nonnull %7, ptr dead_on_return noundef nonnull %6)
  %43 = getelementptr inbounds nuw i8, ptr %5, i64 24
  %44 = load i64, ptr %43, align 8
  %45 = icmp ugt i64 %44, 15
  %46 = load ptr, ptr %5, align 8
  %47 = select i1 %45, ptr %46, ptr %5
  store ptr @"??_7exception@std@@6B@", ptr %0, align 8
  %48 = getelementptr inbounds nuw i8, ptr %0, i64 8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %48, i8 0, i64 16, i1 false)
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #18
  store ptr %47, ptr %4, align 8
  %49 = getelementptr inbounds nuw i8, ptr %4, i64 8
  store i8 1, ptr %49, align 8
  invoke void @__std_exception_copy(ptr noundef nonnull %4, ptr noundef nonnull %48)
          to label %52 unwind label %50

50:                                               ; preds = %42
  %51 = cleanuppad within none []
  call void @__std_terminate() #17 [ "funclet"(token %51) ]
  unreachable

52:                                               ; preds = %42
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #18
  store ptr @"??_7runtime_error@std@@6B@", ptr %0, align 8
  %53 = load i64, ptr %43, align 8
  %54 = icmp ugt i64 %53, 15
  br i1 %54, label %55, label %73

55:                                               ; preds = %52
  %56 = load ptr, ptr %5, align 8
  %57 = add i64 %53, 1
  %58 = icmp ugt i64 %57, 4095
  br i1 %58, label %59, label %70

59:                                               ; preds = %55
  %60 = getelementptr inbounds i8, ptr %56, i64 -8
  %61 = load i64, ptr %60, align 8
  %62 = ptrtoint ptr %56 to i64
  %63 = add i64 %62, -8
  %64 = sub i64 %63, %61
  %65 = icmp ult i64 %64, 32
  br i1 %65, label %67, label %66

66:                                               ; preds = %59
  call void @llvm.trap()
  unreachable

67:                                               ; preds = %59
  %68 = add i64 %53, 40
  %69 = inttoptr i64 %61 to ptr
  br label %70

70:                                               ; preds = %67, %55
  %71 = phi i64 [ %68, %67 ], [ %57, %55 ]
  %72 = phi ptr [ %69, %67 ], [ %56, %55 ]
  call void @"??3@YAXPEAX_K@Z"(ptr noundef %72, i64 noundef %71) #18
  br label %73

73:                                               ; preds = %52, %70
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #18
  store ptr @"??_7_System_error@std@@6B@", ptr %0, align 8
  %74 = getelementptr inbounds nuw i8, ptr %0, i64 24
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %74, ptr noundef nonnull align 8 dereferenceable(16) %1, i64 16, i1 false)
  ret ptr %0
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local void @"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(32) %0) unnamed_addr #7 comdat align 2 personality ptr @__CxxFrameHandler3 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %3 = load i64, ptr %2, align 8
  %4 = icmp ugt i64 %3, 15
  br i1 %4, label %5, label %23

5:                                                ; preds = %1
  %6 = load ptr, ptr %0, align 8
  %7 = add i64 %3, 1
  %8 = icmp ugt i64 %7, 4095
  br i1 %8, label %9, label %20

9:                                                ; preds = %5
  %10 = getelementptr inbounds i8, ptr %6, i64 -8
  %11 = load i64, ptr %10, align 8
  %12 = ptrtoint ptr %6 to i64
  %13 = add i64 %12, -8
  %14 = sub i64 %13, %11
  %15 = icmp ult i64 %14, 32
  br i1 %15, label %17, label %16

16:                                               ; preds = %9
  tail call void @llvm.trap()
  unreachable

17:                                               ; preds = %9
  %18 = add i64 %3, 40
  %19 = inttoptr i64 %11 to ptr
  br label %20

20:                                               ; preds = %17, %5
  %21 = phi i64 [ %18, %17 ], [ %7, %5 ]
  %22 = phi ptr [ %19, %17 ], [ %6, %5 ]
  tail call void @"??3@YAXPEAX_K@Z"(ptr noundef %22, i64 noundef %21) #18
  br label %23

23:                                               ; preds = %1, %20
  %24 = getelementptr inbounds nuw i8, ptr %0, i64 16
  store i64 0, ptr %24, align 8
  store i64 15, ptr %2, align 8
  store i8 0, ptr %0, align 8
  ret void
}

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local void @"?_Makestr@_System_error@std@@CA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@Verror_code@2@V32@@Z"(ptr dead_on_unwind noalias writable sret(%"class.std::basic_string") align 8 %0, ptr dead_on_return noundef %1, ptr dead_on_return noundef %2) local_unnamed_addr #0 comdat align 2 personality ptr @__CxxFrameHandler3 {
  %4 = alloca %"class.std::basic_string", align 8
  %5 = getelementptr inbounds nuw i8, ptr %2, i64 16
  %6 = load i64, ptr %5, align 8
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %22, label %8

8:                                                ; preds = %3
  %9 = getelementptr inbounds nuw i8, ptr %2, i64 24
  %10 = load i64, ptr %9, align 8
  %11 = sub i64 %10, %6
  %12 = icmp ult i64 %11, 2
  br i1 %12, label %20, label %13

13:                                               ; preds = %8
  %14 = add i64 %6, 2
  store i64 %14, ptr %5, align 8
  %15 = icmp ugt i64 %10, 15
  %16 = load ptr, ptr %2, align 8
  %17 = select i1 %15, ptr %16, ptr %2
  %18 = getelementptr inbounds nuw i8, ptr %17, i64 %6
  store i16 8250, ptr %18, align 1
  %19 = getelementptr inbounds nuw i8, ptr %17, i64 %14
  store i8 0, ptr %19, align 1
  br label %22

20:                                               ; preds = %8
  %21 = invoke noundef nonnull align 8 dereferenceable(32) ptr @"??$_Reallocate_grow_by@V<lambda_1>@?0???$_Append@D@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV23@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0???$_Append@D@01@AEAAAEAV01@QEBD0@Z@PEBD_K@Z"(ptr noundef nonnull align 8 dereferenceable(32) %2, i64 noundef 2, i8 undef, ptr noundef nonnull @"??_C@_02LMMGGCAJ@?3?5?$AA@", i64 noundef 2)
          to label %22 unwind label %75

22:                                               ; preds = %13, %20, %3
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #18
  %23 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %24 = load ptr, ptr %23, align 8, !noalias !25
  %25 = load i32, ptr %1, align 8, !noalias !25
  %26 = load ptr, ptr %24, align 8, !noalias !25
  %27 = getelementptr inbounds nuw i8, ptr %26, i64 16
  %28 = load ptr, ptr %27, align 8, !noalias !25
  invoke void %28(ptr noundef nonnull align 8 dereferenceable(16) %24, ptr dead_on_unwind nonnull writable sret(%"class.std::basic_string") align 8 %4, i32 noundef %25)
          to label %29 unwind label %75

29:                                               ; preds = %22
  %30 = getelementptr inbounds nuw i8, ptr %4, i64 16
  %31 = load i64, ptr %30, align 8
  %32 = getelementptr inbounds nuw i8, ptr %4, i64 24
  %33 = load i64, ptr %32, align 8
  %34 = icmp ugt i64 %33, 15
  %35 = load ptr, ptr %4, align 8
  %36 = select i1 %34, ptr %35, ptr %4
  %37 = load i64, ptr %5, align 8
  %38 = getelementptr inbounds nuw i8, ptr %2, i64 24
  %39 = load i64, ptr %38, align 8
  %40 = sub i64 %39, %37
  %41 = icmp ugt i64 %31, %40
  br i1 %41, label %49, label %42

42:                                               ; preds = %29
  %43 = add i64 %37, %31
  store i64 %43, ptr %5, align 8
  %44 = icmp ugt i64 %39, 15
  %45 = load ptr, ptr %2, align 8
  %46 = select i1 %44, ptr %45, ptr %2
  %47 = getelementptr inbounds nuw i8, ptr %46, i64 %37
  call void @llvm.memmove.p0.p0.i64(ptr align 1 %47, ptr align 1 %36, i64 %31, i1 false)
  %48 = getelementptr inbounds nuw i8, ptr %46, i64 %43
  store i8 0, ptr %48, align 1
  br label %51

49:                                               ; preds = %29
  %50 = invoke noundef nonnull align 8 dereferenceable(32) ptr @"??$_Reallocate_grow_by@V<lambda_1>@?0???$_Append@D@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV23@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0???$_Append@D@01@AEAAAEAV01@QEBD0@Z@PEBD_K@Z"(ptr noundef nonnull align 8 dereferenceable(32) %2, i64 noundef %31, i8 undef, ptr noundef %36, i64 noundef %31)
          to label %51 unwind label %73

51:                                               ; preds = %42, %49
  %52 = load i64, ptr %32, align 8
  %53 = icmp ugt i64 %52, 15
  br i1 %53, label %54, label %72

54:                                               ; preds = %51
  %55 = load ptr, ptr %4, align 8
  %56 = add i64 %52, 1
  %57 = icmp ugt i64 %56, 4095
  br i1 %57, label %58, label %69

58:                                               ; preds = %54
  %59 = getelementptr inbounds i8, ptr %55, i64 -8
  %60 = load i64, ptr %59, align 8
  %61 = ptrtoint ptr %55 to i64
  %62 = add i64 %61, -8
  %63 = sub i64 %62, %60
  %64 = icmp ult i64 %63, 32
  br i1 %64, label %66, label %65

65:                                               ; preds = %58
  call void @llvm.trap()
  unreachable

66:                                               ; preds = %58
  %67 = add i64 %52, 40
  %68 = inttoptr i64 %60 to ptr
  br label %69

69:                                               ; preds = %66, %54
  %70 = phi i64 [ %67, %66 ], [ %56, %54 ]
  %71 = phi ptr [ %68, %66 ], [ %55, %54 ]
  call void @"??3@YAXPEAX_K@Z"(ptr noundef %71, i64 noundef %70) #18
  br label %72

72:                                               ; preds = %69, %51
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #18
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(32) %2, i64 32, i1 false)
  ret void

73:                                               ; preds = %49
  %74 = cleanuppad within none []
  call void @"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(32) %4) #18 [ "funclet"(token %74) ]
  cleanupret from %74 unwind label %75

75:                                               ; preds = %22, %20, %73
  %76 = cleanuppad within none []
  call void @"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(32) %2) #18 [ "funclet"(token %76) ]
  cleanupret from %76 unwind to caller
}

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(32) ptr @"??$_Reallocate_grow_by@V<lambda_1>@?0???$_Append@D@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV23@QEBD_K@Z@PEBD_K@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV01@_KV<lambda_1>@?0???$_Append@D@01@AEAAAEAV01@QEBD0@Z@PEBD_K@Z"(ptr noundef nonnull align 8 dereferenceable(32) %0, i64 noundef %1, i8 %2, ptr noundef %3, i64 noundef %4) local_unnamed_addr #0 comdat align 2 personality ptr @__CxxFrameHandler3 {
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %7 = load i64, ptr %6, align 8
  %8 = sub i64 9223372036854775807, %7
  %9 = icmp ult i64 %8, %1
  br i1 %9, label %10, label %11

10:                                               ; preds = %5
  tail call void @"?_Xlen_string@std@@YAXXZ"() #19
  unreachable

11:                                               ; preds = %5
  %12 = add i64 %7, %1
  %13 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %14 = load i64, ptr %13, align 8
  %15 = or i64 %12, 15
  %16 = icmp slt i64 %12, 0
  br i1 %16, label %31, label %17

17:                                               ; preds = %11
  %18 = lshr i64 %14, 1
  %19 = xor i64 %18, 9223372036854775807
  %20 = icmp ugt i64 %14, %19
  br i1 %20, label %31, label %21

21:                                               ; preds = %17
  %22 = add nuw i64 %18, %14
  %23 = tail call i64 @llvm.umax.i64(i64 %15, i64 %22)
  %24 = add i64 %23, 1
  %25 = icmp eq i64 %24, 0
  br i1 %25, label %42, label %26

26:                                               ; preds = %21
  %27 = icmp ugt i64 %24, 4095
  br i1 %27, label %28, label %40

28:                                               ; preds = %26
  %29 = icmp ult i64 %24, -39
  br i1 %29, label %31, label %30

30:                                               ; preds = %28
  tail call void @"?_Throw_bad_array_new_length@std@@YAXXZ"() #19
  unreachable

31:                                               ; preds = %17, %11, %28
  %32 = phi i64 [ %23, %28 ], [ 9223372036854775807, %11 ], [ 9223372036854775807, %17 ]
  %33 = add nuw i64 %32, 40
  %34 = tail call noalias noundef nonnull ptr @"??2@YAPEAX_K@Z"(i64 noundef %33) #20
  %35 = ptrtoint ptr %34 to i64
  %36 = add i64 %35, 39
  %37 = and i64 %36, -32
  %38 = inttoptr i64 %37 to ptr
  %39 = getelementptr inbounds i8, ptr %38, i64 -8
  store i64 %35, ptr %39, align 8
  br label %42

40:                                               ; preds = %26
  %41 = tail call noalias noundef nonnull ptr @"??2@YAPEAX_K@Z"(i64 noundef %24) #20
  br label %42

42:                                               ; preds = %21, %31, %40
  %43 = phi i64 [ %23, %40 ], [ %32, %31 ], [ -1, %21 ]
  %44 = phi ptr [ %41, %40 ], [ %38, %31 ], [ null, %21 ]
  store i64 %12, ptr %6, align 8
  store i64 %43, ptr %13, align 8
  %45 = icmp ugt i64 %14, 15
  br i1 %45, label %46, label %66

46:                                               ; preds = %42
  %47 = load ptr, ptr %0, align 8
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 1 %44, ptr align 1 %47, i64 %7, i1 false)
  %48 = getelementptr i8, ptr %44, i64 %7
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 1 %48, ptr align 1 %3, i64 %4, i1 false)
  %49 = getelementptr i8, ptr %48, i64 %4
  store i8 0, ptr %49, align 1
  %50 = add i64 %14, 1
  %51 = icmp ugt i64 %50, 4095
  br i1 %51, label %52, label %63

52:                                               ; preds = %46
  %53 = getelementptr inbounds i8, ptr %47, i64 -8
  %54 = load i64, ptr %53, align 8
  %55 = ptrtoint ptr %47 to i64
  %56 = add i64 %55, -8
  %57 = sub i64 %56, %54
  %58 = icmp ult i64 %57, 32
  br i1 %58, label %60, label %59

59:                                               ; preds = %52
  tail call void @llvm.trap()
  unreachable

60:                                               ; preds = %52
  %61 = add i64 %14, 40
  %62 = inttoptr i64 %54 to ptr
  br label %63

63:                                               ; preds = %46, %60
  %64 = phi i64 [ %61, %60 ], [ %50, %46 ]
  %65 = phi ptr [ %62, %60 ], [ %47, %46 ]
  tail call void @"??3@YAXPEAX_K@Z"(ptr noundef %65, i64 noundef %64) #18
  br label %69

66:                                               ; preds = %42
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 1 %44, ptr nonnull align 8 %0, i64 %7, i1 false)
  %67 = getelementptr i8, ptr %44, i64 %7
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 1 %67, ptr align 1 %3, i64 %4, i1 false)
  %68 = getelementptr i8, ptr %67, i64 %4
  store i8 0, ptr %68, align 1
  br label %69

69:                                               ; preds = %66, %63
  store ptr %44, ptr %0, align 8
  ret ptr %0
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr writeonly captures(none), ptr readonly captures(none), i64, i1 immarg) #5

declare dso_local void @__std_exception_copy(ptr noundef, ptr noundef) local_unnamed_addr #10

; Function Attrs: inlinehint mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @"??_Gruntime_error@std@@UEAAPEAXI@Z"(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef %1) unnamed_addr #9 comdat align 2 personality ptr @__CxxFrameHandler3 {
  store ptr @"??_7exception@std@@6B@", ptr %0, align 8
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 8
  invoke void @__std_exception_destroy(ptr noundef nonnull %3)
          to label %6 unwind label %4

4:                                                ; preds = %2
  %5 = cleanuppad within none []
  call void @__std_terminate() #17 [ "funclet"(token %5) ]
  unreachable

6:                                                ; preds = %2
  %7 = and i32 %1, 1
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %6
  tail call void @"??3@YAXPEAX_K@Z"(ptr noundef nonnull %0, i64 noundef 24) #21
  br label %10

10:                                               ; preds = %9, %6
  ret ptr %0
}

; Function Attrs: inlinehint mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @"??_G_System_error@std@@UEAAPEAXI@Z"(ptr noundef nonnull align 8 dereferenceable(40) %0, i32 noundef %1) unnamed_addr #9 comdat align 2 personality ptr @__CxxFrameHandler3 {
  store ptr @"??_7exception@std@@6B@", ptr %0, align 8
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 8
  invoke void @__std_exception_destroy(ptr noundef nonnull %3)
          to label %6 unwind label %4

4:                                                ; preds = %2
  %5 = cleanuppad within none []
  call void @__std_terminate() #17 [ "funclet"(token %5) ]
  unreachable

6:                                                ; preds = %2
  %7 = and i32 %1, 1
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %6
  tail call void @"??3@YAXPEAX_K@Z"(ptr noundef nonnull %0, i64 noundef 40) #21
  br label %10

10:                                               ; preds = %9, %6
  ret ptr %0
}

; Function Attrs: inlinehint mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @"??_Gsystem_error@std@@UEAAPEAXI@Z"(ptr noundef nonnull align 8 dereferenceable(40) %0, i32 noundef %1) unnamed_addr #9 comdat align 2 personality ptr @__CxxFrameHandler3 {
  store ptr @"??_7exception@std@@6B@", ptr %0, align 8
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 8
  invoke void @__std_exception_destroy(ptr noundef nonnull %3)
          to label %6 unwind label %4

4:                                                ; preds = %2
  %5 = cleanuppad within none []
  call void @__std_terminate() #17 [ "funclet"(token %5) ]
  unreachable

6:                                                ; preds = %2
  %7 = and i32 %1, 1
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %6
  tail call void @"??3@YAXPEAX_K@Z"(ptr noundef nonnull %0, i64 noundef 40) #21
  br label %10

10:                                               ; preds = %9, %6
  ret ptr %0
}

; Function Attrs: inlinehint mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @"??_Gfailure@ios_base@std@@UEAAPEAXI@Z"(ptr noundef nonnull align 8 dereferenceable(40) %0, i32 noundef %1) unnamed_addr #9 comdat align 2 personality ptr @__CxxFrameHandler3 {
  store ptr @"??_7exception@std@@6B@", ptr %0, align 8
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 8
  invoke void @__std_exception_destroy(ptr noundef nonnull %3)
          to label %6 unwind label %4

4:                                                ; preds = %2
  %5 = cleanuppad within none []
  call void @__std_terminate() #17 [ "funclet"(token %5) ]
  unreachable

6:                                                ; preds = %2
  %7 = and i32 %1, 1
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %6
  tail call void @"??3@YAXPEAX_K@Z"(ptr noundef nonnull %0, i64 noundef 40) #21
  br label %10

10:                                               ; preds = %9, %6
  ret ptr %0
}

; Function Attrs: nounwind
declare dso_local noundef i32 @"?uncaught_exceptions@std@@YAHXZ"() local_unnamed_addr #15

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local void @"?_Osfx@?$basic_ostream@DU?$char_traits@D@std@@@std@@QEAAXXZ"(ptr noundef nonnull align 8 dereferenceable(8) %0) local_unnamed_addr #7 comdat align 2 personality ptr @__CxxFrameHandler3 {
  %2 = alloca %"class.std::error_code", align 8
  %3 = alloca %"class.std::ios_base::failure", align 8
  %4 = load ptr, ptr %0, align 8
  %5 = getelementptr inbounds nuw i8, ptr %4, i64 4
  %6 = load i32, ptr %5, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds i8, ptr %0, i64 %7
  %9 = getelementptr inbounds nuw i8, ptr %8, i64 16
  %10 = load i32, ptr %9, align 8
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %56

12:                                               ; preds = %1
  %13 = getelementptr inbounds nuw i8, ptr %8, i64 24
  %14 = load i32, ptr %13, align 8
  %15 = and i32 %14, 2
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %56, label %17

17:                                               ; preds = %12
  %18 = getelementptr inbounds nuw i8, ptr %8, i64 72
  %19 = load ptr, ptr %18, align 8
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds nuw i8, ptr %20, i64 104
  %22 = load ptr, ptr %21, align 8
  %23 = invoke noundef i32 %22(ptr noundef nonnull align 8 dereferenceable(104) %19)
          to label %24 unwind label %52

24:                                               ; preds = %17
  %25 = icmp eq i32 %23, -1
  br i1 %25, label %26, label %56

26:                                               ; preds = %24
  %27 = load ptr, ptr %0, align 8
  %28 = getelementptr inbounds nuw i8, ptr %27, i64 4
  %29 = load i32, ptr %28, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i8, ptr %0, i64 %30
  %32 = getelementptr inbounds nuw i8, ptr %31, i64 16
  %33 = load i32, ptr %32, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  %34 = and i32 %33, 19
  %35 = or disjoint i32 %34, 4
  store i32 %35, ptr %32, align 8
  %36 = getelementptr inbounds nuw i8, ptr %31, i64 20
  %37 = load i32, ptr %36, align 4
  %38 = and i32 %37, %35
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %51, label %40

40:                                               ; preds = %26
  %41 = and i32 %37, 4
  %42 = icmp eq i32 %41, 0
  %43 = and i32 %38, 2
  %44 = icmp eq i32 %43, 0
  %45 = select i1 %44, ptr @"??_C@_0BF@OOHOMBOF@ios_base?3?3eofbit?5set?$AA@", ptr @"??_C@_0BG@FMKFHCIL@ios_base?3?3failbit?5set?$AA@"
  %46 = select i1 %42, ptr %45, ptr @"??_C@_0BF@PHHKMMFD@ios_base?3?3badbit?5set?$AA@"
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store i32 1, ptr %2, align 8
  %47 = getelementptr inbounds nuw i8, ptr %2, i64 8
  store ptr @"?_Static@?1???$_Immortalize_memcpy_image@V_Iostream_error_category2@std@@@std@@YAAEBV_Iostream_error_category2@1@XZ@4V21@B", ptr %47, align 8
  %48 = invoke noundef ptr @"??0system_error@std@@QEAA@Verror_code@1@PEBD@Z"(ptr noundef nonnull align 8 dereferenceable(40) %3, ptr dead_on_return noundef nonnull %2, ptr noundef nonnull %46)
          to label %49 unwind label %52

49:                                               ; preds = %40
  store ptr @"??_7failure@ios_base@std@@6B@", ptr %3, align 8
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  invoke void @_CxxThrowException(ptr nonnull %3, ptr nonnull @"_TI5?AVfailure@ios_base@std@@") #19
          to label %50 unwind label %52

50:                                               ; preds = %49
  unreachable

51:                                               ; preds = %26
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  br label %56

52:                                               ; preds = %40, %49, %17
  %53 = catchswitch within none [label %54] unwind label %57

54:                                               ; preds = %52
  %55 = catchpad within %53 [ptr null, i32 64, ptr null]
  catchret from %55 to label %56

56:                                               ; preds = %51, %1, %12, %24, %54
  ret void

57:                                               ; preds = %52
  %58 = cleanuppad within none []
  call void @__std_terminate() #17 [ "funclet"(token %58) ]
  unreachable
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umax.i64(i64, i64) #16

attributes #0 = { mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nobuiltin allocsize(0) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nobuiltin nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress norecurse uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { inlinehint mustprogress nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #12 = { inlinehint mustprogress noreturn uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { noreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { cold noreturn nounwind memory(inaccessiblemem: write) }
attributes #15 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #16 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #17 = { noreturn nounwind }
attributes #18 = { nounwind }
attributes #19 = { noreturn }
attributes #20 = { allocsize(0) }
attributes #21 = { builtin nounwind }

!llvm.dbg.cu = !{!0}
!llvm.linker.options = !{!2, !3, !4, !5, !6, !7, !8, !9, !10}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "s15_exercise.cpp", directory: "C:\\DEV\\coroutines-cpp20\\sessions\\s15")
!2 = !{!"/FAILIFMISMATCH:\22_COROUTINE_ABI=2\22"}
!3 = !{!"/FAILIFMISMATCH:\22_MSC_VER=1900\22"}
!4 = !{!"/FAILIFMISMATCH:\22_ITERATOR_DEBUG_LEVEL=0\22"}
!5 = !{!"/FAILIFMISMATCH:\22RuntimeLibrary=MT_StaticRelease\22"}
!6 = !{!"/DEFAULTLIB:libcpmt.lib"}
!7 = !{!"/FAILIFMISMATCH:\22_CRT_STDIO_ISO_WIDE_SPECIFIERS=0\22"}
!8 = !{!"/alternatename:_Avx2WmemEnabled=_Avx2WmemEnabledWeakValue"}
!9 = !{!"/FAILIFMISMATCH:\22annotate_string=0\22"}
!10 = !{!"/FAILIFMISMATCH:\22annotate_vector=0\22"}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 2}
!13 = !{i32 8, !"PIC Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 2}
!15 = !{i32 1, !"MaxTLSAlign", i32 65536}
!16 = !{!"clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)"}
!17 = !{!18}
!18 = distinct !{!18, !19, !"?get_return_object@promise_type@Task@@QEAA?AU2@XZ: argument 0"}
!19 = distinct !{!19, !"?get_return_object@promise_type@Task@@QEAA?AU2@XZ"}
!20 = !{!21}
!21 = distinct !{!21, !22, !"?make_error_code@std@@YA?AVerror_code@1@W4io_errc@1@@Z: argument 0"}
!22 = distinct !{!22, !"?make_error_code@std@@YA?AVerror_code@1@W4io_errc@1@@Z"}
!23 = !{}
!24 = !{i64 8}
!25 = !{!26}
!26 = distinct !{!26, !27, !"?message@error_code@std@@QEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ: argument 0"}
!27 = distinct !{!27, !"?message@error_code@std@@QEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@2@XZ"}

# drjoy
# Json解析にフィールド名を参照するため保持
-keepclassmembers class jp.drjoy.app.data.repository.api.entity.** {*;}
-keepclassmembers class * extends java.lang.Enum {
    <fields>;
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# retrofit2
-dontnote retrofit2.Platform
-dontwarn retrofit2.Platform$Java8
-keepattributes Signature
-keepattributes Exceptions

# dagger
-dontwarn com.google.errorprone.annotations.*

#okhttp
-dontwarn okhttp3.**
-dontwarn okio.**
-dontwarn javax.annotation.**
-dontwarn org.conscrypt.**
# A resource is loaded with a relative path so the package of this class must be preserved.
-keepnames class okhttp3.internal.publicsuffix.PublicSuffixDatabase

# android arch
-keep class android.arch.** { *; }
-keep class android.support.v4.app.** { *; }
-keepclassmembers class ** {
    @android.arch.lifecycle.OnLifecycleEvent <methods>;
}

# event bus
-keepattributes *Annotation*
-keepclassmembers class ** {
    @org.greenrobot.eventbus.Subscribe <methods>;
}
-keep enum org.greenrobot.eventbus.ThreadMode { *; }
-keepclassmembers class * extends org.greenrobot.eventbus.util.ThrowableFailureEvent {
    <init>(java.lang.Throwable);
}

# Android Saripaar
-keep class com.mobsandgeeks.saripaar.** {*;}
-keep @com.mobsandgeeks.saripaar.annotation.ValidateUsing class * {*;}

# glide
# firebaseui が glide4.0に非対応のため class not found の警告が出る
# glideのバージョンを下げるか、firebaseuiを使わないかは要検討
-dontwarn com.bumptech.glide.load.model.stream.StreamModelLoader
-keep public class * extends com.bumptech.glide.module.AppGlideModule
-keep class com.bumptech.glide.GeneratedAppGlideModuleImpl
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public enum com.bumptech.glide.load.ImageHeaderParser$** {
  **[] $VALUES;
  public *;
}

# Parceler library
-keep interface org.parceler.Parcel
-keep @org.parceler.Parcel class * { *; }
-keep class **$$Parcelable { *; }

# simplecropview
-dontwarn io.reactivex.annotations.NonNull

#================================= DEFAULT PROGUARD RULES =========================================#
#Use 5 step of optimization
-optimizationpasses 5

#When not preverifing in a case-insensitive filing system, such as Windows. This tool will unpack your processed jars,(if using windows you should then use):
-dontusemixedcaseclassnames

#Specifies not to ignore non-public library classes. As of version 4.5, this is the default setting
-dontskipnonpubliclibraryclasses

# Optimization is turned off by default. Dex does not like code run
# through the ProGuard optimize and preverify steps (and performs some
# of these optimizations on its own).
-dontoptimize
-dontpreverify

#Specifies to write out some more information during processing.
#If the program terminates with an exception, this option will print out the entire stack trace, instead of just the exception message.
-verbose

#Keep classes that are referenced on the AndroidManifest
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference
-keep public class com.google.vending.licensing.ILicensingService
-keep public class com.android.vending.licensing.ILicensingService
#Compatibility library
-keep public class * extends android.support.v4.app.Fragment
-keep public class * extends android.app.Fragment


# keep setters in Views so that animations can still work.
# see http://proguard.sourceforge.net/manual/examples.html#beans
 -keepclassmembers public class * extends android.view.View {
  void set*(***);
  *** get*();
}

#To remove debug logs:
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** v(...);
    public static *** w(...);
}


#Maintain java native methods
-keepclasseswithmembernames class * {
    native <methods>;
}


#To maintain custom components names that are used on layouts XML:
-keep public class * extends android.view.View {
    public <init>(android.content.Context);
}
-keep public class * extends android.view.View {
    public <init>(android.content.Context, android.util.AttributeSet);
}
-keep public class * extends android.view.View {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

#Maintain enums
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

#To keep parcelable classes (to serialize - deserialize objects to sent through Intents)
-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}

#Keep the R
-keepclassmembers class **.R$* {
    public static <fields>;
}

-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**
-dontwarn android.support.v4.**

-dontwarn com.google.android.material.**
-keep class com.google.android.material.** { *; }

-dontwarn androidx.**
-keep class androidx.** { *; }
-keep interface androidx.** { *; }


-keepclassmembers enum jp.drjoy.app.** { *; }

-keepclassmembers class jp.drjoy.app.data.repository.firebase.entity.** {*;}
-keepclassmembers class jp.drjoy.app.data.repository.firebase.error.** {*;}
-keepclassmembers class jp.drjoy.app.domain.model.** {*;}
-keepclassmembers class jp.drjoy.app.presentasion.model.** {*;}

-dontwarn com.caverock.androidsvg.**

# for crashlytics
-keepattributes SourceFile,LineNumberTable
-keep public class * extends java.lang.Exception
-keep class com.crashlytics.** { *; }
-dontwarn com.crashlytics.**

-keepclassmembers class jp.drjoy.app.presentasion.widget.webmeeting.loading.** { *; }
-keep class com.opentok.** { *; }
-dontwarn com.opentok.**
-keep class org.webrtc.** { *; }
-keep class org.otwebrtc.** { *; }
-keep class com.vonage.** { *; }
-dontwarn com.vonage.**
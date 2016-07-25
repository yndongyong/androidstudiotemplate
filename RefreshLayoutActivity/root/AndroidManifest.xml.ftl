<manifest xmlns:android="http://schemas.android.com/apk/res/android" >

<uses-permission android:name="android.permission.INTERNET"/>
    <application>
       <activity android:name="${relativePackage}.${activityClass}<#if generateAA>_</#if>"  
            <#if isNewProject>
            android:label="@string/app_name"
            <#else>
            android:label=""
            </#if>
            >
            <#if isLauncher>
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
            </#if>
        </activity>
    </application>

</manifest>


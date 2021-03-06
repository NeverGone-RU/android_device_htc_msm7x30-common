package com.cyanogenmod.settings.device;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceManager;

public class WakeMethod implements OnPreferenceChangeListener {

    private static final String FILE_S2W = "/sys/android_touch/sweep2wake";

    private static final String METHOD_NONE = "0";
    private static final String METHOD_SWEEP = "1";
    private static final String METHOD_SWEEP_BACKLIGHT = "2";

    public static boolean isSupported() {
        return Utils.fileExists(FILE_S2W);
    }

    private static void setSysFsForMethod(String method)
    {
        if (method.equals(METHOD_NONE))
        {
             Utils.writeValue(FILE_S2W, "0\n");
        } else
        if (method.equals(METHOD_SWEEP))
        {
             Utils.writeValue(FILE_S2W, "1\n");
        } else
        if (method.equals(METHOD_SWEEP_BACKLIGHT))
        {
             Utils.writeValue(FILE_S2W, "2\n");
        }
    }

    /**
     * Restore WakeMethod setting from SharedPreferences. (Write to kernel.)
     * @param context       The context to read the SharedPreferences from
     */
    public static void restore(Context context) {
        if (!isSupported()) {
            return;
        }

        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        String method = sharedPrefs.getString(TouchscreenFragmentActivity.KEY_WAKE_METHOD, "0");
        setSysFsForMethod(method);
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        setSysFsForMethod((String)newValue);
        return true;
    }

}

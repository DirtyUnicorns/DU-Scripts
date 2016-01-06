package com.cyanogen.lookup.phonenumber.provider;

import android.content.Context;
import android.os.Handler;
import com.cyanogen.lookup.phonenumber.contract.LookupProvider;
import com.cyanogen.lookup.phonenumber.request.LookupRequest;

/**
 * Shell implementation of a phonenumber LookupProvider
 */
public class LookupProviderImpl implements LookupProvider {

    public LookupProviderImpl(Context context, Handler handler) {
        /* NOT IMPLEMENTED */
    }

    @Override
    public boolean initialize() {
        /* NOT a valid implementation */
        return false;
    }

    @Override
    public void fetchInfo(final LookupRequest request) {
        /* NOT IMPLEMENTED */
    }

    @Override
    public void disable() {
        /* NOT IMPLEMENTED */
    }

    @Override
    public boolean isEnabled() {
        /* NOT a valid implementation */
        return false;
    }
}

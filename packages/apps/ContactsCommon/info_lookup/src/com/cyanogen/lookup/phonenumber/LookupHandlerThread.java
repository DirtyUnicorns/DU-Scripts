package com.cyanogen.lookup.phonenumber;

import android.content.Context;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import com.cyanogen.lookup.phonenumber.provider.LookupProviderImpl;
import com.cyanogen.lookup.phonenumber.request.LookupRequest;

import java.util.HashSet;

public class LookupHandlerThread extends HandlerThread implements Handler.Callback {

    private static final int MSG_FETCH_INFO = 0;

    private Context mContext;
    private Handler mHandler;
    private LookupProviderImpl mLookupProvider;
    private HashSet<LookupRequest> mSubmittedRequests;
    private boolean mInitialized = false;

    public LookupHandlerThread(String name, Context ctx) {
        super(name);
        mContext = ctx;
        mLookupProvider = new LookupProviderImpl(mContext, null);
    }

    public LookupHandlerThread(String name, int priority, Context ctx) {
        super(name, priority);
        mContext = ctx;
        mLookupProvider = new LookupProviderImpl(mContext, null);
    }

    public boolean initialize() {
        if (mInitialized) {
            return true;
        }

        mInitialized = mLookupProvider.initialize();
        if (mInitialized) {
            mSubmittedRequests = new HashSet<>();
            start();
            mHandler = new Handler(getLooper(), this);
        }

        return mInitialized;
    }

    public boolean isProviderEnabled() {
        return mLookupProvider.isEnabled();
    }

    public void tearDown() {
        if (mInitialized) {
            quit();
            mLookupProvider.disable();
            mInitialized = false;
        }
    }

    public boolean fetchInfoForPhoneNumber(LookupRequest lookupRequest) {
        if (!mSubmittedRequests.contains(lookupRequest)) {
            Message msg = mHandler.obtainMessage(MSG_FETCH_INFO);
            msg.obj = lookupRequest;
            boolean requested = mHandler.sendMessage(msg);
            if (requested) {
                mSubmittedRequests.add(lookupRequest);
            }
            return requested;
        }

        return false;
    }

    @Override
    public boolean handleMessage(Message msg) {
        int what = msg.what;
        LookupRequest lookupRequest = (LookupRequest) msg.obj;
        switch (what) {
            case MSG_FETCH_INFO :
                if (mInitialized) {
                    mLookupProvider.fetchInfo(lookupRequest);
                }
        }
        return true;
    }
}

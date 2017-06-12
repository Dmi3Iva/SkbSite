package com.kantiana.skb.model;

import java.time.LocalDateTime;

/**
 * Created by FTL on 12.06.2017.
 */
public class EasyTime {
    String begin;
    String end;

    public  void makeSecond(){
        begin+=":00";
        end+=":00";
    }
    public EasyTime(String begin, String end) {
        this.begin = begin;
        this.end = end;
    }

    public EasyTime() {
        this.begin = null;
        this.end = null;
    }

    public void setBegin(String begin) {
        this.begin = begin;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public String getBegin() {
        return begin;
    }

    public String getEnd() {
        return end;
    }
}

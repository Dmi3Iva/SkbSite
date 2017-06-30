package com.kantiana.skb.service;

import com.kantiana.skb.model.AboutPage;
import com.kantiana.skb.model.Booking;

public interface AboutPageService {
    public AboutPage getPage();
    public void save (AboutPage aboutPage);
}

package com.kantiana.skb.model;

import org.springframework.context.i18n.LocaleContext;

import javax.validation.OverridesAttribute;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class RequestEquipment {

    private List<EquipmentTypeCount> equipmentTypeCount;
    private String date;
    private List<String> timeChoose;
    private List<String> timeList;

    public RequestEquipment() {
        this.timeList = new ArrayList<String>();
        this.makeTimeList();
        this.timeChoose = new ArrayList<String>();
        this.equipmentTypeCount = new Vector<EquipmentTypeCount>();
    }

    public RequestEquipment(List<EquipmentTypeCount> equipmentTypeCount, String date, List<String> timeChoose, List<String> timeList) {
        this.equipmentTypeCount = equipmentTypeCount;
        this.date = date;
        this.timeChoose = timeChoose;
        this.timeList = timeList;
    }

    public List<EquipmentTypeCount> getEquipmentTypeCountList() {
        return equipmentTypeCount;
    }

    public void setEquipmentTypeCountList(Vector<EquipmentTypeCount> equipmentTypeCount) {
        this.equipmentTypeCount = equipmentTypeCount;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setEquipmentTypeCountList(List<EquipmentTypeCount> equipmentTypeCount) {
        this.equipmentTypeCount = equipmentTypeCount;
    }

    public List<String> getTimeChoose() {
        return timeChoose;
    }

    public void setTimeChoose(List<String> timeChoose) {
        this.timeChoose = timeChoose;
    }

    public List<String> getTimeList() {
        return timeList;
    }

    public void setTimeList(List<String> timeList) {
        this.timeList = timeList;
    }

    public int getSize(){
        return this.equipmentTypeCount.size();
    }

    public void add(Long idType, Long count, String name){
        this.equipmentTypeCount.add(new EquipmentTypeCount(idType,count, name));
    }

    public void makeTimeList(){
        this.timeList.add("8.30-9.00");
        this.timeList.add("9.00-9.30");
        this.timeList.add("9.30-10.00");
        this.timeList.add("10.00-10.30");
        this.timeList.add("10.30-11.00");
        this.timeList.add("11.30-12.00");
        this.timeList.add("12.00-12.30");
        this.timeList.add("12.30-13.00");
        this.timeList.add("13.00-13.30");
        this.timeList.add("13.30-14.00");
        this.timeList.add("14.00-14.30");
        this.timeList.add("14.30-15.00");
        this.timeList.add("15.00-15.30");
        this.timeList.add("15.30-16.00");
        this.timeList.add("16.00-16.30");
        this.timeList.add("16.30-17.00");
        this.timeList.add("17.00-17.30");
        this.timeList.add("17.30-18.00");
        this.timeList.add("18.00-18.30");
    }

    public java.sql.Date getSqlDate() {
        DateFormat format = new SimpleDateFormat("dd.MM.yyyy");
        try {
            java.util.Date utilDate = format.parse(getDate());
            return new java.sql.Date(utilDate.getTime());
        }
        catch (ParseException pEx) {
            pEx.printStackTrace();
            return null;
        }
    }

    public int getChosenTimeMask() {
        int timeMask = 0;
        Map<String,Integer> timeMap = new HashMap<String,Integer>();
        int i = 0;
        for (String s: getTimeList()){
            timeMap.put( s, i );
            ++i ;
        }
        for (String s: getTimeChoose()) {
            timeMask = timeMask | (1 << timeMap.get(s));
        }
        return timeMask;
    }
}

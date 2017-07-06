package com.kantiana.skb.model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class RequestEquipment {

    private List<EquipmentTypeCount> equipmentTypeCountList;
    private String date;
    private List<String> chosenTime;
    private List<String> timeList;

    public RequestEquipment() {
        this.timeList = new ArrayList<String>();
        timeList = makeTimeList();
        this.chosenTime = new ArrayList<String>();
        this.equipmentTypeCountList = new Vector<EquipmentTypeCount>();
    }

    public RequestEquipment(List<EquipmentTypeCount> equipmentTypeCountList, String date, List<String> chosenTime, List<String> timeList) {
        this.equipmentTypeCountList = equipmentTypeCountList;
        this.date = date;
        this.chosenTime = chosenTime;
        this.timeList = timeList;
    }

    public List<EquipmentTypeCount> getEquipmentTypeCountList() {
        return equipmentTypeCountList;
    }

    public void setEquipmentTypeCountList(Vector<EquipmentTypeCount> equipmentTypeCount) {
        this.equipmentTypeCountList = equipmentTypeCount;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setEquipmentTypeCountList(List<EquipmentTypeCount> equipmentTypeCount) {
        this.equipmentTypeCountList = equipmentTypeCount;
    }

    public List<String> getChosenTime() {
        return chosenTime;
    }

    public void setChosenTime(List<String> chosenTime) {
        this.chosenTime = chosenTime;
    }

    public List<String> getTimeList() {
        return timeList;
    }

    public void setTimeList(List<String> timeList) {
        this.timeList = timeList;
    }

    public int getSize(){
        return this.equipmentTypeCountList.size();
    }

    public void add(Long idType, Long count, String name){
        this.equipmentTypeCountList.add(new EquipmentTypeCount(idType,count, name));
    }

    public static List<String> makeTimeList() {
        List<String> timeList = new LinkedList<>();
        timeList.add("8.30-9.00");
        timeList.add("9.00-9.30");
        timeList.add("9.30-10.00");
        timeList.add("10.00-10.30");
        timeList.add("10.30-11.00");
        timeList.add("11.00-11.30");
        timeList.add("11.30-12.00");
        timeList.add("12.00-12.30");
        timeList.add("12.30-13.00");
        timeList.add("13.00-13.30");
        timeList.add("13.30-14.00");
        timeList.add("14.00-14.30");
        timeList.add("14.30-15.00");
        timeList.add("15.00-15.30");
        timeList.add("15.30-16.00");
        timeList.add("16.00-16.30");
        timeList.add("16.30-17.00");
        timeList.add("17.00-17.30");
        timeList.add("17.30-18.00");
        timeList.add("18.00-18.30");
        return timeList;
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
        for (String s: getChosenTime()) {
            timeMask = timeMask | (1 << timeMap.get(s));
        }
        return timeMask;
    }
}

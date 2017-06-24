package com.kantiana.skb.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;

@Entity
@Table(name = "booking")
public class Booking {
    private Long id;
    private Equipment equipment;
    private Request request;
    private Date day;
    private Integer timeMask;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    @OneToOne
    @JoinColumn(name = "equipment_id")
    public Equipment getEquipment() {
        return equipment;
    }

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "request_id")
    public Request getRequest() {
        return request;
    }

    @Column(name = "day")
    public Date getDay() {
        return day;
    }

    @Column(name = "time_mask")
    public Integer getTimeMask() {
        return timeMask;
    }

    public void setTimeMask(Integer timeMask) {
        this.timeMask = timeMask;
    }
    public void setDay(Date day) {
        this.day = day;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setEquipment(Equipment equipment) {
        this.equipment = equipment;
    }

    public void setRequest(Request request) {
        this.request = request;
    }

}

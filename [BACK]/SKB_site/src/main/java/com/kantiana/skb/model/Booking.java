package com.kantiana.skb.model;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "booking")
public class Booking {
    private Long id;
    private Equipment equipment;
    private Request request;
    private Timestamp begin;
    private Timestamp end;

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

    @ManyToOne
    @JoinColumn(name = "request_id")
    public Request getRequest() {
        return request;
    }

    @Column(name = "time_of_begin")
    public Timestamp getBegin() {
        return begin;
    }

    @Column(name = "time_of_end")
    public Timestamp getEnd() {
        return end;
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

    public void setBegin(Timestamp begin) {
        this.begin = begin;
    }

    public void setEnd(Timestamp end) {
        this.end = end;
    }
}

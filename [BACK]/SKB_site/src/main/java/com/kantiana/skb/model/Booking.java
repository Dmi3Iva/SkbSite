package com.kantiana.skb.model;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "booking")
public class Booking {
    private Long id;
    private Equipment equipment;
    private User user;
    private Timestamp begin;
    private Timestamp end;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public Equipment getEquipment() {
        return equipment;
    }

    public User getUser() {
        return user;
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

    public void setUser(User user) {
        this.user = user;
    }

    public void setBegin(Timestamp begin) {
        this.begin = begin;
    }

    public void setEnd(Timestamp end) {
        this.end = end;
    }
}

package com.kantiana.skb.model;

import org.hibernate.annotations.Generated;

import javax.persistence.*;

@Entity
@Table(name ="Level_Of_Publicity")
public class LevelOfPublicity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name ="name")
    private String name;

    public Long getid()
    {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String username) {
        this.name = username;
    }
}

package com.kantiana.skb.domain;

import javax.annotation.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by dikla on 10.04.2017.
 */
@Entity
@Table(name = "USERS")
public class Users {

    @Id
    @Column(name = "ID")
    @GeneratedValue
    private Integer id;


}

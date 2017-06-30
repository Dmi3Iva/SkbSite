package com.kantiana.skb.model;

import javax.persistence.*;

@Entity
@Table(name = "about")
public class AboutPage {
    private Long id;
    private String text;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "text_about")
    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}

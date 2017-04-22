package com.kantiana.skb.model;

import javax.persistence.*;

@Entity
@Table(name="news")
public class News {
    private Long id;
    private String name;
    private String article;
    private String dateOfCreation;
    private User author;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getArticle() {
        return article;
    }

    public void setArticle(String article) { this.article = article;}

    public String getDateOfCreation() {
        return dateOfCreation;
    }

    public void setDateOfCreation(String dateOfCreation) {
        this.dateOfCreation = dateOfCreation;
    }

    @ManyToOne
    @JoinColumn(name="authorId", nullable=false)
    public User getAuthor() { return author; }

    public void setAuthor(User author) { this.author = author; }
}

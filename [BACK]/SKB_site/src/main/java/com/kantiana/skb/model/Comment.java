package com.kantiana.skb.model;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "comments")
public class Comment {
    private Long id;
    private News news;
    private User author;
    private Date dateOfCreation;
    private String content;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @ManyToOne
    @JoinColumn(name="news_id", nullable=false)
    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    @ManyToOne
    @JoinColumn(name="author_id", nullable=false)
    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Date getDateOfCreation() {
        return dateOfCreation;
    }

    public void setDateOfCreation(Date dateOfCreation) {
        this.dateOfCreation = dateOfCreation;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}

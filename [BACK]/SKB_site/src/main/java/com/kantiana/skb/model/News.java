package com.kantiana.skb.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "news")
public class News {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    //!!!!!!!!!!!!!!!!!!
    @OneToOne
    @JoinColumn(name="author_id")
    private Long authorId;

    @OneToOne
    @JoinColumn(name="level_of_publicity_id")
    private Long level_of_publicity_id;
    //!!!!!!!!!!!!!!!
    @Column(name = "name")
    private String name;

    @Column(name = "photopath")
    private String photoPath;

    @Column(name = "date")
    private String dateStr;

    @Column(name = "article")
    private String article;

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


    public String getPhotoPath() {
        return photoPath;
    }

    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }

    public Long getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Long authorId) {
        this.authorId = authorId;
    }

    public Long getPublicityId() {
        return level_of_publicity_id;
    }

    public void setPublicity(Long lvl) {
        this.level_of_publicity_id = lvl;
    }

    public String getDateStr() {
        return dateStr;
    }

    public void setDateStr(String dateStr) {
        this.dateStr = dateStr;
    }

    public String getArticle() {
        return article;
    }

    public void setarticle(String article) {
        this.article = article;
    }
}

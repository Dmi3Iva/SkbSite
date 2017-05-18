package com.kantiana.skb.model;

import org.hibernate.mapping.Join;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Set;

@Entity
@Table(name="news")
public class News {
    @Id
    @GeneratedValue
    private Long id;

    @Column(name = "")
    private String name;
    private String content;

    @Column(name = "time_of_creation")
    private Timestamp timeOfCreation;
    private User author;
    private Project project;

    //@Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) { this.content = content;}


    public Timestamp getTimeOfCreation() {
        return timeOfCreation;
    }

    public void setTimeOfCreation(Timestamp timeOfCreation) {
        this.timeOfCreation = timeOfCreation;
    }

    @ManyToOne
    @JoinColumn(name = "author_id", nullable=false)
    public User getAuthor() { return author; }

    public void setAuthor(User author) { this.author = author; }

    @ManyToOne
    @JoinColumn(name = "project_id")
    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }


}

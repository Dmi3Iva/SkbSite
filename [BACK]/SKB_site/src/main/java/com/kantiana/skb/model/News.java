package com.kantiana.skb.model;

import org.hibernate.mapping.Join;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Set;

@Entity
@Table(name="news")
public class News {
    private Long id;
    private String name;
    private String content;
    private Timestamp timeOfCreation;
    private Timestamp timeOfLastUpdate;
    private User author;
    private Project project;
    private String photoPath;
    private Set<Comment> comments;

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) { this.content = content;}

    @Column(name = "time_of_creation")
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

    @OneToMany(targetEntity = Comment.class, mappedBy = "news", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    public Set<Comment> getComments() {
        return comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }


    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }

    @Column(name = "photo_path")
    public String getPhotoPath() {
        return photoPath;
    }

    public void setTimeOfLastUpdate(Timestamp timeOfLastUpdate) {
        this.timeOfLastUpdate = timeOfLastUpdate;
    }

    @Column(name = "time_of_last_update")
    public Timestamp getTimeOfLastUpdate() {
        return timeOfLastUpdate;
    }
}

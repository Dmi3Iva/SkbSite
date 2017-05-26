package com.kantiana.skb.model;

import org.hibernate.mapping.Join;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Set;

@Entity
@Table(name="orders")
public class Order {
    private Long id;
    private String name;
    private String content;
    private Timestamp timeOfCreation;
    private Timestamp timeOfLastUpdate;
    private User author;
    private User editor;
    private String photoPath;
//    private Project project;
//    private Set<Comment> comments;

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
    @JoinColumn(name = "editor_id")
    public User getEditor() { return editor; }

    public void setEditor(User editor) { this.editor = editor; }

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

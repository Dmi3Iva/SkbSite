package com.kantiana.skb.model;

import javax.persistence.*;
import java.sql.Timestamp;

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
    private Project project;
    private Boolean checked;

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

    public void setTimeOfLastUpdate(Timestamp timeOfLastUpdate) {
        this.timeOfLastUpdate = timeOfLastUpdate;
    }

    @Column(name = "time_of_last_update")
    public Timestamp getTimeOfLastUpdate() {
        return timeOfLastUpdate;
    }

    @OneToOne
    @JoinColumn(name = "project_id")
    public Project getProject(){
        return project;
    }

    public void setProject(Project project){
        this.project=project;
    }

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }
}

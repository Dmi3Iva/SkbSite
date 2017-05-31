package com.kantiana.skb.model;

import javax.persistence.*;
import java.sql.Date;
import java.util.Set;

@Entity
@Table(name = "projects")
public class Project {
    private Long id;
    private String name;
    private ProjectStatus projectStatus;
    private Long statusPercent;
    private User captain;
    private Date dateOfStart;
    private Date dateOfLastUpdate;
    private String about;
    private String photoPath;
    private Set<News> news;
    private Set<User> members;
    private Order order;

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

    @ManyToOne
    @JoinColumn(name = "status_id", nullable = false)
    public ProjectStatus getProjectStatus() {
        return projectStatus;
    }

    public void setProjectStatus(ProjectStatus projectStatus) {
        this.projectStatus = projectStatus;
    }

    @Column(name = "status_percent")
    public Long getStatusPercent() {
        return statusPercent;
    }

    public void setStatusPercent(Long statusPercent) {
        this.statusPercent = statusPercent;
    }

    @ManyToOne
    @JoinColumn(name = "captain_id", nullable = false)
    public User getCaptain() {
        return captain;
    }

    public void setCaptain(User captain) {
        this.captain = captain;
    }

    @Column(name = "date_of_start")
    public Date getDateOfStart() {
        return dateOfStart;
    }

    public void setDateOfStart(Date dateOfStart) {
        this.dateOfStart = dateOfStart;
    }

    @Column(name = "date_of_last_update")
    public Date getDateOfLastUpdate() {
        return dateOfLastUpdate;
    }

    public void setDateOfLastUpdate(Date dateOfLastUpdate) {
        this.dateOfLastUpdate = dateOfLastUpdate;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    @OneToMany(targetEntity = News.class, mappedBy = "project", cascade = CascadeType.ALL)
    public Set<News> getNews() {
        return news;
    }

    public void setNews(Set<News> news) {
        this.news = news;
    }

    @ManyToMany(mappedBy = "projects")
    public Set<User> getMembers() {
        return members;
    }

    public void setMembers(Set<User> members) {
        this.members = members;
    }

    @Column(name="photo_path")
    public String getPhotoPath() {
        return photoPath;
    }

    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }

    @OneToOne(mappedBy = "projects")
    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order){
        this.order = order;
    }
}

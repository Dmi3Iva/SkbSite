package com.kantiana.skb.model;

import javax.persistence.*;
import java.sql.Date;

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
}

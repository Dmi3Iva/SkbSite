package com.kantiana.skb.model;

import javax.persistence.*;
import java.sql.Date;
import java.util.Set;

@Entity
@Table(name="users")
public class User {
    private Long id;
    private String lastName;
    private String firstName;
    private String middleName;
    private Date dateOfBirth;
    private String username;
    private String email;
    private String organization;
    private String password;
    private String passwordConfirm;
    private String github;
    private String contactDetails;
    private String about;
    private Set<News> news;
    private Set<Role> roles;
    private Set<Comment> comments;
    private Set<Project> ownProjects;
    private Set<Request> requestList;
    private Set<ProjectMembership> projectMemberships;
    private boolean customer;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    @Column(name = "date_of_birth")
    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Transient
    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getOrganization() {
        return organization;
    }

    public void setOrganization(String organization) {
        this.organization = organization;
    }

    public String getGithub() {
        return github;
    }

    public void setGithub(String github) {
        this.github = github;
    }

    @Column(name = "contact_details")
    public String getContactDetails() {
        return contactDetails;
    }

    public void setContactDetails(String contactDetails) {
        this.contactDetails = contactDetails;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    @OneToMany(targetEntity = News.class,  mappedBy = "author", cascade = CascadeType.ALL)
    Set<News> getNews() {
        return news;
    }

    public void setNews(Set<News> news) {
        this.news = news;
    }

    @ManyToMany(fetch=FetchType.EAGER)
    @JoinTable(name = "users_roles",  joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    @OneToMany(targetEntity = Comment.class, mappedBy = "author", cascade = CascadeType.ALL)
    public Set<Comment> getComments() {
        return comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

    @OneToMany(targetEntity = Project.class, mappedBy = "captain", cascade = CascadeType.ALL)
    public Set<Project> getOwnProjects() {
        return ownProjects;
    }

    public void setOwnProjects(Set<Project> ownProjects) {
        this.ownProjects = ownProjects;
    }

    @OneToMany(targetEntity = ProjectMembership.class, mappedBy = "user", fetch = FetchType.EAGER)
    public Set<ProjectMembership> getProjectMemberships() {
        return projectMemberships;
    }

    public void setProjectMemberships(Set<ProjectMembership> projectMemberships) {
        this.projectMemberships = projectMemberships;
    }

    @Transient
    public boolean isCustomer() {
        return customer;
    }

    public void setCustomer(boolean customer) {
        this.customer = customer;
    }

    @OneToMany(targetEntity = Request.class, mappedBy = "user", cascade = CascadeType.ALL)
    public Set<Request> getRequestList() {
        return requestList;
    }

    public void setRequestList(Set<Request> requestList) {
        this.requestList = requestList;
    }

    @Override
    public boolean equals(Object obj) {
        return (obj instanceof User) && ((User)obj).getId() == getId();
    }
}

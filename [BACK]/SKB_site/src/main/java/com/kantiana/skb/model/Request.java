package com.kantiana.skb.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "request")
public class Request {
    private Long id;
    private User user;
    private Set<Booking> bookingSet;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    public User getUser() {
        return user;
    }

    @OneToMany(targetEntity = Booking.class, mappedBy = "request", cascade = CascadeType.ALL)
    public Set<Booking> getBookingSet() {
        return bookingSet;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setBookingSet(Set<Booking> bookingSet) {
        this.bookingSet = bookingSet;
    }
}

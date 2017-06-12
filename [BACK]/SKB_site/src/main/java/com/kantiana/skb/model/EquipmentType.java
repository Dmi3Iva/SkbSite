package com.kantiana.skb.model;

import org.hibernate.annotations.GeneratorType;

import javax.persistence.*;
import javax.transaction.Transactional;
import java.util.Set;

@Entity
@Table(name = "equipment_type")
public class EquipmentType {
    private Long id;
    private String name;
    private String about;
    private String features;
    private String photoPath;
    private Set<Equipment> equipmentSet;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getAbout() {
        return about;
    }

    public String getFeatures() {
        return features;
    }

    @Column(name = "photo_path")
    public String getPhotoPath() {
        return photoPath;
    }

    @Transactional
    @OneToMany(targetEntity = Equipment.class, mappedBy = "equipmentType",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    public Set<Equipment> getEquipmentSet() {
        return equipmentSet;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public void setFeatures(String features) {
        this.features = features;
    }

    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }

    public void setEquipmentSet(Set<Equipment> equipmentSet) {
        this.equipmentSet = equipmentSet;
    }
}

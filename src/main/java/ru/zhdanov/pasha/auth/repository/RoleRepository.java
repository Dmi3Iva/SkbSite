package ru.zhdanov.pasha.auth.repository;

import ru.zhdanov.pasha.auth.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long>{
}
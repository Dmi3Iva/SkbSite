package com.kantiana.skb.service;

import com.kantiana.skb.model.Role;
import com.kantiana.skb.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl implements RoleService{
    @Autowired
    RoleRepository roleRepository;

    /* ВНИМАНИЕ!!! КОСТЫЛИ!!! Смотри функции getRole*/

    @Override
    public Role getRoleAdmin() {
        return roleRepository.findByName("ROLE_ADMIN");
    }

    @Override
    public Role getRoleCustomer() {
        return roleRepository.findByName("ROLE_CUSTOMER");
    }

    @Override
    public Role getRoleMember() {
        return roleRepository.findByName("ROLE_MEMBER");
    }
}

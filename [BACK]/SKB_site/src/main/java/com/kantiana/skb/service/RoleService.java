package com.kantiana.skb.service;

import com.kantiana.skb.model.Role;

public interface RoleService {
    Role getRoleAdmin();

    Role getRoleCustomer();

    Role getRoleMember();

    Role getRoleModerator();
}

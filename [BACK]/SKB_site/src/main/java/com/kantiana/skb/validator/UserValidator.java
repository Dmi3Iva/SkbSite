package com.kantiana.skb.validator;

import com.kantiana.skb.model.User;
import org.springframework.validation.Errors;

import java.util.Map;

public interface UserValidator {
    void validateRegistration(User user, Errors errors);

    void validateChange(User user, Errors errors);

    void validatePasswordChange(String currentPassword, String newPassword, String newPasswordConfirm, Map<String, String> errors);
}

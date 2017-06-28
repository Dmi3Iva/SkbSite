package com.kantiana.skb.validator;

import com.kantiana.skb.model.User;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public interface UserValidator extends Validator {
    void validateRegistration(User user, Errors errors);

    void validateChange(User user, Errors errors);

    void validatePasswordChange(String newPassword, String password, String passwordConfirm, Errors errors);
}

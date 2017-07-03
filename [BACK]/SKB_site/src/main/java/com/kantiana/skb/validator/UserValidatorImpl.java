package com.kantiana.skb.validator;

import com.kantiana.skb.model.User;
import com.kantiana.skb.service.SecurityService;
import com.kantiana.skb.service.UserService;
import org.hibernate.validator.internal.constraintvalidators.hv.EmailValidator;
import org.hibernate.validator.internal.constraintvalidators.hv.URLValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import java.sql.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

@Component
public class UserValidatorImpl implements UserValidator {
    @Autowired
    private UserService userService;
    @Autowired
    private SecurityService securityService;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    private MessageSource messageSource;

    private int USERNAME_MIN_LENGTH = 2;
    private int USERNAME_MAX_LENGTH = 32;
    private int PASSWORD_MIN_LENGTH = 2;
    private int PASSWORD_MAX_LENGTH = 32;

    @Override
    public void validateRegistration(User user, Errors errors) {
        validateFullName(errors);
        validateUsername(user, errors);
        validatePassword(user, errors);
        validateEmail(user, errors);
        // Проверка организации
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "organization", "NotEmpty");
    }

    @Override
    public void validateChange(User user, Errors errors) {
        validateFullName(errors);
        if (!securityService.findLoggedInUsername().equals(user.getUsername())) {
            validateUsername(user, errors);
        }
        validateEmail(user, errors);
        if (user.getDateOfBirth() != null) {
            validateDateOfBirth(user, errors);
        }
        validateGithub(user, errors);
        // Проверка организации
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "organization", "NotEmpty");
    }

    @Override
    public void validatePasswordChange(String currentPassword, String newPassword, String newPasswordConfirm, Map<String, String> errors) {
        String correctCurrentPassword = securityService.findLoggedUser().getPassword();
        if (!bCryptPasswordEncoder.matches(currentPassword, correctCurrentPassword)) {
            errors.put("uncorrectPassword", messageSource.getMessage("Password.uncorrect", null, Locale.ROOT));
        }
        if (newPassword.length() < PASSWORD_MIN_LENGTH || newPassword.length() > PASSWORD_MAX_LENGTH) {
            Object[] arg = {PASSWORD_MIN_LENGTH, PASSWORD_MAX_LENGTH};
            String msg = messageSource.getMessage("Size.user.password", arg, Locale.ROOT);
            errors.put("uncorrectNewPasswordSize", msg);
        }
        if (!newPasswordConfirm.equals(newPassword)) {
            errors.put("uncorrectNewPasswordConfirm", messageSource.getMessage("Diff.user.passwordConfirm", null, Locale.ROOT));
        }
    }

    @Override
    public void validateForgetPassword(User user, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty");
        if (errors.hasErrors()) {
            return;
        }
        if (userService.findByUsername(user.getUsername()) == null) {
            Object[] arg = {user.getUsername()};
            errors.rejectValue("username", "DontExist.user", arg, "");
        }
    }

    private void validateFullName(Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "NotEmpty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "NotEmpty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "middleName", "NotEmpty");
    }

    private void validateUsername(User user, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty");
        if (user.getUsername().length() < USERNAME_MIN_LENGTH || user.getUsername().length() > USERNAME_MAX_LENGTH) {
            Object[] arg = {USERNAME_MIN_LENGTH, USERNAME_MAX_LENGTH};
            errors.rejectValue("username", "Size.user.username", arg, "");
        }
        if (userService.findByUsername(user.getUsername()) != null) {
            Object[] arg = {user.getUsername()};
            errors.rejectValue("username", "Duplicate.user.username", arg, "");
        }
    }

    private void validatePassword(User user, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (user.getPassword().length() < PASSWORD_MIN_LENGTH || user.getPassword().length() > PASSWORD_MAX_LENGTH) {
            Object[] arg = {PASSWORD_MIN_LENGTH, PASSWORD_MAX_LENGTH};
            errors.rejectValue("password", "Size.user.password", arg, "");
        }
        if (!user.getPasswordConfirm().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirm", "Diff.user.passwordConfirm");
        }
    }

    private void validateEmail(User user, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");
        EmailValidator emailValidator = new EmailValidator();
        if (!emailValidator.isValid(user.getEmail(), null)) {
            errors.rejectValue("email", "NotValid.email");
        }
    }

    private void validateDateOfBirth(User user, Errors errors) {
        Date today = new Date(System.currentTimeMillis());
        if (user.getDateOfBirth().compareTo(today) > 0) {
            errors.rejectValue("dateOfBirth", "NotValid.date.greaterThanToday");
        }
    }

    private void validateGithub(User user, Errors errors) {
        URLValidator urlValidator = new URLValidator();
        if (!urlValidator.isValid(user.getGithub(), null)) {
            errors.rejectValue("github", "NotValid.link");
        }
    }
}

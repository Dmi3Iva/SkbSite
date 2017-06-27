package com.kantiana.skb.validator;

import com.kantiana.skb.model.User;
import com.kantiana.skb.service.UserService;
import org.hibernate.validator.internal.constraintvalidators.hv.URLValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {
    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;
        // Проверка имени пользователя
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty");
        if (user.getUsername().length() < 2 || user.getUsername().length() > 32) {
            errors.rejectValue("username", "Size.user.username");
        }
        if (userService.findByUsername(user.getUsername()) != null) {
            errors.rejectValue("username", "Duplicate.user.username");
        }
        // Проверка пароля
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (user.getPassword().length() < 2 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.user.password");
        }
        if (!user.getPasswordConfirm().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirm", "Diff.user.passwordConfirm");
        }
        // Проверка ФИО
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "NotEmpty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "NotEmpty");
        // Проверка организации
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "organization", "NotEmpty");
        // Проверка github
        URLValidator urlValidator = new URLValidator();
        if (!urlValidator.isValid(user.getEmail(), null)) {
            errors.rejectValue("email", "NotValid.link");
        }
        // Проверка даты
        //TODO: Проверка формата даты?
        //TODO: Дата не может быть больше сегодняшней
        // Проверка email
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");
        //TODO: Проверка формата почты
    }
}

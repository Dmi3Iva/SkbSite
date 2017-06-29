package com.kantiana.skb.validator;

import com.kantiana.skb.model.Project;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

public class ProjectValidatorImpl implements ProjectValidator {
    @Override
    public void validateCreation(Project project, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty.project.name");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty.project.name");
    }

    @Override
    public void validateEditing(Project project, Errors errors) {

    }
}

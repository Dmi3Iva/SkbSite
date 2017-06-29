package com.kantiana.skb.validator;

import com.kantiana.skb.model.Project;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

@Component
public class ProjectValidatorImpl implements ProjectValidator {
    @Override
    public void validateCreation(Project project, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty.project.name");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "about", "NotEmpty.project.about");
    }

    @Override
    public void validateEditing(Project project, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty.project.name");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "about", "NotEmpty.project.about");
        if (!(0 <= project.getStatusPercent() && project.getStatusPercent() <= 100)) {
            errors.rejectValue("statusPercent", "NotValid.project.statusPercent");
        }
    }
}

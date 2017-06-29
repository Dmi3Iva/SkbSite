package com.kantiana.skb.validator;

import com.kantiana.skb.model.Project;
import org.springframework.validation.Errors;

public interface ProjectValidator {
    void validateCreation(Project project, Errors errors);

    void validateEditing(Project project, Errors errors);
}

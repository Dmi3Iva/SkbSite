package com.kantiana.skb.validator;

import com.kantiana.skb.model.News;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

@Component
public class NewsValidatorImpl implements NewsValidator {
    @Override
    public void validate(News news, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty.news.name");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "content", "NotEmpty.news.content");
    }
}

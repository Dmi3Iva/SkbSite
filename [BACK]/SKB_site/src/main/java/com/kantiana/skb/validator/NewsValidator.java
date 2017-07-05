package com.kantiana.skb.validator;

import com.kantiana.skb.model.News;
import org.springframework.validation.Errors;

public interface NewsValidator {
    void validate(News news, Errors errors);
}

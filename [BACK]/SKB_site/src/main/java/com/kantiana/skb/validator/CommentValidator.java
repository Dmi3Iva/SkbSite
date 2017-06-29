package com.kantiana.skb.validator;

import com.kantiana.skb.model.Comment;
import org.springframework.validation.Errors;

public interface CommentValidator {
    void validate(Comment comment, Errors errors);
}

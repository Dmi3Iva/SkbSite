package com.kantiana.skb.validator;

import com.kantiana.skb.model.Comment;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

@Component
public class CommentValidatorImpl implements CommentValidator {
    @Override
    public void validate(Comment comment, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "content", "NotEmpty.comment.content");
    }
}
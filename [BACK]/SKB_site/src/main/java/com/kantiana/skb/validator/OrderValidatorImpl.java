package com.kantiana.skb.validator;

import com.kantiana.skb.model.Order;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

@Component
public class OrderValidatorImpl implements OrderValidator {
    @Override
    public void validate(Order order, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty.order.name");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "content", "NotEmpty.order.content");
    }
}

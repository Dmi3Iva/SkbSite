package com.kantiana.skb.validator;

import com.kantiana.skb.model.Order;
import org.springframework.validation.Errors;

public interface OrderValidator {
    void validate(Order order, Errors errors);
}

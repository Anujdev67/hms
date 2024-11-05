package com.spring.hms.exception;

public class InvalidCredentialsException extends Exception {
    private static final long serialVersionUID = 1L;
    private String message;

    public InvalidCredentialsException(String message) {
        super();
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }
}

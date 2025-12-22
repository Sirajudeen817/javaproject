package com.pas.exceptions;

import org.springframework.web.bind.annotation.ControllerAdvice;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler({
        PGNotFoundException.class,
        CityNotFoundException.class,
        LocalityNotFoundException.class
    })
    public ResponseEntity<String> handleNotFound(RuntimeException ex) {
        return new ResponseEntity<>(ex.getMessage(), HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(PGOccupiedException.class)
    public ResponseEntity<String> handleOccupied(PGOccupiedException ex) {
        return new ResponseEntity<>(ex.getMessage(), HttpStatus.FORBIDDEN);
    }
}

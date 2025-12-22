package com.pas.exceptions;


public class PGNotFoundException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	 public PGNotFoundException(String message) {
	     super(message);
	 }
}

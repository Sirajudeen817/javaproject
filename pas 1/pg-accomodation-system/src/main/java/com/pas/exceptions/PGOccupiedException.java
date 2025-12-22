package com.pas.exceptions;

public class PGOccupiedException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	 public PGOccupiedException(String message) {
	     super(message);
	 }
}
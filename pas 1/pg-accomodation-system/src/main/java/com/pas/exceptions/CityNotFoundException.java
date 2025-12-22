package com.pas.exceptions;


public class CityNotFoundException extends RuntimeException {
	
	private static final long serialVersionUID = 1L;

	public CityNotFoundException(String message) {
		super(message);
	}
}


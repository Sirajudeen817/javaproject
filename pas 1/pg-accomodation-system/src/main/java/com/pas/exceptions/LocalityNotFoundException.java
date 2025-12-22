package com.pas.exceptions;

public class LocalityNotFoundException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public LocalityNotFoundException() {
	}

	public LocalityNotFoundException(String message) {
		super(message);
	}

	public LocalityNotFoundException(Throwable cause) {
		super(cause);
	}

	public LocalityNotFoundException(String message, Throwable cause) {
		super(message, cause);
	}

	public LocalityNotFoundException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

}

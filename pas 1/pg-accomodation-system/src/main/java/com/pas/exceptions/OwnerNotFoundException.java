package com.pas.exceptions;

public class OwnerNotFoundException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public OwnerNotFoundException() {
		super();
	}

	public OwnerNotFoundException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public OwnerNotFoundException(String message, Throwable cause) {
		super(message, cause);
	}

	public OwnerNotFoundException(String message) {
		super(message);
	}

	public OwnerNotFoundException(Throwable cause) {
		super(cause);
	}

	
}

package com.quizportal.util;

public class ValidationUtils {
    public static boolean isBlank(String s) {
        return s == null || s.trim().isEmpty();
    }
    public static boolean isEmail(String s) {
        return s != null && s.matches("^[\\w.%+-]+@[\\w.-]+\\.[A-Za-z]{2,}$");
    }
}

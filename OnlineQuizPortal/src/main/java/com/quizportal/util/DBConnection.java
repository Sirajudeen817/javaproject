package com.quizportal.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DBConnection {
    private static String URL;
    private static String USER;
    private static String PASS;

    static {
        try (InputStream in = DBConnection.class.getClassLoader().getResourceAsStream("db.properties")) {
            Properties props = new Properties();
            if (in == null) throw new RuntimeException("db.properties not found");
            props.load(in);
            URL = props.getProperty("db.url");
            USER = props.getProperty("db.username");
            PASS = props.getProperty("db.password");
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (IOException | ClassNotFoundException e) {
            throw new RuntimeException("Failed to load DB config", e);
        }
    }

    public static Connection getConnection() throws java.sql.SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
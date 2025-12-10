package com.quizportal.dao;

import com.quizportal.model.User;
import com.quizportal.util.DBConnection;

import java.sql.*;

public class UserDAO {
	public User findByEmail(String email) throws SQLException {
		String sql = "SELECT id,name,email,password_hash,is_admin FROM users WHERE email=?";
		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, email);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					User u = new User();
					u.setId(rs.getInt("id"));
					u.setName(rs.getString("name"));
					u.setEmail(rs.getString("email"));
					u.setPasswordHash(rs.getString("password_hash"));
					u.setAdmin(rs.getBoolean("is_admin"));
					return u;
				}
				return null;
			}
		}
	}

	public boolean emailExists(String email) throws SQLException {
		String sql = "SELECT 1 FROM users WHERE email=?";
		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, email);
			try (ResultSet rs = ps.executeQuery()) {
				return rs.next();
			}
		}
	}

	public int create(User u) throws SQLException {
		String sql = "INSERT INTO users(name,email,password_hash,is_admin) VALUES(?,?,?,?)";
		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPasswordHash());
			ps.setBoolean(4, u.isAdmin());
			int affected = ps.executeUpdate();
			if (affected > 0) {
				try (ResultSet keys = ps.getGeneratedKeys()) {
					if (keys.next()) {
						return keys.getInt(1);
					}
				}
			}
			return -1;
		}
	}
}

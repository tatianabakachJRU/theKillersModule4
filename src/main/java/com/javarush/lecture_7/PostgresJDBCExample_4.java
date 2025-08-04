package com.javarush.lecture_7;

import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDate;

public class PostgresJDBCExample_4 {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://localhost:5434/postgres";
        String user = "postgres";
        String password = "postgres";

        try (Connection connection = DriverManager.getConnection(url, user, password);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(
                     """
                     SELECT u.id, u.name, u.email,
                     p.bio, p.birth_date, p.create_at, p.is_active, p.height
                     FROM users u                           
                     LEFT JOIN profiles p ON u.id = p.user_id
                     """)) {

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String bio = resultSet.getString("bio");
                Date birthDate = resultSet.getDate("birth_date");
                Timestamp createAt = resultSet.getTimestamp("create_at");
                boolean isActive = resultSet.getBoolean("is_active");
                BigDecimal height = resultSet.getBigDecimal("height");
                System.out.println(id + " " + name + " " + email + " " + bio + " " + birthDate + " " + createAt + " " + isActive);
            }
        } catch (SQLException e) {
            System.out.println("Ошибка при работе с БД");
            e.printStackTrace();
        }
    }
}

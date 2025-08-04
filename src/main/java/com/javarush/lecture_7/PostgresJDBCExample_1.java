package com.javarush.lecture_7;

import java.sql.*;

public class PostgresJDBCExample_1 {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://localhost:5434/postgres";
        String user = "postgres";
        String password = "postgres";

        try (Connection connection = DriverManager.getConnection(url, user, password);
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT id, name, email FROM users"))
        {
            System.out.println("Подключение к Postgres успешно!");
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                System.out.println(id + " " + name + " " + email);
            }

            System.out.println("""
                     SELECT u.id, u.name, u.email,
                     p.bio, p.birth_date, p.create_at, p.is_active, p.height
                     FROM users u                           
                     LEFT JOIN profiles p ON u.id = p.user_id
                     """);
        } catch (SQLException e) {
            System.out.println("Ошибка при работе с БД");
            e.printStackTrace();
        }
    }
}

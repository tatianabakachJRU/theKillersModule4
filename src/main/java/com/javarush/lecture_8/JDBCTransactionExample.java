package com.javarush.lecture_8;

import java.math.BigDecimal;
import java.sql.*;

public class JDBCTransactionExample {
    private static final String url = "jdbc:postgresql://localhost:5434/postgres";
    private static final String user = "postgres";
    private static final String password = "postgres";

    public static void main(String[] args) {
        try (Connection connection = DriverManager.getConnection(url, user, password)) {
            connection.setAutoCommit(false);
            System.out.println("Транзакция начата.Автокомит отключен");
            try {
                String insertUser = "INSERT INTO users(name, email)\n" +
                        "VALUES (?, ?)\n" +
                        "RETURNING id;";
                try (PreparedStatement preparedStatement = connection.prepareStatement(insertUser,
                        Statement.RETURN_GENERATED_KEYS)) {
                    preparedStatement.setString(1, "Карина");
                    preparedStatement.setString(2, "karina@example.com");
                    int rowAffected = preparedStatement.executeUpdate();
                    if (rowAffected == 0) {
                        throw new SQLException("Не удалось вставить пользователя");
                    }

                    try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            int id = generatedKeys.getInt("id");
                            System.out.println("Пользователь ID: " + id);

                            String insertProfile = """
                                    INSERT INTO profiles(user_id, bio, birth_date, height, avatar) 
                                    VALUES (?, ?, ?, ?, ?);
                                    """;

                            try (PreparedStatement preparedStatement1 = connection.prepareStatement(insertProfile)) {
                                preparedStatement1.setInt(1, id);
                                preparedStatement1.setString(2, "Kotlin-разработчик, который читает много книг");
                                preparedStatement1.setDate(3, Date.valueOf("2000-09-08"));
                                preparedStatement1.setBigDecimal(4, BigDecimal.valueOf(160.00));
                                preparedStatement1.setObject(5, null);

                                preparedStatement1.executeUpdate();
                                System.out.println("Профиль создан для пользователя: " + id);
                            }
                        } else {
                            throw new SQLException("Не удалось получить id");
                        }
                    }
                }
                connection.commit();
                System.out.println("Транзакция прошла успешно");
            } catch (SQLException e) {
                try {
                    connection.rollback();
                    System.out.println("Танзакция отменена " + e.getMessage());
                } catch (SQLException ex) {
                    System.out.println("Ошибка при откате транзакции " + ex.getMessage());
                }
            }
        } catch (SQLException e) {
            System.out.println("Ошибка при работе с БД");
        }
        System.out.println("Соединение закрыто");
    }
}


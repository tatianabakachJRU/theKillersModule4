package com.javarush.lecture_7;

import java.sql.*;
import java.time.*;
import java.time.format.DateTimeFormatter;

public class PostgresJDBCExample_5 {
    private static final DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    private static final DateTimeFormatter DATE_TIME_ZONE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss XXX(VV)");

    public static void main(String[] args) {
        String url = "jdbc:postgresql://localhost:5434/postgres";
        String user = "postgres";
        String password = "postgres";

        try (Connection connection = DriverManager.getConnection(url, user, password);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery("""
                     SELECT u.id, u.name, u.email,
                     p.bio, p.birth_date, p.create_at, p.is_active, p.height,
                     p.created_date, p.created_time, p.created_timestamp, p.created_with_timezone
                     FROM users u                           
                     LEFT JOIN profiles p ON u.id = p.user_id
                     """)) {
            System.out.println("Подключение к Postgres успешно!");
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");

                String bio = resultSet.getString("bio");
                if (bio == null) {
                    System.out.println("Профиль не заполнен");
                    continue;
                }
                LocalDate birthDate = resultSet.getObject("birth_date", LocalDate.class);
                LocalDateTime createdAt = resultSet.getObject("create_at", LocalDateTime.class);
                LocalDate createdDate = resultSet.getObject("created_date", LocalDate.class);
                LocalTime createdTime = resultSet.getObject("created_time", LocalTime.class);
                LocalDateTime createdTimestamp = resultSet.getObject("created_timestamp", LocalDateTime.class);
                OffsetDateTime createdWithTimezone = resultSet.getObject("created_with_timezone", OffsetDateTime.class);

                System.out.println("День рождения:" + birthDate);
                System.out.println("Время создания:" + createdAt);
                System.out.println("Дата:" + createdDate);
                System.out.println("Время:" + createdTime);
                System.out.println("Дата и время: " + createdTimestamp);
                System.out.println("Дата и время c временной зоной:" + createdWithTimezone.atZoneSameInstant(ZoneId.of("Europe/Moscow")).format(DATE_TIME_ZONE_FORMATTER));
            }



        } catch (SQLException e) {
            System.out.println("Ошибка при работе с БД");
            e.printStackTrace();
        }
    }
}

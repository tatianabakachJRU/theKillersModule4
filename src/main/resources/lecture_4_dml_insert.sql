INSERT INTO user_profiles (user_id, bio, preferences, status, last_seen, avatar)
VALUES
-- Алексей (студент)
(
    1,
    'Изучаю Java и хочу стать бэкенд-разработчиком',
    '{
      "theme": "dark",
      "lang": "ru",
      "email_notifications": true,
      "course_suggestions": "weekly"
    }'::JSON,
    'active',
    NOW() - INTERVAL '2 hours',
    '\x89504e470d0a1a0a0000000d49484452000000010000000108060000001f15c4890000000d49444154789c636800000082008177a3a50000000049454e44ae426082'
),

-- Мария (студентка)
(
    2,
    'Студентка, осваиваю Python и Data Science',
    '{
      "theme": "light",
      "lang": "ru",
      "email_notifications": false,
      "dashboard_view": "compact"
    }'::JSON,
    'active',
    NOW() - INTERVAL '10 minutes',
    '\x89504e470d0a1a0a0000000d49484452000000010000000108060000001f15c4890000000d49444154789c636800000082008177a3a50000000049454e44ae426082'
),

-- Иван (студент)
(
    3,
    'Углублённо изучаю машинное обучение и DevOps',
    '{
      "theme": "dark",
      "lang": "en",
      "email_notifications": true
    }'::JSON,
    'active',
    NOW() - INTERVAL '1 day',
    '\x89504e470d0a1a0a0000000d49484452000000010000000108060000001f15c4890000000d49444154789c636800000082008177a3a50000000049454e44ae426082'
),

-- Ольга (преподаватель)
(
    4,
    'Преподаю Java и Frontend уже 7 лет. Люблю качественные проекты.',
    '{
      "theme": "light",
      "lang": "ru",
      "working_hours": "9:00-18:00",
      "auto_reply": true
    }'::JSON,
    'active',
    NOW(),
    '\x89504e470d0a1a0a0000000d49484452000000010000000108060000001f15c4890000000d49444154789c636800000082008177a3a50000000049454e44ae426082'
),

-- Дмитрий (преподаватель)
(
    5,
    'Data Science и DevOps — моя страсть. Пишу на Python и Rust.',
    '{
      "theme": "dracula",
      "lang": "en",
      "show_online_status": false
    }'::JSON,
    'active',
    NOW() - INTERVAL '5 hours',
    '\x89504e470d0a1a0a0000000d49484452000000010000000108060000001f15c4890000000d49444154789c636800000082008177a3a50000000049454e44ae426082'
),

-- Админ (Админов)
(
    6,
    'Системный администратор платформы. Отвечаю за стабильность и безопасность.',
    '{
      "theme": "dark",
      "lang": "ru",
      "alerts": ["security", "backup"]
    }'::JSON,
    'active',
    NOW(),
    '\x89504e470d0a1a0a0000000d49484452000000010000000108060000001f15c4890000000d49444154789c636800000082008177a3a50000000049454e44ae426082'
);



INSERT INTO payments (user_id, course_id, amount, currency, status, transaction_data, paid_at)
VALUES
-- Алексей (1) оплатил курс по Java
(
    1,
    1,
    199.99,
    'USD',
    'completed',
    '{
      "provider": "stripe",
      "payment_method": "card",
      "card_last4": "4242",
      "fee": 5.99,
      "ip": "192.168.1.10"
    }'::JSON,
    NOW() - INTERVAL '5 days'
),

-- Мария (2) оплатила курс по Python
(
    2,
    2,
    249.99,
    'USD',
    'completed',
    '{
      "provider": "paypal",
      "payment_method": "paypal",
      "email": "maria@example.com",
      "fee": 8.50
    }'::JSON,
    NOW() - INTERVAL '4 days'
),

-- Иван (3) оплатил курс по ML
(
    3,
    4,
    399.99,
    'USD',
    'completed',
    '{
      "provider": "stripe",
      "payment_method": "card",
      "card_last4": "8888",
      "fee": 12.00
    }'::JSON,
    NOW() - INTERVAL '3 days'
),

-- Мария (2) оплатила курс по React
(
    2,
    3,
    149.99,
    'USD',
    'completed',
    '{
      "provider": "stripe",
      "payment_method": "card",
      "card_last4": "4242",
      "fee": 4.50
    }'::JSON,
    NOW() - INTERVAL '2 days'
),

-- Алексей (1) — ошибка оплаты за DevOps
(
    1,
    5,
    299.99,
    'USD',
    'failed',
    '{
      "provider": "stripe",
      "payment_method": "card",
      "card_last4": "4242",
      "error": "insufficient_funds",
      "ip": "192.168.1.10"
    }'::JSON,
    NOW() - INTERVAL '1 day'
),

-- Дмитрий (5) — бесплатный курс (Git), оплачен символически
(
    5,
    8,
    0.00,
    'USD',
    'completed',
    '{
      "provider": "internal",
      "payment_method": "promo",
      "promo_code": "TEACHER2025"
    }'::JSON,
    NOW()
),

-- Платёж в ожидании (ещё не оплачен)
(
    3,
    2,
    249.99,
    'RUB',
    'pending',
    '{
      "provider": "yookassa",
      "payment_method": "sbp",
      "qr_id": "qr_12345",
      "expires_at": "2025-04-10T12:00:00Z"
    }'::JSON,
    NULL
);
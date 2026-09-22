CREATE TABLE t_recharge_detail4
(
    id BIGINT,
    user_id BIGINT,
    recharge_money DECIMAL(32, 2),
    city VARCHAR(20) NOT NULL,
    dt VARCHAR(20) NOT NULL
)
ENGINE=OLAP
DUPLICATE KEY(id)
PARTITION BY LIST (dt, city)
(
    PARTITION p202204_California VALUES IN
    (
        ("2022-04-01", "Los Angeles"),
        ("2022-04-01", "San Francisco"),
        ("2022-04-02", "Los Angeles"),
        ("2022-04-02", "San Francisco")
    ),
    PARTITION p202204_Texas VALUES IN
    (
        ("2022-04-01", "Houston"),
        ("2022-04-01", "Dallas"),
        ("2022-04-02", "Houston"),
        ("2022-04-02", "Dallas")
    )
)
DISTRIBUTED BY HASH(id);

CREATE TABLE t_city
(
    id BIGINT,
    city VARCHAR(20) NOT NULL
)
ENGINE=OLAP
DUPLICATE KEY(id)
PARTITION BY LIST (city)
(
    PARTITION p_beijing VALUES IN ("Beijing"),
    PARTITION p_other VALUES IN ("Chongqing", "Tianjin", NULL)
)
DISTRIBUTED BY HASH(id);

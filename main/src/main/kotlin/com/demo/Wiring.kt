package com.demo

import org.springframework.context.annotation.Configuration
import org.springframework.context.annotation.Import

@Configuration
@Import(
    DomainConfig::class,
    RestConfig::class,
    KafkaConsumerConfig::class,
    MySQLConfig::class,
    KafkaProducerConfig::class,
)
class Wiring
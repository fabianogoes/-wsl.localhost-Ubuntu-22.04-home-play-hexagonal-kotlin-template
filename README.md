# Arquitetura Hexagonal com Kotlin, Gradle e ArchUnit

## Projeto

```bash
mkdir hexagonal-kotlin-template
cd hexagonal-kotlin-template
```

**Estrutura**

```bash
mkdir -p domain/src/main/kotlin
mkdir -p domain/src/test/kotlin
mkdir -p main/src/main/kotlin
mkdir -p main/src/test/kotlin
mkdir -p primary/rest/src/main/kotlin
mkdir -p primary/rest/src/test/kotlin
mkdir -p primary/kafka-consumer/src/main/kotlin
mkdir -p primary/kafka-consumer/src/test/kotlin
mkdir -p secondary/mysql/src/main/kotlin
mkdir -p secondary/mysql/src/test/kotlin
mkdir -p secondary/kafka-producer/src/main/kotlin
mkdir -p secondary/kafka-producer/src/test/kotlin
```

**Gradle Build**

```bash
touch domain/build.gradle
touch main/build.gradle
touch primary/rest/build.gradle
touch primary/kafka-consumer/build.gradle
touch secondary/kafka-producer/build.gradle
touch secondary/mysql/build.gradle
```

### Gradle Build Files

- [./settings.gradle](./settings.gradle)
- [./build.gradle](./build.gradle)
- [./gradle.properties](./gradle.properties)
- [./domain/build.gradle](./domain/build.gradle)
- [./main/build.gradle](./main/build.gradle)
- [./primary/rest/build.gradle](./primary/rest/build.gradle)
- [./primary/kafka-consumer/build.gradle](./primary/kafka-consumer/build.gradle)
- [./secondary/kafka-producer/build.gradle](./secondary/kafka-producer/build.gradle)
- [./secondary/mysql/build.gradle](./secondary/mysql/build.gradle)

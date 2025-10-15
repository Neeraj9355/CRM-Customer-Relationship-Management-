# ===============================
# 🏗️ Step 1 — Build the application
# ===============================
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copy pom.xml and download dependencies first (for caching)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src

# Build application (skip tests for faster build)
RUN mvn clean package -DskipTests

# ===============================
# 🚀 Step 2 — Run the application
# ===============================
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Copy the built jar from previous stage
COPY --from=build /app/target/*.jar app.jar

# Expose port (Render will override this with $PORT)
EXPOSE 8080

# Set environment variable for Render dynamic port
ENV PORT=8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]

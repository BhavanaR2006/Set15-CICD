FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY App.java .
RUN javac App.java
EXPOSE 8080
CMD ["sh", "-c", "java App; exec tail -f /dev/null"]

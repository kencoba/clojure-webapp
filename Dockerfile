FROM java:8-alpine
MAINTAINER Your Name <you@example.com>

ADD target/uberjar/clojure-webapp.jar /clojure-webapp/app.jar

EXPOSE 3000

CMD ["java", "-jar", "/clojure-webapp/app.jar"]

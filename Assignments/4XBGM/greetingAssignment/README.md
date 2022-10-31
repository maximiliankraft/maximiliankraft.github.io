# Greeting Assignment
    
Implement a basic request-response mechanism in Spring to communicate via HTTP.

```http
--> request: GET /hello/{name}
<-- response:
        HTTP-Statuscode: 200
        Body: Hello, {name}
```

More infos on how to implement this here: https://spring.io/guides/gs/spring-boot/

The `{name}` part is a path Variable. You can read it's value by utilizing the `@PathVariable`-Annotation. Find out more here: https://www.baeldung.com/spring-pathvariable

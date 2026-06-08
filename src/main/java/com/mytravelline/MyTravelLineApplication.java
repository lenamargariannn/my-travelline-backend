package com.mytravelline;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class MyTravelLineApplication {

    public static void main(String[] args) {
        SpringApplication.run(MyTravelLineApplication.class, args);
    }
}

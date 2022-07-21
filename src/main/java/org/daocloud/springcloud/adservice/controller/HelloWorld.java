package org.daocloud.springcloud.adservice.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

@RestController
public class HelloWorld {

    @RequestMapping("/")
    public Mono<String> helloWorld(){
        return Mono.just("adservice-springcloud: hello world!");
    }

    @RequestMapping("/test1")
    public Mono<String> test1(){
        return Mono.just("This is a test 1 API.");
    }

    @RequestMapping("/test2")
    public Mono<String> test2(){
        return Mono.just("This is a test 2 API.");
    }
}

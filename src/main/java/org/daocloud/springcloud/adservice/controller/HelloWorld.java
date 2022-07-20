package org.daocloud.springcloud.adservice.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

/**
 * @author yangyang
 * @date 2022/3/4 下午4:34
 */
@RestController
public class HelloWorld {

    @RequestMapping("/")
    public Mono<String> helloWorld(){
        return Mono.just("adservice-springcloud: hello world!");
    }
}

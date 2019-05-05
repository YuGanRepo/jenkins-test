package com.glanway.jenkinstest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * .
 *
 * @author YuGan
 * @create 2019-05-05 15:46
 */
@RestController
@RequestMapping("/api")
public class HelloController {

  @GetMapping("/hello")
  public String hello() {
    return "hello world";
  }

  @GetMapping("/hello2")
  public String hello2() {
    return "hello world 2";
  }

  @GetMapping("/hello3")
  public String hello3() {
    return "hello world 3";
  }

}

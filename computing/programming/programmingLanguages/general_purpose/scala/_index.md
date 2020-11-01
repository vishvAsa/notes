+++
title = "+Scala"
+++

## Intro
- **Platform independence** - Scala bytecode is no different from Java bytecode. So, Scala shares the same properties as Java in terms of platform independence, speed, memory management, static typing etc..
- **paradigms** - functional programming (creating anonymous functions, passing higher order functions) along with object oriented programming.
- **conciseness** 
  - Scala is said to be significantly more concise than Java and slightly more concise than Python.
  - iteration - Scala's ability to pass function-objects make it concise to iterate over collections using foreach.
- **static typing** - compiler will not accept changes to the type of the variable by accepting values of different type.
- **complexity** - The language is more expressive, but that means it is bigger (relative to C for example).

## Type hierarchy
At the bottom of the type hierarchy (ie they extend everything) are the classes Null (which is the descendent of any descendent of AnyRef), Nothing (which is the descendent of any descendent of Any). null is an object of type Null. It can be cast to almost any type.

At the top of type hierarchy is the Any class, whose subtypes AnyVal is the ancestor of all basic types (Character, Int etc..) and AnyRef is an ancestor to all classes and introspection methods.
You can simply cast an Any to AnyRef.

## Ref
<div class="spreadsheet" fullHeightWithRowsPerScreen=8 src="scala.toml"> </div>  

## Json
<div class="spreadsheet" fullHeightWithRowsPerScreen=8 src="scala_json.toml"> </div>  


## Akka
<div class="spreadsheet" fullHeightWithRowsPerScreen=8 src="scala_akka.toml"> </div>  

## Log4s logback logging
Config: 

```
logback.xml
<configuration>
    <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
        <!-- encoders are assigned the type
     ch.qos.logback.classic.encoder.PatternLayoutEncoder by default -->
        <encoder>
            <pattern>%d{HH:mm:ss.SSS} [%thread] %-5level %logger{36} %line --- %msg%n</pattern>
        </encoder>
    </appender>
    <root level="debug">
        <appender-ref ref="STDOUT" />
    </root>
</configuration>
```

Usage  
```
def logger = LoggerFactory.getLogger("Main")
logger.info("x=" + x)
```

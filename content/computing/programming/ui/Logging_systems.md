+++
title = "Logging systems"

+++

Examples include various java logging frameworks including log4j.

## Requirements

One is to be able to log at various levels, usually named debug, info, error etc..

Log messages should be informative and customizable: printing things like the name of the function where it originates, the class-name, the line number, the time, the log-message level etc..

Logging is to have a simple, yet expressive syntax for constructing messages.

One is to be able to set logging levels for various modules at various levels, so as to filter out relatively unimportant messages out of the log.

One is to be able to direct the log messages of various modules to arbitrary files, web-services or consoles.
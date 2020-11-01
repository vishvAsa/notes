+++
title = "App script"
+++

## Intro
JavaScript cloud scripting language that provides easy ways to automate tasks across Google products and third party services and build web applications.

Location [here](script.google.com).

## Document
```
var doc = DocumentApp.create('Hello, world!');
```

## Email
```
  var email = Session.getActiveUser().getEmail();
var subject = doc.getName();
  var body = 'Link to your doc: ' + url;
  GmailApp.sendEmail(email, subject, body);
```
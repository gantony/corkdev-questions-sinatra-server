# Swagger for Sinatra

## Overview
This is a project to provide Swagger support inside the [Sinatra](http://www.sinatrarb.com/) framework.  You can find
out more about both the spec and the framework at http://swagger.io.  For more information about 
Wordnik's APIs, please visit http://developer.wordnik.com.

## Prerequisites
You need to install ruby 1.9.3 and the following gems:

```
sinatra
sinatra-cross_origin
```

## Getting started
This sample was generated with the [swagger-codegen](https://github.com/swagger-api/swagger-codegen) project.

```
rackup -p 4567 config.ru
```

In your [swagger-ui](https://github.com/swagger-api/swagger-ui), put in the following URL:

```
http://localhost:4567/swagger.yaml
```

## Known issues
For some reason sending the POST messages within swagger-ui does not work, but sending the exact same message with curl from the shell does work... Not sure what's happening here!


Voila!

# Webber

Given a controller and a route generator, create a bunch of corresponding
static HTML.

## Usage

    make

## Components

### Route Generator

An iterable which returns a tuple of ``url`` and content.


### Controller

Takes requests from the Route Generator and returns HTML.

TODO: How should a controller be called?


### Writer

Outputs values from the Route Generator into the appropriate file paths on the
filesystem.


# TODO

* Copy over static stuff
* Everything else

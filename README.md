# Steps

## 1

run `docker-compose build`

## 2

run `docker-compose run --rm --service-ports rails_dev`
note --rm will remove the container after you exit

## 3

run `rails new <APP_NAME> && cd <APP_NAME>`

## 4

run `bundle update && bundle install`

## 5

run `rails server -p $PORT -b 0.0.0.0`

And your off...

# Exit

ctrl+c
then `exit`
then `docker-compose down`

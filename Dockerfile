FROM golang:latest

WORKDIR /home/app

ENV PORT 3000

EXPOSE $PORT

RUN apt-get update -qq && apt-get install -y nodejs && apt-get install -y npm
RUN curl -L https://packagecloud.io/golang-migrate/migrate/gpgkey | apt-key add -
RUN echo "deb https://packagecloud.io/golang-migrate/migrate/ubuntu/ RUN(lsb_release -sc) main" > /etc/apt/sources.list.d/migrate.list
RUN apt-get update
RUN apt-get install -y migrate
RUN mkdir -p ${APP_NAME}
RUN cd ${APP_NAME}
RUN go mod init ${APP_NAME}
RUN go get github.com/felixge/httpsnoop
RUN go get github.com/go-mail/mail/v2
RUN go get github.com/joho/godotenv 
RUN go get github.com/julienschmidt/httprouter 
RUN go get github.com/lib/pq 
RUN go get github.com/tomasen/realip 
RUN go get golang.org/x/crypto 
RUN go get golang.org/x/time 
RUN go get gopkg.in/alexcesaro/quotedprintable.v3 
RUN go get gopkg.in/mail.v2


ENTRYPOINT [ "/bin/bash" ]
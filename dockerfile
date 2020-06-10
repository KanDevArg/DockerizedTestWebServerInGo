
#Drastically reduce the size of your DOCKER images 
#with MULTISTAGE builds

#builder stage
FROM golang:1.13-alpine as builder  
WORKDIR /go/src/app
COPY . /go/src/app
RUN go build -o DockerizedTestWebServerInGo .

FROM alpine
WORKDIR /app
COPY --from=builder /go/src/app /app/
CMD [ "./DockerizedTestWebServerInGo" ]


#367mb image
# FROM golang:1.13-alpine as builder  
# WORKDIR /go/src/app
# COPY main.go /go/src/app
# RUN go build -o webserver .

# FROM golang:1.13-alpine
# WORKDIR /app
# COPY --from=builder /go/src/app /app/
# CMD [ "./webserver" ]

#300mb image
# FROM golang:1.13-alpine
# WORKDIR /go/src/sebacode
# COPY main.go .
# # RUN echo $(ls -1 /go/src/sebacode)
# RUN go build -o webserver .
# CMD [ "./webserver" ]

#800mb image
# FROM golang:1.13
# WORKDIR /go/src/sebacode
# COPY main.go .
# # RUN echo $(ls -1 /go/src/sebacode)
# RUN go build -o webserver .
# CMD [ "./webserver" ]
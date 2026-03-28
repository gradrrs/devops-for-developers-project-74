FROM node:20.12.2

WORKDIR /app

COPY . .

RUN make setup

CMD ["make", "test"]

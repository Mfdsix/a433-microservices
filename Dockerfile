# Menggunakan base image Golang 1.15 versi Alpine yang ringan
FROM golang:1.15-alpine

# Menentukan working directory di dalam container
WORKDIR /go/src/github.com/dicodingacademy/karsajobs

# Mengaktifkan Go modules dan set environment variable port
ENV GO111MODULE=on
ENV APP_PORT=8080

# Menyalin file definisi dependency terlebih dahulu (untuk caching layer)
COPY go.mod .
COPY go.sum .

# Mengunduh dependencies
RUN go mod download

# Menyalin seluruh source code aplikasi ke dalam container
COPY . .

# Membuat direktori build dan melakukan kompilasi aplikasi
RUN mkdir /build; \
    go build -o /build/ ./...

# Mengekspos port 8080 agar bisa diakses
EXPOSE 8080

# Perintah yang dijalankan ketika container start
CMD ["/build/web"]

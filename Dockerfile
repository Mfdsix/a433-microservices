# Menggunakan Node.js 14 versi Alpine sebagai builder stage
FROM node:14.21-alpine as builder

# Menentukan working directory untuk proses build
WORKDIR /app

# Menyalin file package.json dan package-lock.json terlebih dahulu
COPY package*.json ./

# Menginstall dependencies npm
RUN npm install

# Menyalin seluruh source code frontend
COPY . .

# Melakukan build aplikasi frontend
RUN npm run build

# Stage kedua: Menggunakan Nginx versi Alpine untuk serving aplikasi
FROM nginx:stable-alpine

# Menyalin hasil build dari stage 'builder' ke direktori HTML Nginx
COPY --from=builder /app/dist /usr/share/nginx/html

# Menyalin konfigurasi Nginx custom
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Menyalin script entrypoint
COPY docker-entrypoint.sh /docker-entrypoint.sh

# Memberikan permission execute pada script entrypoint
RUN chmod +x /docker-entrypoint.sh

# Mengekspos port 8000
EXPOSE 8000

# Menentukan script yang dijalankan saat container start
ENTRYPOINT ["/docker-entrypoint.sh"]

# Perintah default untuk menjalankan Nginx di foreground
CMD ["nginx", "-g", "daemon off;"]
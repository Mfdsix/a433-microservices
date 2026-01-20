# Menggunakan image Node.js 18 versi Alpine yang ringan
FROM node:18-alpine

# Menetapkan direktori kerja di dalam container
WORKDIR /src

# Menyalin file package.json dan package-lock.json
COPY package*.json ./

# Menginstall dependensi production saja
RUN npm ci --only=production

# Menyalin seluruh kode sumber aplikasi
COPY . .

# Menjalankan aplikasi
CMD ["node", "index.js"]
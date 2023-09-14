# İlk aşama: Vue uygulamasını oluşturmak için Node.js tabanlı bir imaj kullanın
FROM node:14 AS build

# Çalışma dizinini /app olarak ayarlayın
WORKDIR /app

# Proje bağımlılıklarını kopyalayın ve yükleyin
COPY package*.json ./
RUN npm install

# Proje dosyalarını kopyalayın
COPY . .

# Uygulamayı yapın
RUN npm run build

# İkinci aşama: Nginx tabanlı hafif bir web sunucusu kullanarak derlenmiş Vue.js uygulamasını sunun
FROM nginx:1.21

# Nginx yapılandırma dosyasını değiştirin
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Önceki aşamada oluşturulan derlenmiş uygulamayı kopyalayın
COPY --from=build /app/dist /usr/share/nginx/html

# Nginx'i başlatın
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

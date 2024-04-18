# Sử dụng một base image có thể chứa ứng dụng Angular
FROM node:alpine AS builder

# Định nghĩa thư mục làm việc
WORKDIR /app

# Sao chép mã nguồn vào container
COPY . .

# Cài đặt dependencies và xây dựng ứng dụng
RUN npm install && npm run build --prod

# Sử dụng một base image nhẹ hơn để chạy ứng dụng Angular đã build
FROM nginx:alpine

# Sao chép các tệp build từ builder stage vào thư mục html của Nginx
COPY --from=builder /app/dist/angular-app-15.2 /usr/share/nginx/html

# Cấu hình cho Nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


# docker build -t huynhtrancntt/angular15.2:1.0.0 .
# docker run -p 80:80 huynhtrancntt/angular15.2:1.0.0
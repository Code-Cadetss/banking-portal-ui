# Step 1: Build Angular App
FROM node:18 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
# Copy the rest of the code and build
COPY . .
RUN NODE_OPTIONS="--max_old_space_size=4096" npm run build

# Step 2: Use Nginx to Serve Angular App
FROM nginx:alpine
COPY --from=build /app/dist/banking-portal/ /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
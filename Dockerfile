# --- Build stage ---
FROM node:20-alpine AS builder

WORKDIR /var/www/html/node-aws

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# --- Production stage ---
FROM node:20-alpine

WORKDIR /app

# ✅ This refers to the stage "builder" defined above
COPY --from=builder /var/www/html/node-aws/package*.json ./
COPY --from=builder /var/www/html/node-aws/dist ./dist

RUN npm install --only=production

EXPOSE 8585

CMD ["node", "dist/index.js"]

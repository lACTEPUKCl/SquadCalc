FROM node:20-bookworm AS builder

WORKDIR /app

COPY . .

RUN npm install  && \
  npm run build

FROM node:20-bookworm AS runner

WORKDIR /app
COPY --from=builder /app/dist .

RUN npm install -g serve

EXPOSE 5000
CMD ["serve", "-s", ".", "-l", "5000"]


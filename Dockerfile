FROM node:12 as builder

WORKDIR /usr/src/app
RUN npm install -g serve

COPY package*.json ./
RUN npm ci --only=production
COPY . .
ARG REACT_APP_COMPANY_NAME
ARG REACT_APP_DAILY_SUBDOMAIN
ARG REACT_APP_COMPANY_URL

ENV REACT_APP_COMPANY_NAME=$REACT_APP_COMPANY_NAME
ENV REACT_APP_DAILY_SUBDOMAIN=$REACT_APP_DAILY_SUBDOMAIN
ENV REACT_APP_COMPANY_URL=$REACT_APP_COMPANY_URL
ENV PORT=8080
RUN npm run build
CMD serve -s build

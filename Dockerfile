# Specify the base image
FROM nginx

# Set the maintainer label
LABEL maintainer="Desmondo desmondotutu93@gmail.com"

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy your website files to the working directory
COPY ./src/* /usr/share/nginx/html

# Expose port 80 for HTTP traffic
EXPOSE 80

# Set the default command to start nginx
CMD ["nginx", "-g", "daemon off;"]


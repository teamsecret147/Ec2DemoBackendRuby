# Sử dụng image Ruby (chọn phiên bản phù hợp với dự án của bạn)
FROM ruby:3.2.1

# Cài đặt Node.js và client cho PostgreSQL
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Thiết lập thư mục làm việc trong container
WORKDIR /myapp

# Sao chép Gemfile và Gemfile.lock vào container
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Cài đặt các gem cần thiết
RUN bundle install

# Sao chép toàn bộ mã nguồn vào container
COPY . /myapp

# Expose port 3000 cho ứng dụng Rails
EXPOSE 3000

# Lệnh khởi chạy server Rails khi container được chạy
CMD ["rails", "server", "-b", "0.0.0.0"]

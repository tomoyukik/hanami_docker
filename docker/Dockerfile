FROM ruby:2.6.3

RUN apt-get update && apt-get install sqlite3 libsqlite3-dev -y
RUN gem install bundler
ENV BUNDLE_PATH /app/vendor/bundle
WORKDIR /app

COPY ./entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 2300

CMD ["bundle", "exec", "hanami", "server"]

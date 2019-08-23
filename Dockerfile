FROM ruby:2.6.3

RUN gem install bundler
ENV BUNDLE_PATH /bookshelf/vendor/bundle
WORKDIR /bookshelf

COPY ./entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 2300

CMD ["bundle", "exec", "hanami", "server"]

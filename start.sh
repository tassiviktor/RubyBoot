RAILS_MAX_THREADS=5 \
WEB_CONCURRENCY=3 \
API_KEY_HEADER_FIELD=HTTP_X_API_KEY \
RAILS_ENV=development \
bundle exec puma -C config/puma.rb
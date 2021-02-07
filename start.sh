#!/bin/sh

if [ "${RAILS_ENV}" = "production" ]
then
   bundle exec rails assets:precompile
fi

bundle exec rails s -p ${PORT:-8080} -b 0.0.0.0
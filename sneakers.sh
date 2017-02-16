#!/bin/bash

RAILS_ENV=development WORKERS=LockoutsWorker nohup bundle exec rake sneakers:run2 --trace > log/sneakers.log 2>&1 &

.PHONY: run in stop mysql clean build

run:
	docker-compose run --rm -p 9000:9000 -p 8080:80 dev

in:
	docker exec -it $(shell docker-compose ps | grep _dev_run_ | cut -d" " -f 1) /bin/bash

tests:
	/usr/bin/php ./src/web/core/scripts/run-tests.sh --php /usr/bin/php \
	    --sqlite /tmp/test.sqlite \
	    --verbose --color natura_dpl

mysql:
	docker exec -it dpl-db mysql -h localhost -u root -pdrupal_dpl drupal_dpl

stop:
	docker-compose stop

clean:
	docker-compose down

build: clean
	docker-compose build dev

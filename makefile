VERSION=local

package c:
	rm -fr build dist *.spec
	
	pyinstaller app.py \
		--onefile \
		-n runpy
	
	mv dist/* .
	rm -fr build dist *.spec
		

install i: c
	sudo mv runpy /usr/local/bin/


build b:
	docker build . -t docker.io/brianwolf94/runpy:$(VERSION) --progress=plain

push p:
	docker push docker.io/brianwolf94/runpy:$(VERSION)

run r:
	docker run -it docker.io/brianwolf94/runpy:$(VERSION) 
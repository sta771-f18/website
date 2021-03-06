REMOTEUSER ?= mc301
HOST ?= saxon.stat.duke.edu
DIR ?= /web/isds/docs/courses/Fall18/sta771.01
REMOTE ?= $(REMOTEUSER)@$(HOST):$(DIR)

.PHONY: clean
clean:
	rm -rf docs/*

push:
	rsync -azv --delete  --exclude='.DS_Store'  docs/ $(REMOTE)

unbind:
	lsof -wni tcp:4000

serve:
	hugo server --watch

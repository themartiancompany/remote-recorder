#
# SPDX-License-Identifier: GPL-3.0-or-later

PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/remote-recorder
DATA_DIR=$(DESTDIR)$(PREFIX)/share/remote-recorder
BIN_DIR=$(DESTDIR)$(PREFIX)/bin

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard remote-recorder/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-remote-recorder install-doc

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

install-remote-recorder:

	install -vdm 755 "$(BIN_DIR)"
	install -vDm 755 remote-recorder/remote-recorder "$(BIN_DIR)"

.PHONY: check install install-doc install-remote-recorder shellcheck

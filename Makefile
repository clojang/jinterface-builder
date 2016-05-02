ERL_VERSION := $(shell erl -eval "io:format(erlang:system_info(system_version)),halt()" -noshell)
ERL_LIBS := $(shell erl -eval "io:format(code:root_dir()),halt()" -noshell)
JINTERFACE := $(shell ls -1 $(ERL_LIBS)/lib/|grep jinterface)
JINTERFACE_VER := $(strip $(subst \", , $(word 2, $(subst -, , $(JINTERFACE)))))
JINTERFACE_JAR := jinterface-$(JINTERFACE_VER).jar
JINTERFACE_BUILD := /tmp/jinterface/$(JINTERFACE_VER)
JINTERFACE_FILES := $(ERL_LIBS)/lib/jinterface-$(JINTERFACE_VER)/java_src/com/ericsson/otp/erlang/*.java
LOCAL_MAVEN := ~/.m2/repository

include resources/make/jinterface.mk

PROJ = jinterface-builder
PROJ_VERSION = 0.2.2
BUILD_BASE_DIR = /tmp/jinterface
ERL_VERSION := $(shell erl -eval "io:format(erlang:system_info(system_version)),halt()" -noshell)
ERL_LIBS := $(shell erl -eval "io:format(code:root_dir()),halt()" -noshell)
JINTERFACE := $(shell ls -1 $(ERL_LIBS)/lib/|grep jinterface)
JINTERFACE_VER_MAIN := $(strip $(subst \", , $(word 2, $(subst -, , $(JINTERFACE)))))
JINTERFACE_VER := $(JINTERFACE_VER_MAIN)
JINTERFACE_JAR := jinterface-$(JINTERFACE_VER).jar
JINTERFACE_BUILD := $(BUILD_BASE_DIR)/$(JINTERFACE_VER)
JINTERFACE_JAR_ABS_PATH :=  $(BUILD_BASE_DIR)/$(JINTERFACE_VER)/target/erlang-$(JINTERFACE_JAR)
JINTERFACE_FILES := $(ERL_LIBS)/lib/jinterface-$(JINTERFACE_VER_MAIN)/java_src/com/ericsson/otp/erlang/*.java
LOCAL_MAVEN := ~/.m2/repository

default: build-jinterface

include resources/make/jinterface.mk
include resources/make/meta.mk

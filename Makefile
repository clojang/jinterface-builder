PROJ = jinterface-builder
PROJ_VERSION = 0.2.0
BUILD_BASE_DIR = /tmp/jinterface
ERL_VERSION := $(shell erl -eval "io:format(erlang:system_info(system_version)),halt()" -noshell)
ERL_LIBS := $(shell erl -eval "io:format(code:root_dir()),halt()" -noshell)
JINTERFACE := $(shell ls -1 $(ERL_LIBS)/lib/|grep jinterface)
JINTERFACE_VER := $(strip $(subst \", , $(word 2, $(subst -, , $(JINTERFACE)))))
JINTERFACE_JAR := jinterface-$(JINTERFACE_VER).jar
JINTERFACE_BUILD := $(BUILD_BASE_DIR)/$(JINTERFACE_VER)
JINTERFACE_JAR_ABS_PATH :=  $(BUILD_BASE_DIR)/$(JINTERFACE_VER)/target/erlang-$(JINTERFACE_JAR)
JINTERFACE_FILES := $(ERL_LIBS)/lib/jinterface-$(JINTERFACE_VER)/java_src/com/ericsson/otp/erlang/*.java
LOCAL_MAVEN := ~/.m2/repository

include resources/make/jinterface.mk

show-files:
	jar tf $(JINTERFACE_JAR_ABS_PATH)

clojars:
	cd $(JINTERFACE_BUILD) && lein deploy clojars

show-versions:
	@echo "$(PROJ): $(PROJ_VERSION)"
	@echo "Erlang: $(ERL_VERSION)"
	@echo "JInterface: $(JINTERFACE_VER)"
	@echo "lein/JVM: $(shell lein version)"

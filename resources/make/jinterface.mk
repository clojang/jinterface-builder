build-jinterface: clean-jinterface-build
	@echo
	@echo "Building JInterface $(JINTERFACE_VER) against Erlang $(ERL_VERSION) ..."
	@echo
	mkdir -p $(JINTERFACE_BUILD)/src
	cp -r $(ERL_LIBS)/lib/jinterface-$(JINTERFACE_VER_MAIN)/java_src \
	 $(JINTERFACE_BUILD)/src/java
	cat ./resources/jinterface/project.clj.tmpl | \
	sed 's/{{VERSION}}/$(JINTERFACE_VER)/g' > \
	$(JINTERFACE_BUILD)/project.clj
	cd $(JINTERFACE_BUILD) && lein jar
	@zip -d $(JINTERFACE_JAR_ABS_PATH) com/ericsson/otp/erlang/*.class

jinterface-local: build-jinterface
	cd $(JINTERFACE_BUILD) && lein install

clean-jinterface-build:
ifeq ($(strip $(JINTERFACE_BUILD)),)
	echo
else
	rm -rf $(JINTERFACE_BUILD)
endif

clojars:
	cd $(JINTERFACE_BUILD) && lein deploy clojars

jinterface: build-jinterface clojars

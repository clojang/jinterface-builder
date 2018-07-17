build-jinterface: clean-jinterface-build
	@echo
	@echo "Building JInterface $(JINTERFACE_VER) against Erlang $(ERL_VERSION) ..."
	@echo
	mkdir -p $(JINTERFACE_BUILD)/src
	cp -r $(ERL_LIBS)/lib/jinterface-$(JINTERFACE_VER)/java_src \
	 $(JINTERFACE_BUILD)/src/java
	cat ./resources/jinterface/project.clj.tmpl | \
	sed 's/{{VERSION}}/$(JINTERFACE_VER)/g' > \
	$(JINTERFACE_BUILD)/project.clj
	cd $(JINTERFACE_BUILD) && lein jar

jinterface-local: build-jinterface
	cd $(JINTERFACE_BUILD) && lein install

clean-jinterface-build:
ifeq ($(strip $(JINTERFACE_BUILD)),)
	echo
else
	rm -rf $(JINTERFACE_BUILD)
endif

jinterface: build-jinterface clojars

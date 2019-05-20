show-files:
	jar tf $(JINTERFACE_JAR_ABS_PATH)

show-versions:
	@echo "$(PROJ): $(PROJ_VERSION)"
	@echo "Erlang: $(ERL_VERSION)"
	@echo "JInterface: $(JINTERFACE_VER)"
	@echo "lein/JVM: $(shell lein version)"

show-erl-libs:
	echo $(ERL_LIBS)

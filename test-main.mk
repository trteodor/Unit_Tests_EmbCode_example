UT_CC = gcc

#DEBUG = -O0 -g
UT_CFLAGS += -std=c99 -pedantic -Wall -Wextra -DUNITY_FIXTURE_NO_EXTRAS
# # These extended flags DO get included before any target build runs
UT_CFLAGS += -Wbad-function-cast
UT_CFLAGS += -Wcast-qual
UT_CFLAGS += -Wconversion
UT_CFLAGS += -Wformat=2
UT_CFLAGS += -Wmissing-prototypes
UT_CFLAGS += -Wold-style-definition
UT_CFLAGS += -Wpointer-arith
UT_CFLAGS += -Wshadow
UT_CFLAGS += -Wstrict-overflow=5
UT_CFLAGS += -Wstrict-prototypes
UT_CFLAGS += -Wswitch-default
UT_CFLAGS += -Wundef
UT_CFLAGS += -Wno-error=undef  # Warning only, this should not stop the build
UT_CFLAGS += -Wunreachable-code
UT_CFLAGS += -Wunused
UT_CFLAGS += -fstrict-aliasing
UT_CFLAGS += -fprofile-arcs 
UT_CFLAGS += -ftest-coverage -g -O0 -lgcov

UT_EXE_DIR = build/UnitTests/UTexe
BUILD_DIR = build/UnitTests
DOC_DIR = docs
OBJECTS :=
COVERAGE_SOURCEDIR :=

#######################################
# dependencies
#@@@@@TODO@@@@TODO
#######################################
# -include $(BUILD_DIR)%.d

include unit-tests/makefile

EXECUTE_TEST_PROGRAMS = $(TEST_PROGRAM)
OBJECTS_FOLDERS := $(addprefix $(BUILD_DIR)'/'UT_COMPILATION_OUTPUT'/',$(TEST_PROGRAM))



$(UT_EXE_DIR):
	mkdir -p $(UT_EXE_DIR)

$(BUILD_DIR): $(UT_EXE_DIR)
	mkdir -p $(BUILD_DIR)

$(OBJECTS_FOLDERS):
	@mkdir -p $@


define COLLECT_TEST_SOURCES

SRC :=
SRC+= third_party/Unity/extras/fixture/src/unity_fixture.c 
SRC+= third_party/Unity/src/unity.c   
SRC+= third_party/cmock/src/cmock.c  

INC_DIR :=
INC_DIR+= -Ithird_party/Unity/extras/fixture/src 
INC_DIR+= -Ithird_party/Unity/extras/memory/src 
INC_DIR+= -Ithird_party/Unity/src/ 
INC_DIR+= -Ithird_party/cmock/src/ 
INC_DIR+= -Ibuild//UnitTests/cmock


MOCKED_HEADER :=
MOCKED_SOURCE :=  
OBJECTS :=
#
#Include the ("Makefile") testing program on which the EXECUTE file will be created
#
-include unit-tests/$(1)/Makefile


OBJECTS = $$(addprefix $$(BUILD_DIR)/UT_COMPILATION_OUTPUT/$(1)/,$$(notdir $$(SRC:.c=.o)))
vpath %.c $$(sort $$(dir $$(SRC)))
UT_CFLAGS +=$$(INC_DIR)
endef





EXECUTE_COMPILATION :=

define CREATE_EXECTUE_FILES
EXECUTE_COMPILATION += $(UT_EXE_DIR)/$(1)

$(UT_EXE_DIR)/$(1): $(UT_EXE_DIR) $(OBJECTS)
	@/bin/echo
#	@/bin/echo $(UT_EXE_DIR) $$@ $(OBJECTS)
	$(UT_CC) $(OBJECTS) -o $$@ --coverage -g -O0 -lgcov

endef





define CREATE_OBJECTS
EXECUTE_COMPILATION += $(1) $(2)
$(1):
$(2): $(1)
	$(UT_CC) -c $$(UT_CFLAGS) -MMD -MP $(1) -o $$@
endef

define FOR_EACH_OBJECTS
$(foreach SRC,$(SRC),$(eval $(call CREATE_OBJECTS,$(SRC),$$(OBJECTS))))
endef

$(foreach test_program,$(TEST_PROGRAM),$(eval $(call COLLECT_TEST_SOURCES,$(test_program))) \
$(eval $(call FOR_EACH_OBJECTS,$(TEST_PROGRAM))) $(eval $(call CREATE_EXECTUE_FILES,$$(test_program))) )






$(EXECUTE_TEST_PROGRAMS):
	@/bin/echo
	@/bin/echo ----------------------------------------------------------------------------
	@/bin/echo ------------------------- $@ -------------------------
	@/bin/echo ----------------------------------------------------------------------------
	@$(UT_EXE_DIR)/$@
	@/bin/echo -------------------------

PATTERN:
	@/bin/echo ------------------------- 
#Header it's not source (%.c FILE)
	@/bin/echo Reminder - after each change in header files, please use: 'test-ra' '('Dependecies are on @TODO list')'
	@/bin/echo -------------------------

clean-test:
	-rm -fR $(BUILD_DIR)

clean-docs:
	-rm -fR docs

test-ra: clean-test createmock $(OBJECTS_FOLDERS) $(EXECUTE_COMPILATION) $(EXECUTE_TEST_PROGRAMS) coverage

test-s: $(EXECUTE_COMPILATION) $(EXECUTE_TEST_PROGRAMS) PATTERN

test: test-ra

$(DOC_DIR):
	@mkdir -p $@

coverage: $(DOC_DIR)
	@echo Generate HTML coverage report
	gcovr  -f $(COVERAGE_SOURCEDIR) --object-directory=$(BUILD_DIR) --html --html-details -o $(DOC_DIR)/coverage.html


#here must be the './' i rly dk why, the ruby leanguage is so stupid :( ;)
#
CMOCK_DIR = ./third_party/cmock

createmock: build/cmock/($(sort $(notdir $(MOCKED_HEADER))))

build/cmock/($(sort $(notdir $(MOCKED_HEADER)))): $(MOCKED_HEADER)
	@CMOCK_DIR=${CMOCK_DIR} ruby unit-tests/create_mock.rb $(<D)/$(%F)





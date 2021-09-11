

SRC+= unit-tests/SampleFileToUT_UnitTests/test_SFToUT.c   
SRC+= unit-tests/SampleFileToUT_UnitTests/test_runnerSFToUT.c 
SRC+= unit-tests/SampleFileToUT_UnitTests/test_main.c 


SRC+= Core/Src/SampleFileToUT.c 


INC_DIR+= -ICore/Inc/ 


COVERAGE_SOURCEDIR :=
COVERAGE_SOURCEDIR +=Core/Src/


MOCKED_HEADER +=  Core/Inc/AnotherSampleFile.h
MOCKED_HEADER +=  Core/Inc/SampleFileToUT.h


MOCKED_SOURCE +=  build//UnitTests/cmock/mock_AnotherSampleFile.c


SRC+= $(MOCKED_SOURCE)

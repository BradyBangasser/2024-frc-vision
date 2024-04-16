CROSS_PREFIX := aarch64-bullseye-linux-gnu-
CC := gcc
CXX := g++
STD := c++20

C_FLAGS := -Wall -I include -O3
LD_FLAGS := -O3 -pthread -Llib -Wl,--unresolved-symbols=ignore-in-shared-libs -Llib -lwpilibc -lwpiHal -lapriltag -lcameraserver -lntcore -lcscore -lopencv_gapi -lopencv_highgui -lopencv_ml -lopencv_objdetect -lopencv_photo -lopencv_stitching -lopencv_video -lopencv_dnn -lopencv_videoio -lopencv_imgcodecs -lopencv_aruco -lopencv_calib3d -lopencv_features2d -lopencv_imgproc -lopencv_flann -lopencv_core -lwpimath -lwpinet -lwpiutil -latomic -L share -lvs3407 -ltensorflowlite -lzbar

SRC := src
OUT := out
EXE := server

.PHONY: clean

C_OBJS := $(patsubst $(SRC)%, $(OUT)%.o, $(wildcard $(SRC)/*.c))
CXX_OBJS := $(patsubst $(SRC)%, $(OUT)%.o, $(wildcard $(SRC)/*.cpp))
SHARED := $(wildcard share/*.so)

$(EXE): $(C_OBJS) $(CXX_OBJS) 
	$(CROSS_PREFIX)$(CXX) $(LD_FLAGS) $(C_OBJS) $(CXX_OBJS) -o $(EXE)

$(OUT)/%.cpp.o: $(SRC)/%.cpp
	$(CROSS_PREFIX)$(CXX) $(C_FLAGS) -std=$(STD) -c -o $@ $<
$(OUT):
	mkdir $(OUT)

clean:
	rm -rf out/* $(EXE)
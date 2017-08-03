# We need to copy libSwiftScientificLibrary.dylib to this directory.
# Setting the LIB_PATH to ../build/debug doesn't work - I don't know why!

APP_NAME = SwiftScientificLibraryExample
LIB_NAME = SwiftScientificLibrary
LIB_PATH = ${CURDIR}
MODULE_PATH = ../build/debug
MOD_MAP_PATH = ../ModuleMaps
SOURCES = Sources/main.swift

all: 
	xcrun swiftc $(SOURCES) \
		-o $(APP_NAME) \
		-I$(MODULE_PATH) -I$(MOD_MAP_PATH) \
                -module-link-name $(LIB_NAME) \
		-L$(LIB_PATH) -l$(LIB_NAME) \
		-target x86_64-apple-macosx10.10 \
		-L/usr/local/opt/openblas/lib -lopenblas \
		-v


clean:
	rm -rf $(APP_NAME)

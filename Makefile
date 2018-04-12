BUILD_DIR        := build
MODULE_MAP_DIR   := ModuleMaps
EXT_LIBS         := -L/usr/local/opt/openblas/lib -lopenblas
MODULE_NAME      := SwiftScientificLibrary


# TODO - integrate the following tools into the build process:
# 	jazzy (a documentation generator) - requires project to be built using xcodebuild - boo
# 	Sourcery (a code generator, e.g. lomok for swift)
# 	
SWIFTPM_OPTIONS := --build-path $(BUILD_DIR)\
	    -Xswiftc -I -Xswiftc $(MODULE_MAP_DIR) \
	    -Xswiftc -module-link-name -Xswiftc $(MODULE_NAME) \
	    -Xcc -fcolor-diagnostics \
	    $(addprefix -Xswiftc ,$(EXT_LIBS)) \
	    -Xswiftc -v -Xlinker -v 

TARGET = build test

build:
	swift build -c debug $(SWIFTPM_OPTIONS) 2>&1 | tee swift_build.log
	swift build -c release $(SWIFTPM_OPTIONS) 2>&1 | tee -a swift_build.log

test:	build
	swift test \
	    --build-path $(BUILD_DIR) \
	    -Xlinker -L/usr/local/opt/openblas/lib -Xlinker -lopenblas \
	    -Xswiftc -I -Xswiftc $(MODULE_MAP_DIR) 2>&1 | tee swift_test.log 
	@cat swift_test.log  | xcpretty -t --color --report junit
	@cat swift_test.log  | xcpretty -t --color --report html
	@cat swift_test.log  | xcpretty -s --color
	@#@slather coverage --input-format profdata --cobertura-xml --output-directory build/reports/
	@lizard --xml Sources > build/reports/lizard-report.xml
	@swiftlint lint --path Sources > build/reports/Swiftlint.txt
	@tailor -f html Sources > build/reports/Tailor.html


clean:
	@rm -rf $(BUILD_DIR) swift_test.log swift_build.log

BUILD_DIR        := build
MODULE_MAP_DIR   := ModuleMaps
EXT_LIBS         := -L/usr/local/opt/openblas/lib -lopenblas
MODULE_NAME      := SwiftScientificLibrary

SWIFTPM_OPTIONS := --build-path $(BUILD_DIR)\
	    -Xswiftc -emit-library \
	    -Xswiftc -I -Xswiftc $(MODULE_MAP_DIR) \
	    -Xswiftc -module-link-name -Xswiftc $(MODULE_NAME) \
	    $(addprefix -Xswiftc ,$(EXT_LIBS)) \
	    -Xswiftc -v -Xlinker -v

TARGET = all test

lib:
	swift build -c debug  $(SWIFTPM_OPTIONS)
	@mv lib$(SwiftScientificLibrary)* $(BUILD_DIR)/debug/
	swift build -c release $(SWIFTPM_OPTIONS) 
	@mv lib$(SwiftScientificLibrary)* $(BUILD_DIR)/release/

test:
	swift test \
	    --build-path $(BUILD_DIR) \
	    -Xlinker -L/usr/local/opt/openblas/lib -Xlinker -lopenblas \
	    -Xswiftc -I -Xswiftc $(MODULE_MAP_DIR) 2>&1 | tee swift_build.log 
	@cat swift_build.log  | xcpretty -t --color --report junit
	@cat swift_build.log  | xcpretty -t --color --report html
	@cat swift_build.log  | xcpretty -s --color
	@#@slather coverage --input-format profdata --cobertura-xml --output-directory swift-reports
	@#@mv swift-reports/cobertura.xml swift-reports/coverage.xml
	@lizard --xml Sources > swift-reports/lizard-report.xml
	@swiftlint lint --path Sources > build/reports/Swiftlint.txt


clean:
	@rm -rf $(BUILD_DIR) swift_build.log

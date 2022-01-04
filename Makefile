TARGET=./build
ARCHS=amd64
LDFLAGS="-s -w"
GCFLAGS="all=-trimpath=${GOPATH}/src"
ASMFLAGS="all=-trimpath=${GOPATH}/src"
BINARY_NAME=myenv

current:
	@go build -ldflags=${LDFLAGS} -o ./${BINARY_NAME}; \
	echo "Done."

windows:
	@for GOARCH in ${ARCHS}; do \
		echo "Building for windows $${GOARCH} ..." ; \
		mkdir -p ${TARGET}/myenv-windows-$${GOARCH} ; \
		GOOS=windows GOARCH=$${GOARCH} go build -ldflags=${LDFLAGS} -gcflags=${GCFLAGS} -asmflags=${ASMFLAGS} -o ${TARGET}/myenv-windows-$${GOARCH}/${BINARY_NAME}.exe ; \
	done; \
	echo "Done."

linux:
	@for GOARCH in ${ARCHS}; do \
		echo "Building for linux $${GOARCH} ..." ; \
		mkdir -p ${TARGET}/myenv-linux-$${GOARCH} ; \
		GOOS=linux GOARCH=$${GOARCH} go build -ldflags=${LDFLAGS} -gcflags=${GCFLAGS} -asmflags=${ASMFLAGS} -o ${TARGET}/myenv-linux-$${GOARCH}/${BINARY_NAME} ; \
	done; \
	sudo cp ${TARGET}/myenv-linux-$${GOARCH}/${BINARY_NAME} /usr/bin/
	echo "Done. Copied the binary ${BINARY_NAME} to /usr/bin. Use ${BINARY_NAME} to run the application!"

darwin:
	@for GOARCH in ${ARCHS}; do \
		echo "Building for darwin $${GOARCH} ..." ; \
		mkdir -p ${TARGET}/myenv-darwin-$${GOARCH} ; \
		GOOS=darwin GOARCH=$${GOARCH} go build -ldflags=${LDFLAGS} -gcflags=${GCFLAGS} -asmflags=${ASMFLAGS} -o ${TARGET}/myenv-darwin-$${GOARCH}/${BINARY_NAME} ; \
	done; \
	echo "Done."

all: darwin linux windows

test:
	@go test -v -race ./... ; \
	echo "Done."

clean:
	@rm -rf ${TARGET}/* ; \
	echo "Done."
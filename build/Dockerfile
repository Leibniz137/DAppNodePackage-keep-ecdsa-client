FROM golang:1.16.2

ENV APPDIR /usr/src/app/
WORKDIR $APPDIR
COPY ./prepare.go $APPDIR
COPY ./go.mod $APPDIR
COPY ./go.sum $APPDIR

# disable cgo to fix this: `./entrypoint.sh: line 3: ./prepare: not found`
# see: https://stackoverflow.com/a/36308464/1527293
ENV CGO_ENABLED=0
RUN go get github.com/ethereum/go-ethereum/ethclient@v1.10.1 \
  && go get github.com/ethereum/go-ethereum/accounts@v1.10.1 \
  && go get github.com/ethereum/go-ethereum/accounts/keystore@v1.10.1 \
  && go build prepare.go

COPY ./config.toml.tmpl $APPDIR
COPY ./entrypoint.sh $APPDIR

FROM keepnetwork/keep-ecdsa-client:v1.6.0

ENV APPDIR /usr/src/app/
COPY --from=0 $APPDIR $APPDIR

WORKDIR $APPDIR

ENTRYPOINT ["./entrypoint.sh"]


DOCKER := docker
GO := go

GOLANGCI_VERSION := 1.55.2

test:
	$(GO) test ./...

lint:
	$(DOCKER) run --rm -v $(CURDIR):/app -v ~/.cache/golangci-lint/v$(GOLANGCI_VERSION):/root/.cache -w /app golangci/golangci-lint:v$(GOLANGCI_VERSION) golangci-lint run --fix

reviewable: test lint
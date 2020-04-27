.PHONY: all test

DUNEBUILD := dune build --profile dev --no-print-directory

all:
	@ $(DUNEBUILD) @all

test:
	@ $(DUNEBUILD) --force --display short @test

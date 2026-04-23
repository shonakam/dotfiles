#!/usr/bin/env bash

VERSION=9.12.2

asdf plugin add haskell
asdf install haskell $VERSION
asdf global haskell $VERSION
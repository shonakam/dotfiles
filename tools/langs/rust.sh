#!/usr/bin/env bash

VERSION=1.88.0

asdf plugin add $VERSION
asdf install rust $VERSION
asdf global rust $VERSION
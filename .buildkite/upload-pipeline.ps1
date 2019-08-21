#!/bin/bash -eu
#
# Upload pipeline steps to Buildkite
# buildkite-agent pipeline upload < "$(dirname $0)/pipeline.yml"
buildkite-agent pipeline upload .buildkite/pipeline.yml
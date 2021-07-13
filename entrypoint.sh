#!/bin/bash

# echo commands and exit with failure if any commands fail
set -ex

# make tmp directory to satisfy build
cd ..
mkdir tmp

# run build
/opt/st/stm32cubeide/stm32cubeide --launcher.suppressErrors -nosplash -application org.eclipse.cdt.managedbuilder.core.headlessbuild -data tmp -import $GITHUB_WORKSPACE -build all -no-indexer
build_ret=$?

# disable echo for summaries
set +x

# print summaries
echo build return $build_ret

status=$((build_ret))
echo exit status $status

exit $status


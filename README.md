steps-bash-script
=================

Saves it's input as a bash file and runs it. Roll your own, custom bash scripts with this Bitrise Step!

This Step is part of the [Open StepLib](http://www.steplib.com/), you can find its StepLib page [here](http://www.steplib.com/step/bash-script-runner)


## Input:
- Check the `step.yml` file.


## Notes:

- instead of `__INPUT_FILE__` you should now use the new `content` input to define the content of the script.
- **DEPRECATED** `__INPUT_FILE__` is a special Bitrise input. Bitrise will write the value into a file and provide the file's path for the Step instead of providing the value directly.

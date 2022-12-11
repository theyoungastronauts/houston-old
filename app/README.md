
# Houston App

### Setup

- [ ] [Install fvm](#install-fvm)
- [ ] [Configure Environment](#configure-environment)
- [ ] [Generate](#generate)


#### Install fvm
https://fvm.app/
See the .fvm/fvm_config.json for the required version of flutter

#### Configure Environment

```
touch assets/env/develop
touch assets/env/stage
touch assets/env/production
```
Then, copy the contents from `assets/env/example` for each of these. You can also only worry about the develop env for the time being but you'll still need to create the empty files OR update `lib/core/utils/env.dart` to remove references to these environments.

#### Generate
Run the code generator with this shortcut.
```
make gen
```
If you are unable to use make, alternatively you can just run the command in the make file:
```
fvm flutter packages pub run build_runner build --delete-conflicting-outputs
```

That should be all you need to get up and running. Make sure you are running the python service in your machine in order to interact with the API. 


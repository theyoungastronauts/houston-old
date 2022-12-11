phony: build_web_production, build_web_stage

gen:
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs

gen_watch:
	fvm flutter packages pub run build_runner watch --delete-conflicting-outputs

fix_gen:
	mkdir ./.dart_tool/flutter_gen
	echo "version: 1.0.0" > ./.dart_tool/flutter_gen/pubspec.yaml

build_web_production:
	fvm flutter build web --dart-define=ENV=production --release

build_web_stage:
	fvm flutter build web --dart-define=ENV=stage --release 

deploy_prod:
	make build_web_production && firebase use surf-music-prod && firebase deploy --only hosting

deploy_stage:
	make build_web_stage && firebase use surf-develop && firebase deploy --only hosting

gen_i18n:
	fvm flutter pub run intl_utils:generate

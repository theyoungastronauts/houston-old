# Houston


### Overview

Houston is a meta framework and project workflow tool for building fullstack applications in Python+Django for the backend and Dart+Flutter for the frontend.
The code base is very opinionated but still flexable to adjust to your preferences.


This is a work in progress project.

#### Workflow
Although this is a mono repo, it is recommended you clone it and then version control the service and app seperately. This is not required though.

#### Service
The service is built in Django and starts with a skeleton of a basic API service, including:
- Auth (`JTW Tokens + OTPs`)
- API CRUD (`Django Rest Framework`)
- Management (`Django Admin`)
- Sending Emails + SMS
- Media Management (`bitpack + boto3`)
- Workers (`celery + redis`)
- Postgres Database (can easily be updated)
- Environment Variables
- Docker for local dev
- CircleCI for deployments (can easily be swapped)
- And more 

The structure does follow the Django convention fairly closely, however has implemented some quality of life decisions in terms of folder structure.

It follows [The Twelve Factor App](https://12factor.net/) principles (ie. stateless application) and currently is setup to deploy to Heroku. However, it is portable enough to easily host anywhere. Eventually Houston will use Terraform for deployment configration.

Please see `service/README.md` for setup instructions

#### App
The app is built in Flutter and starts out as a fairly basic blog app to help demonstrate the ideologies, including:
- Auth (`jwt_decoder`)
- State Management (`riverpod`)
- Routing (`auth_route`)
- Networking (`dio`)
- Environment Variables (`shared_preferences`)
- Singletons (`get_it`)

Please see `app/README.md` for setup instructions.

#### CLI
The CLI is currently very basic yet powerful. Currently, it allows you to generate modules and features by configuring a blueprint (yaml file). By running the generate command it will build out the starting points for:

*Service*
- models
- admin configuration
- api urls, views, serializers, querysets, filters

*App*
- models
- services
- providers
- screens
- components

Please see `cli/README.md` for setup instructions.
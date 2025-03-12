# Todo app with mock API

This version of the app has been adapted to use a REST API for persistence.
Instead of writing an API I use [Mockoon](https://mockoon.com/).
It provides a really quick way to set up API endpoints for prototyping apps
when you don't have real API.

**NOTE: all data in Mockoon is stored in memory and disappears when you stop
the server.**

Click "File" and "Open local environment" then select `mockoon/todo.json` from
this repository.
Click the green play button to start the server.
You now got your API running.

Fire up the app with `flutter run` to try it out.

Communication with the API happens in `lib/data/api_data_source.dart`.
It is important that `Content-Type: application/json` since otherwise Mockoon
will just store your POST body as string.

There is also an alternative implementation of `DataSource` found in
`lib/data/fake_date_source.dart` that just simulates some delay instead of
sending the data anywhere.
You can swap between the two implementation from `lib/main.dart`.

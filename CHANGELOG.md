## 0.1.6

* Full storage object support 🎉
* **Breaking** `readStorageObject()` returns now `Future<StorageObject?>` instead of `Future<StorageObject>`. Future resolves with `null` in case there was no element found with given key.
* Adds submitting and listing leaderboard records (more WIP)
* Adds `updateAccount()` method
* Bumps dependencies and API client to latest versions

## 0.1.5

* Adds [Real-Time chat](https://heroiclabs.com/docs/nakama/concepts/chat)
* Fixed missing session passing on `writeStorageObject()` (issue with multiple clients)

## 0.1.4
* Adds `onError()` and `onDone()` callbacks to `NakamaWebsocketClient`

## 0.1.3
* Fixes that the given server key was ignored

## 0.1.2
* Fully implements all authentication methods
* Enhanced documentation and adds link to package

## 0.1.1
* Fixed analyzer issues on web platform
* **Breaking Change:** use `getNakamaClient()` instead of `NakamaBaseClient.adaptive()`

## 0.1.0
* First release
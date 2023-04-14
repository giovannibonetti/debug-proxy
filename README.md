# DebugProxy

## Setup

The only dependencies are Ruby, Rubygems and bundler.
```sh
bundle install
```

## Run

Set the BACK_END variable to the destination host and start a rackup application like this:
```sh
BACK_END=https://www.husky.io bundle exec rackup app.ru -p 3000
```

Result:
```
[2023-04-14 14:24:42] INFO  WEBrick 1.8.1
[2023-04-14 14:24:42] INFO  ruby 3.1.2 (2022-04-12) [arm64-darwin21]
[2023-04-14 14:24:42] INFO  WEBrick::HTTPServer#start: pid=73213 port=3000
```

## Testing

```sh
curl -i localhost:3000
```

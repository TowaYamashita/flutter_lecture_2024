# flutter_lecture_2024
## How to Setup

1. 以下のコマンドを実行して、fvm をインストールする
```shell
$ brew tap leoafarias/fvm
$ brew install fvm
```

> Windowsを使っている場合は、PowerShellで `choco install fvm` を代わりに実行してください。

2. 以下のコマンドを実行して、リポジトリを手元に落としてくる
```shell
$ git clone https://github.com/TowaYamashita/flutter_lecture_2024.git
``` 

3. 以下のコマンドを実行して、Flutterの特定のバージョンを落としてくる
```shell
$ cd flutter_lecture_2024
$ fvm install 3.7.3
$ fvm use 3.7.3
$ fvm flutter pub get
```

4. VSCodeで「flutter_lecture_2024」を開く

5. F5を押して、アプリケーションを起動する

# memo
- このリポジトリを zapp.run で使うためにわざと古いバージョン(Flutter 3.7.3)を使っています

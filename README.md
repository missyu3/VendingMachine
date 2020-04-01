# VendingMachine

## 課題内容
http://devtesting.jp/tddbc/?TDDBC大阪3.0%2F課題

## 開発体制
- leader
  - 松本  
- observer
  - 松尾
- driver
  - 大須賀
  - 高木

## 開発環境
`Ruby: 2.6.5`

###  インストール方法
1. 指定したRubyのバージョンのインストールコマンド
    ```
    rbenv install 2.6.5
    ```
1. インストールしたRubyを使用可能な状態にするコマンド
    ```
    rbenv rehash
    ```
1. Rubyバージョン切り替えコマンド
    ```
    rbenv global 2.6.5
    ```
1. バージョン確認コマンド
    ```
    ruby -v
    ```

## 開発リポジトリをローカルに落とす
リポジトリのクローン(初回のみ)

```
git clone 
```

## 開発の手順
1. GitHub上で実施するIssueを選ぶ
1. GitHub上で実施するIssueの担当者を自分に変更する
1. ローカルでDeveropブランチからブランチを作成する
    ```
    git checkout -bブランチ名
    ```
    - ブランチは下記のルールとする
      - Issueとブランチを１対１で紐付ける
      - Issue名称
        - IssueID + 何を行うか（英語）
1. 開発を行う。
    - 適宜コミットを行う。
    - コミットメッセージのルール
      - git commit -m 'Add コミットメッセージ'
        - 機能追加
          - Add
        - 機能修正
          - Updat
        - バグ修正
          - Fix
        - 削除
          - Remove
1. Issueに記載されている機能の実装が終了したら、GitHubにあげる。
    ```
    git push origin HEAD
    ```
1. GitHub上でPullRequestを行う。
1. もう片方のチームが確認を行い、Margeを行う。
  - Margeを行う際はコメントにclose #イシュIDをつける。

## 機能一覧
- 投入（金額）
- 総計の取得
- 払い戻し
- ジュースを格納する（ジュース）
- 自販機に格納されているジュース情報の取得
- 購入可能か判断する
- 購入処理
- 売り上げ金額を取得
- 釣り銭の出力
- 購入可能なもの一覧


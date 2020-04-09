# VendingMachine

## 課題内容
http://devtesting.jp/tddbc/?TDDBC大阪3.0%2F課題

## 開発
### 開発体制
- leader
  - 松本  
- observer
  - 松尾
- driver
  - 大須賀
  - 高木

- TeamA
  - 松尾
  - 高木
- TeamB
  - 松本
  - 大須賀

### 開発環境
`Ruby: 2.6.5`

####  インストール方法
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

### 開発リポジトリをローカルに落とす
リポジトリのクローン(初回のみ)

```
git clone 
```

### 開発の手順
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

## クラス図
![クラス図](document/class.png)

## 機能一覧
- 関数名
  - stock_info
- 内容
  - 自動販売機のなかにある飲み物情報を表示してくれる。
- 引数
  - なし
- 返り値
  - 自動販売機にある飲み物情報

- 関数名
  - insert
- 内容
  - 入金
- 引数
  - お金
- 返り値
  - 自動販売機が許可しているお金か

- 関数名
  - total
- 内容
  - 投入金額の合計
- 引数
  - なし
- 返り値
  - なし

- 関数名
  - refund
- 内容
  - 返金
- 引数
  - なし
- 返り値
  - 返金額

- 関数名
  - purchasable_drink_names
- 内容
  - 購入できるドリンク一覧
- 引数
  - なし
- 返り値
  - 購入できるドリンク名

- 関数名
パーチャサブる
  - purchasable?
- 内容
  - 引数のドリンクが購入できるか？
- 引数
  - ドリンク名
- 返り値
  - 購入できるか

- 関数名
パーちゃす
  - purchase
- 内容
  - 引数のドリンクを購入する
- 引数
  - ドリンク名
- 返り値
  - 購入できない場合　Nil
  - 購入できる場合　釣り銭


- 関数名
  - add_drink
- 内容
  - 在庫に飲み物情報を追加している
- 引数
  - 飲み物情報
- 返り値
  - なし

- 関数名
  - sale_amount
- 内容
  - 売上金
- 引数
  - なし
- 返り値
  - なし
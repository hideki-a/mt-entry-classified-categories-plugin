# EntryClassifiedCategoriesPlugin

記事（ウェブページ）が属するカテゴリ（フォルダ）の情報を、上位から下位へ順にコンテキストにセットします。ブロック内ではカテゴリ（フォルダ）に関するタグ（`MTCategoryLabel`や`MTCategoryArchiveLink`など）が使用できます。

## 提供するタグ

- MTEntryClassifiedCategories
- MTPageClassifiedFolders

タグ名が違うだけで処理は同一です。`level`モディファイアで任意の階層の情報が取得できます。

## サンプル

### フォルダ設定例

```
recipe
  western
    fish
    meat
  japanese
    fish
    meat
```

### MTML

```
<mt:Pages id="94">
<mt:PageClassifiedFolders><$mt:FolderLabel$><mt:Unless name="__last__"> > </mt:Unless></mt:PageClassifiedFolders>
</mt:Pages>
```

### 出力結果

```
recipe > western > fish 
```

## 本プラグインのコードについて

本プラグインのコードは、[Japanese plugin dev 2 2 · movabletype/Documentation Wiki](https://github.com/movabletype/Documentation/wiki/Japanese-plugin-dev-2-2)を参考にさせて頂きました。

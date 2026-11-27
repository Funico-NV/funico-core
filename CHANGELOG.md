# Changelog

## 3.0.0

### Breaking

- `Articlable.length` is renamed to `Articlable.itemLength`. It is the length that is part of the
  article key (ERP dimension `BE55DVDWFS`). Conformers must rename their property; `length` is now
  free for other meanings (such as the length on the item card, AX `InventTable.ADUExtraField3`).
- `Article.length` is renamed to `Article.itemLength`; the `length:` labels on `Article.init` are now
  `itemLength:`, and `Article.from(length:)` is now `Article.from(itemLength:)`.

`Article` still encodes and decodes the value under the key `"length"`, so stored configurations and
fixtures keep working unchanged.

-- Run once on an existing project to support 22KT products and rates.
alter table public.rate_card
  add column if not exists gold_22_factor numeric(8,5) not null default 0.91667 check (gold_22_factor >= 0);

alter table public.products
  drop constraint if exists products_purity_check;

alter table public.products
  add constraint products_purity_check check (purity in ('14', '18', '22'));

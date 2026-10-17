# Genshin-lore

A bilingual (French/English) catalog of Genshin Impact lore: characters, regions and affiliations, with the sources of each piece of information.

> **Unofficial fan project.** This project is not affiliated with or endorsed by HoYoverse.
> Genshin Impact and its content belong to their respective owners.
> Non-commercial. No game assets (images, audio, 3D models) are included.

## Status

Early development. The database schema is done. Starter data and queries come next, then the C core, a web API and a web frontend.

## Goals

- Browse the lore of characters, regions and affiliations, in French and English.
- Know where each piece of information comes from.
- Later: a web interface and a relationship graph.

## Repository structure

- `db/`: SQL scripts (schema, and later starter data)
- `docs/`: project notes and schema documentation
- `src/`: C source code (not started yet)

## Getting started

Requires MySQL 8.0 or later (the script uses a collation introduced in 8.0).

```
mysql -u <user> -p < db/<schema-file>.sql
```

Warning: the script drops existing tables of the `genshinlore` database before recreating them.

## Database

- `entite` is the parent table. `personnage`, `region` and `affiliation` are children that reuse its id.
- `nom` stores one name per entity and language.
- `histoire` stores one lore piece per row, per language. The same `ordre` means the same piece in every language.

Details and diagram: `docs/schema.md`.

## Roadmap

- [x] Phase 0: scoping
- [ ] Phase 1: database (schema done, starter data and queries to do)
- [ ] Phase 2: C core
- [ ] Phase 3: consolidation
- [ ] Phase 4: HTTP API
- [ ] Phase 5: web frontend
- [ ] Phase 6: more regions, tests, deployment

## Contributing

Not open to contributions yet. Content rules, for later: write lore in your own words, and never add game assets.

## License

<license for the code>. Text content: <license, if different>.

## Credits

Genshin Impact is a trademark of HoYoverse. Sources of the lore are credited per entry in the database.

# Vendoo Crosslisting Workflow

This project captures the repeatable workflow for creating clothing and accessory listings in Vendoo and preparing them for eBay, Poshmark, and Depop.

## Local layout

```text
Pictures/
├── AGENTS.md
├── VENDOO_CROSSLISTING.md
├── Listing Photos/                 # local-only; excluded from Git
│   └── MM-D-YY/
│       ├── 1/
│       ├── 2/
│       └── ...
├── scripts/
│   └── prepare_photos.sh
└── templates/
    ├── listing-record.md
    └── marketplace-copy.md
```

Each numbered subfolder is exactly one item. A folder may contain front/back views, labels, fabric tags, measurement photos, and flaw close-ups.

## Computer setup

Install or configure the following on the destination computer:

1. Codex desktop and a browser-control-capable Chrome extension.
2. Chrome with the Vendoo extension installed and connected.
3. Sign in manually to Vendoo, eBay, Poshmark, and Depop.
4. Configure the seller shipping address inside marketplace accounts. Do not put it in project files.
5. Confirm ship-from ZIP `32812` and marketplace account shipping defaults.
6. Install `ffmpeg` for lossless-enough orientation copies, plus Git and GitHub CLI if desired.
7. Clone the private repository, then restore `Listing Photos/` separately because photos are intentionally not versioned.

No password, cookie, token, API key, extension storage, or street address belongs in this repository.

## End-to-end listing procedure

### 1. Select and inspect

- Work on the next numeric folder unless directed otherwise.
- Count files and view every image.
- Identify brand, department, garment type, tagged size, material, color/pattern, construction details, measurements, and flaws.
- Determine which photo is the best lead image.

### 2. Prepare photos

- Make corrected copies rather than modifying originals.
- Rotate every sideways image and preserve upright images.
- Upload in this order when possible: front, alternate front, back, brand/size tag, care/fabric tag, details, measurements, flaws.
- Inspect every Vendoo thumbnail after upload. Photo rotation is not complete until the Vendoo thumbnails display upright.

Use `scripts/prepare_photos.sh` to copy and rotate a folder into `prepared-photos/`. The script accepts explicit `filename:rotation` pairs so Codex or the user makes the visual judgment rather than relying on unreliable camera metadata.

### 3. Find eBay sold comps

- Search sold and completed items, not active asking prices alone.
- Start with exact brand + item type + material/style + size.
- Broaden only when exact sold matches are absent.
- Note a representative sold range and exact-match examples.
- Price within the range based on condition, demand, and completeness of the listing.

### 4. Build the canonical record

Use `templates/listing-record.md`. The canonical facts feed every marketplace and prevent descriptions from drifting.

Naming conventions:

- Folder: numeric serial (`1`, `2`, `3`).
- SKU: `YYYYMMDD-NNN`, for example `20260903-006`.
- Prepared photo directory: `prepared-photos/<batch-date>/<serial>/`.
- Keep original filenames for upright copies. Rotated copies may use the original filename because they live in the separate prepared directory.

### 5. Create the Vendoo master item

Fill and save:

- Photos, title, description, brand, condition, colors, SKU, ZIP, quantity.
- Narrowest accurate category and size fields.
- Packed pounds/ounces and dimensions.
- Listing price and cost of goods when known (use `0` only when that is the user's established bookkeeping convention).
- Internal note with folder number, comp rationale, weight estimate, and blockers.

Wait until all media uploads finish before saving. A saved master item should show Status `Complete` and receive a permanent `/app/item/<id>` URL.

### 6. Complete eBay

- Title: factual keywords, strongest first, maximum 80 characters.
- Category: narrowest accurate choice.
- Required specifics: department, size, size type, style, and any category-dependent fields.
- Condition: accurate grade plus short condition description.
- Price: fixed price, Good 'Til Cancelled, Best Offer on.
- Shipping: buyer-paid calculated USPS Ground Advantage for clothing.
- Returns: 30 days, buyer-paid return shipping, money back.
- Save the form.

### 7. Complete Poshmark

- Use a readable, keyword-rich title and description.
- Select the narrowest category plus correct size scale and size.
- Keep unknown Original Price blank.
- Default to no shipping discount unless directed.
- Save the form.

### 8. Complete Depop

- Use concise style vocabulary appropriate to the item, without obscuring condition.
- Add up to five high-value search tags.
- Select exact category, size, brand, location, and parcel size.
- Use the safe parcel bracket above the estimated packed weight when near a boundary.
- Do not choose a false brand if the true brand is unavailable.
- Save the form.

### 9. Final QA and publishing

Review the Quality Gate in `AGENTS.md`. Then tell the user what is ready, the price, any warnings, and the marketplaces involved. Obtain explicit approval immediately before publishing. Save is routine; publishing is not.

## Current marketplace rules

| Marketplace | Price format | Shipping | Returns | Key limits |
|---|---|---|---|---|
| eBay | Fixed price / GTC / offers | Buyer-paid calculated USPS Ground Advantage for clothes | 30 days, buyer pays, money back | Title 80 chars; required specifics vary |
| Poshmark | Rounded listing price | No discount by default | Platform-managed | Title 80 chars; exact size scale required |
| Depop | Listing price | Depop USPS parcel bracket | Platform-managed | Five tags; exact brand from approved list |

Marketplace interfaces and policies can change. Verify current visible options when a saved default conflicts with these instructions.

## Error recovery playbook

### Form value looks filled but remains missing

The control likely requires a committed dropdown choice. Reopen it, select the exact option, save again, and confirm the warning disappeared.

### Save button disappears

Photo upload may still be running. Wait for the upload indicator to clear. If the URL remains `/new`, inspect Status; if it is `Complete`, wait briefly for the permanent item URL.

### Weight/dimensions are wrong

Re-enter fields explicitly in this order: quantity, pounds, ounces, length, width, height. Confirm each displayed value before saving and again in eBay.

### Marketplace category did not map

Open its category picker and search within the marketplace taxonomy. After choosing a category, wait for category-specific fields to load.

### Depop rejects the brand

Search for the exact brand. If absent, do not select a similar but different brand. Record the blocker and ask the user how they want to proceed.

### Browser or extension disconnects

Reconnect the Chrome extension and reuse the existing authenticated Chrome session. Do not export browser state. If login is absent, the user signs in manually.

## Unfinished work as of 2026-09-04

| Folder | Vendoo item ID | State | Remaining work |
|---|---|---|---|
| 1 | not recorded here | Published | None known |
| 2 | not recorded here | Published | None known |
| 3 | `NA6toBOy3yEoBITkNEaP` | Saved for eBay, Poshmark, Depop | Await explicit publish approval |
| 4 | `1xXjMzUAKRq2fz1ZRbsg` | eBay and Poshmark saved | Depop exact brand `Haley` unavailable; do not use a false brand. Recheck every photo orientation before publishing |
| 5 | `3UZK7zaqZ8RLE9Mz04nM` | Saved for eBay, Poshmark, Depop | Recheck/correct every Vendoo photo orientation, then await publish approval |
| 6 | `wGQiak4ZZcxUCBWSADY5` | Saved for eBay, Poshmark, Depop | Six sideways source photos were corrected before upload; await publish approval |

No folder 3-6 listing should be assumed public until its marketplace status confirms Listed.

## Moving to another computer

1. Push this project to a private GitHub repository.
2. Clone it on the destination computer.
3. Transfer the ignored `Listing Photos/` directory separately through an approved private channel.
4. Install the tools and browser extension described above.
5. Sign in manually to each service.
6. Open Vendoo and verify the saved items by ID.
7. Resume from the unfinished-work table and refresh statuses before making changes.

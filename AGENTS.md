# Standing Instructions for the Vendoo Crosslisting Project

## Mission

Turn each numbered photo folder into one accurate, saved Vendoo item prepared for eBay, Poshmark, and Depop. Optimize for speed without sacrificing accuracy. Never publish a listing without the user's action-time approval.

## Browser and account rules

- Use the user's connected Chrome browser for Vendoo and marketplace work because it contains the required signed-in sessions and the Vendoo extension.
- Reuse the existing browser and tab bindings when available. Do not open duplicate tabs unnecessarily.
- Never inspect, copy, export, print, or commit cookies, passwords, tokens, browser profiles, local storage, API keys, or other credentials.
- If authentication is missing, ask the user to sign in manually in Chrome and say when ready.
- Required accounts: Vendoo, eBay, Poshmark, and Depop. The Vendoo Chrome extension must be connected for marketplace publishing.
- Marketplace publication is an external side effect. Complete and save all forms first, summarize the listing, then obtain explicit confirmation immediately before clicking any List/Publish control.

## Item order and folder parsing

- Process folders in numeric order beneath `Listing Photos/<batch-date>/<serial>/` unless the user names another folder.
- Every file in one numbered folder belongs to one item. Never mix photos across folders.
- SKU format: `YYYYMMDD-NNN`, where `NNN` is the zero-padded folder serial. Use the current listing-work date unless the user specifies another convention.
- Always save the Vendoo master form and each marketplace form after editing.

## Photo rules

- Inspect every photo before upload for identity, brand, size, material, measurements, flaws, duplicates, and orientation.
- All photos must display upright in Vendoo. Check every uploaded thumbnail, not only the lead image.
- Correct rotation before completing the forms. Prefer generating corrected copies in `prepared-photos/` or a temporary directory; do not overwrite source photos.
- Keep originals out of Git. Never delete source photos.
- Preserve the user's photo order unless a clearly better lead image exists. Lead with a full, unobstructed front view.
- Include label, care tag, back view, measurements, and flaw close-ups when supplied.
- Do not hide, crop out, retouch away, or minimize flaws.
- Duplicate photos may remain only when they provide a useful alternate framing; otherwise omit the duplicate.

## Listing accuracy

- State only attributes supported by the photos, tags, or reliable comps. Do not invent model names, MSRP, age, fabric, measurements, or condition claims.
- Describe all visible flaws plainly and price accordingly.
- If a marketplace requires a brand that is not in its list, do not select a different brand merely to pass validation. Save what can be saved and report the blocker.
- Use `Pre-Owned - Good` / `Used - Good` when there is light normal wear and no obvious major flaw. Downgrade condition when flaws warrant it.
- Treat measurements as approximate and say they were taken flat.

## Pricing and comps

- Search eBay completed and sold listings using brand, item type, gender, size, material, color/pattern, and distinctive features.
- Prefer exact sold matches. If none exist, use several close sold comparables and record that the match was approximate.
- Ignore sponsored placeholders and clearly unrelated results.
- Set a competitive price consistent with condition. Record the comp rationale in Vendoo Internal Notes without copying copyrighted descriptions.

## Shipping defaults

- Clothing: buyer pays shipping; USPS Ground Advantage on eBay.
- Ship-from ZIP code: `32812`.
- Estimate packed weight conservatively from the garment and packaging. Avoid exceeding the selected bracket.
- Use realistic folded package dimensions, generally 12 x 10 x 3 inches for light clothing and 14 x 11 x 3 inches for heavier pants/jackets unless the item requires otherwise.
- Depop parcel size must cover the packed estimate: under 12 oz = Small, over 12 oz through under 1 lb = Medium, and heavier items = the next safe bracket.
- Do not store a street address in this repository. Shipping addresses must remain configured in marketplace accounts.

## Marketplace defaults

### eBay

- Use an SEO-focused title no longer than 80 characters.
- Use the most accurate category and fill all required item specifics.
- Fixed price, Good 'Til Cancelled, Allow Best Offer enabled.
- Calculated buyer-paid shipping via USPS Ground Advantage.
- Returns: 30 days, buyer pays return shipping, money back.
- Include a concise condition description.

### Poshmark

- Use a natural keyword-rich title no longer than 80 characters.
- Choose the narrowest accurate category and exact size scale/size.
- Use a clean description with brand, garment type, color, material, features, condition, flaws, and measurements.
- Do not invent Original Price. Leave it blank when retail price is unknown.
- Default discounted shipping: No Discount unless instructed otherwise.

### Depop

- Use a concise, style-aware description while keeping factual item details and flaws prominent.
- Add up to five useful search tags without spam.
- Choose the exact category, size, approved brand, and safe parcel bracket.
- If the exact brand is unavailable, report it rather than misrepresenting the item.

## Fast execution pattern

1. Read the folder once and analyze all photos as a set.
2. Correct all orientations in one batch.
3. Run one focused eBay sold-comp search.
4. Draft one canonical fact set and platform variants.
5. Upload all corrected photos once to the Vendoo master item.
6. Batch-fill master fields, category, package data, price, SKU, ZIP, and internal notes.
7. Wait for all media uploads to finish, then click Save.
8. Complete eBay, Poshmark, and Depop in sequence, filling only required and materially useful optional fields.
9. Save each marketplace form.
10. Perform one final validation pass for missing fields, weights, prices, categories, sizes, shipping, flaws, and photo orientation.
11. Ask for publish approval; publish only after confirmation.

## Quality gate

Before declaring an item ready, verify:

- Correct folder and photo count.
- Every photo upright in Vendoo.
- Brand, department, item type, size, color, fabric, and measurements match the photos.
- Visible flaws are disclosed.
- Weight uses pounds/ounces correctly and dimensions are not shifted into the wrong fields.
- Price and comp rationale are reasonable.
- SKU is unique and correctly formatted.
- eBay uses buyer-paid USPS Ground Advantage and the stated return policy.
- Poshmark and Depop use accurate categories and sizes.
- No required-field warnings remain, or any unavoidable blocker is explicitly reported.
- Vendoo master plus all completed marketplace forms were saved.
- Nothing has been published without confirmation.

## Error recovery

- If a form appears filled but remains missing, select a dropdown option rather than leaving typed text uncommitted.
- If selectors are ambiguous, use exact accessible labels and inspect the current form state before acting.
- If a page is still uploading or loading specifics, wait briefly and retry once; do not repeatedly click Save.
- If a tab becomes stale, obtain a fresh tab from the existing Chrome browser connection.
- If browser communication fails, reconnect the extension before restarting the listing.
- If Save does not navigate, inspect Status; `Complete` means the item may already be saved.
- If package values shift, explicitly recheck quantity, pounds, ounces, length, width, and height in that order.
- Never work around validation with inaccurate data.

## Repository hygiene

- Documentation, scripts, templates, and redacted status records may be committed.
- Listing photos, screenshots, browser state, credentials, personal street addresses, and logs must not be committed.
- Review `git status` and staged diffs before every commit and push.

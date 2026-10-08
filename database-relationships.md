# Database Relationships

- One artist can create many artworks.
- One customer can purchase many artworks.
- One artwork can appear in exhibitions.
- One exhibition can contain many artworks.
- One gallery can host many exhibitions.
- One sale belongs to one customer and one artwork.
- One sale can have payment records.

## Main Relationships

`artists 1 -> many artworks`

`customers 1 -> many sales`

`artworks 1 -> many sales`

`galleries 1 -> many exhibitions`

`exhibitions many <-> many artworks`

`sales 1 -> many payments`

# Himachal Transit Admin

This folder contains the admin UI for the Himachal Transit system.

## Getting Started

1. Install dependencies:
   ```bash
   cd himachal_transit/admin
   npm install
   ```
2. Run the admin UI:
   ```bash
   npm run dev
   ```
3. Open `http://localhost:3000` in your browser.

## Notes

- The admin dashboard uses Next.js App Router.
- It includes list pages for `Buses`, `Routes`, `Stops`, and `Assignments`.
- Data is currently fetched from the backend API at `http://localhost:3000` by default.
- You can override the API host with `NEXT_PUBLIC_API_URL` in `.env.local`.
- Authentication and editable management forms can be added once the backend auth flows are finalized.

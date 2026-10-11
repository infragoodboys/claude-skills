# Keys cloud sessions load from 1Password at startup.
# One line per variable: NAME=op://<vault>/<item>/<field>
# These are references, not secrets. The values stay in 1Password and are
# read with the service account in OP_SERVICE_ACCOUNT_TOKEN.
# Services with a claude.ai connector (Supabase, Vercel, Mercury, Stripe,
# QuickBooks, Linear, Fibery) don't need a key here. Add a line only for a
# CLI that needs its own token.
FLY_API_TOKEN=op://Agents/Fly/credential

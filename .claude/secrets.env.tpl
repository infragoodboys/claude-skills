# Keys cloud sessions load from 1Password at startup.
# One line per variable: NAME=op://<vault>/<item>/<field>
# These are references, not secrets. The values stay in 1Password and are
# read with the service account in OP_SERVICE_ACCOUNT_TOKEN.
# Services with a claude.ai connector (Stripe, QuickBooks, Linear, Fibery)
# don't need a key here.
SUPABASE_ACCESS_TOKEN=op://Agents/Supabase/credential
VERCEL_TOKEN=op://Agents/Vercel/credential
FLY_API_TOKEN=op://Agents/Fly/credential
MERCURY_API_TOKEN=op://Agents/Mercury/credential

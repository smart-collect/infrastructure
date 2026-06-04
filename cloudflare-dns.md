# Documentation Configuration DNS Cloudflare

## Enregistrements DNS à ajouter


| Type | Nom | Cible / Valeur | Description |
| :--- | :--- | :--- | :--- |
| **A** | api | 216.24.57.1 | Backend Node.js (Render IP) |
| **CNAME** | app | ://vercel-dns.com | Frontend Client (Vercel) |
| **CNAME** | entreprise | ://vercel-dns.com | Frontend Entreprise (Vercel) |
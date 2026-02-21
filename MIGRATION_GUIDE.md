# PrivChain.io Migration Guide (Old Repo -> New Org)

This runbook keeps the existing style while moving hosting ownership to `PrivChain/privchain-website`.

## Target State

- Domain: `privchain.io`
- Source repo: `PrivChain/privchain-website`
- Deployment: GitHub Pages (`.github/workflows/pages.yml`)
- Repository visibility: `public` (required for GitHub Pages on current plan)

## Cutover Steps

1. Validate new site in GitHub Pages temporary URL
- In `PrivChain/privchain-website` Settings -> Pages, ensure GitHub Actions is selected.
- Confirm the latest `Deploy Website` workflow succeeded.

2. Add custom domain in new repo
- Settings -> Pages -> Custom domain -> `privchain.io`.
- Keep `Enforce HTTPS` off until certificate is issued, then enable.
- If you receive \"custom domain already taken\", remove the domain from the old Pages site first, then retry.

3. Update DNS records at your DNS provider
- If apex uses A records for GitHub Pages, set to:
  - `185.199.108.153`
  - `185.199.109.153`
  - `185.199.110.153`
  - `185.199.111.153`
- If using `www`, set `www` CNAME to `privchain.github.io`.

4. Remove old repo domain binding
- In old source repo Pages settings, remove `privchain.io` custom domain.
- Disable old Pages deployment to prevent re-claiming the domain.

5. Verify cutover
- `dig privchain.io +short` resolves to expected target records.
- `curl -I https://privchain.io` returns `200` and new content.
- Verify certificate is issued for `privchain.io`:
  - `echo | openssl s_client -servername privchain.io -connect privchain.io:443 2>/dev/null | openssl x509 -noout -issuer -subject -dates`
- Then enable `Enforce HTTPS` in the new repo Pages settings.

## HTTPS Certificate Notes

- GitHub Pages provisions TLS certificates automatically after custom domain + DNS are correct.
- Certificate issuance can take several minutes after cutover.
- Do not finalize cutover until `subject=CN=privchain.io` is visible and `curl -I https://privchain.io` succeeds.

## Rollback

1. Re-add domain binding in old repo Pages settings.
2. Revert DNS records to old Pages target values.
3. Trigger old deployment workflow.

## Ownership Note

Keeping DNS and Pages settings in the new org centralizes control and removes coupling to the legacy source repository.

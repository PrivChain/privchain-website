# Analytics Setup (GA4 Baseline)

## 1) Add your GA4 Measurement ID

Edit:

- `assets/js/analytics-config.js`

Set:

- `gaMeasurementId: "G-XXXXXXXXXX"` -> your real GA4 ID

## 2) Verify tracking in GA4 Realtime

Open site pages:

- `/`
- `/signup.html`
- `/signup-success.html`

Confirm events appear in GA4 Realtime.

## 3) Conversion events already instrumented

The site now emits:

- `waitlist_form_view` on signup page view
- `waitlist_form_submit` when signup form submits
- `waitlist_signup` on `signup-success.html`

Use `waitlist_signup` as your primary conversion event.

## 4) Mark conversion in GA4

In GA4:

1. Admin -> Events
2. Find `waitlist_signup`
3. Toggle "Mark as conversion"

## 5) Future Google Ads link

When ready to run ads:

1. Link GA4 property to Google Ads
2. Import `waitlist_signup` as Ads conversion
3. Keep this event as primary optimization goal
